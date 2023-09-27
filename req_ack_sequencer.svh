class request_acknowledge_sequencer extends uvm_sequencer#(request_acknowledge_item);

`uvm_component_utils(request_acknowledge_sequencer)

function new(string name = "req_ack_sequencer", uvm_component parent);
    super.new(name, parent);
endfunction

endclass: request_acknowledge_sequencer