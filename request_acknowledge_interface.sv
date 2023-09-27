interface request_acknowledge_interface
(
    input clk,
    input rst_n
);

import uvm_pkg::*;

wire        req;
wire        ack;
wire [31:0] data;
wire [31:0] addr;
wire [31:0] data_1;

clocking ra_drv @(posedge clk);

output      req;
output      data;
input       ack;
output      addr;
output      data_1;

endclocking

clocking ra_monitor @(posedge clk);

input      req;
input      data;
input      ack;
input      addr;
input      data_1;
endclocking

clocking ra_drv_slv @(posedge clk);

input      req;
input      data;
output     ack;
input      addr;
input      data_1;
endclocking

endinterface
