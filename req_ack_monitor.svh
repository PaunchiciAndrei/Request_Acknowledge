class req_ack_monitor extends uvm_monitor;

`uvm_component_utils (req_ack_monitor)

virtual request_acknowledge_interface request_acknowledge;

uvm_analysis_port #(request_acknowledge_item) mon_analysis_port;

function new(string name= "req_ack_monitor", uvm_component parent= null);

super.new(name, parent);

endfunction

virtual function void build_phase(uvm_phase phase);
    super.build_phase (phase);

    mon_analysis_port = new("mon_analysis_port", this);

    if(!uvm_config_db #(virtual request_acknowledge_interface) ::get(this,"","request_acknowledge",request_acknowledge))
    begin
        `uvm_error(get_type_name(), "Interface not found!")
    end
endfunction

virtual task run_phase(uvm_phase phase);

    request_acknowledge_item data_object = request_acknowledge_item::type_id::create("data_object", this);

    forever begin


        @(posedge request_acknowledge.req);
        @(posedge request_acknowledge.ack);
        data_object.data_1 = request_acknowledge.data_1;
        data_object.addr   = request_acknowledge.addr;
        $display("%s", data_object.sprint());
        mon_analysis_port.write(data_object);
    end

endtask

endclass: req_ack_monitor