`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/14 20:49:15
// Design Name: 
// Module Name: ir_reg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "defines.v"

// 将指令地址打一拍输出到译码模块
module if_id(

    input   wire                    clk         ,
    input   wire                    rst_n       ,
    
    input   wire[2:0]               hold_flag_i ,//控制暂停的输入信号。
    
    input   wire[`INT_BUS]          int_flag_i  ,//输入的中断标志，用于指示是否有中断发生。
    output  reg [`INT_BUS]          int_flag_o  ,//输出的中断标志，用于指示是否有中断发生。
    
    input   wire[`INST_DATA_BUS]    ins_i       , //输入指令数据。
    input   wire[`INST_ADDR_BUS]    ins_addr_i  ,//输入的指令地址。
    
    output  reg[`INST_DATA_BUS]     ins_o       , //输出的指令数据。
    output  reg[`INST_ADDR_BUS]     ins_addr_o   //输出的指令地址。
    
    );
    
    reg[2:0]               hold_flag_reg; //用于暂存hold_flag_i信号
    
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            hold_flag_reg <= `HOLD_NONE;//`define HOLD_NONE 3'b000
        end
        else begin
            hold_flag_reg <= hold_flag_i;
        end
    end
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            ins_addr_o <= `RESET_ADDR;
            int_flag_o <= `INT_NONE;//`define INT_NONE 8'b0000_0000
        end
        else if(hold_flag_i >= `HOLD_IF_ID) begin
            ins_addr_o <= `RESET_ADDR;
            int_flag_o <= `INT_NONE;
        end
        else begin
            ins_addr_o <= {ins_addr_i[31:2], {2'b0}};
            int_flag_o <= int_flag_i;
        end
    end
    
    // 因为从rom中读取的指令本身就会延迟一拍，所以无需延迟
    always @ (*) begin
        if(hold_flag_reg >= `HOLD_IF_ID) begin
            ins_o = `INS_NOP;
        end
        else begin
            ins_o = ins_i;
        end
    end
    
endmodule
