`include "mycpu.h"

module if_stage(
    input                           clk            ,
    input                           reset          ,
    // allwoin
    input                           ds_allowin     ,
    output                          fs_allowin     ,
    // from pfs
    input                           pfs_to_fs_valid,
    input  [`PFS_TO_FS_BUS_WD -1:0] pfs_to_fs_bus  ,
    // to ds
    output                          fs_to_ds_valid ,
    output [`FS_TO_DS_BUS_WD -1:0]  fs_to_ds_bus   ,

    // to pfs
    output          fs_inst_buff_full,

    // delay slot
    input           ds_is_branch,     // TODO

    // inst_ram interface
    input   [31:0]  inst_sram_data,
    input           inst_sram_data_ok,
    output          inst_sram_data_waiting,      // for pipeline clean

    //exception
    input           ws_eret,
    input           ws_ex,
    input [31:0]    cp0_epc
);

reg         fs_valid;
wire        fs_ready_go;
reg  [`PFS_TO_FS_BUS_WD -1:0] pfs_to_fs_bus_r;

wire        pfs_to_fs_inst_ok;
wire [31:0] pfs_to_fs_inst;
wire [31:0] fs_pc;
assign {
    pfs_to_fs_inst_ok,
    pfs_to_fs_inst,
    fs_pc
} = pfs_to_fs_bus_r;

wire fs_ex;
wire fs_bd;                     // TODO
wire [31:0] fs_badvaddr;

// ram
reg         fs_inst_buff_valid;
reg  [31:0] fs_inst_buff;
wire        fs_inst_ok;
wire [31:0] fs_inst;

assign fs_to_ds_bus = {
    fs_ex,       //97:97
    fs_bd,       //96:96
    fs_badvaddr, //95:64  
    fs_inst,     //63:32
    fs_pc        //31:0
};


// IF stage
assign fs_ready_go    = fs_inst_ok;
assign fs_allowin     = !fs_valid || fs_ready_go && ds_allowin;
assign fs_to_ds_valid =  fs_valid && fs_ready_go && !ws_eret && !ws_ex;
always @(posedge clk) begin
    if (reset) begin
        fs_valid <= 1'b0;
    end else if (fs_allowin) begin
        fs_valid <= pfs_to_fs_valid;
    end
end

// ram
always @ (posedge clk) begin
    if (reset) begin
        fs_inst_buff_valid  <= 1'b0;
        fs_inst_buff        <= 32'h0;
    end else if (!fs_inst_buff_valid && inst_sram_data_ok && !ds_allowin) begin
        fs_inst_buff_valid  <= 1'b1;
        fs_inst_buff        <= inst_sram_data;
    end else if (ds_allowin || ws_eret || ws_ex) begin
        fs_inst_buff_valid  <= 1'b0;
        fs_inst_buff        <= 32'h0;
    end
end

assign fs_inst_ok = pfs_to_fs_inst_ok || fs_inst_buff_valid || inst_sram_data_ok;
assign fs_inst = 
    pfs_to_fs_inst_ok ?     pfs_to_fs_inst  :
    fs_inst_buff_valid ?    fs_inst_buff    :
    inst_sram_data;

assign fs_inst_buff_full = fs_inst_buff_valid;

assign inst_sram_data_waiting    = fs_valid && !fs_inst_ok;

// lab9
// ? maybe need to move to pre_IF
wire addr_error;
assign addr_error = (fs_pc[1:0] != 2'b0);
assign fs_ex = addr_error && fs_valid;
assign fs_bd = ds_is_branch;    
assign fs_badvaddr = fs_pc;

endmodule
