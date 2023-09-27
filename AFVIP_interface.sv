interface AFVIP_interface
    (
        input clk,
        input rst_n
    );
    
    import uvm_pkg::*;
    
    wire [31:0] data;
    
    clocking afvip_drv @(posedge clk);
    
    output      data;
    
    endclocking
    
    clocking afvip_monitor @(posedge clk);
    
    input      data;

    endclocking
    
    
    endinterface: AFVIP_interface