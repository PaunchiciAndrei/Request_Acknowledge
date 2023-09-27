module  request_acknowledge_top;
import uvm_pkg::*;
import request_acknowledge_package::*;

`include "uvm_macros.svh"

bit clk;
bit rst_n;
reg ack;
reg req;
reg [31:0]data;
reg [31:0]data_1;
reg [31:0]addr;

initial begin
    clk=1;
    forever
   #5 clk=!clk;
end

initial begin
    rst_n=0;

    #32 rst_n = !rst_n;
end


//assign data = request_acknowledge.data;


assign request_acknowledge.ack = request_acknowledge_slv.ack;
assign request_acknowledge_slv.req = request_acknowledge.req;
assign request_acknowledge_slv.addr = request_acknowledge.addr;
assign request_acknowledge_slv.data_1 = request_acknowledge.data_1;

assign ack = request_acknowledge_slv.ack;
assign req = request_acknowledge.req;
assign addr = request_acknowledge.addr;
assign data_1 = request_acknowledge.data_1;

request_acknowledge_interface request_acknowledge(
    .clk   (clk),
    .rst_n (rst_n)
);
request_acknowledge_interface request_acknowledge_slv(
    .clk   (clk),
    .rst_n (rst_n)
);

initial begin
    uvm_config_db #(virtual request_acknowledge_interface) :: set(null, "*.m_ra_agent.*","request_acknowledge", request_acknowledge);
    uvm_config_db #(virtual request_acknowledge_interface) :: set(null, "*.m_ra_agent_slave.*","request_acknowledge", request_acknowledge_slv);
    run_test("req_ack_test_2");
end

endmodule