class req_ack_driver_slv extends uvm_driver#(request_acknowledge_item);

    `uvm_component_utils (req_ack_driver_slv)

    virtual request_acknowledge_interface request_acknowledge_slv;

    function new(string name= "req_ack_driver_slv", uvm_component parent = null);
        super.new (name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db #(virtual request_acknowledge_interface) :: get (this,"","request_acknowledge",request_acknowledge_slv))begin
        `uvm_fatal (get_type_name(), "Didn't get handle to virtual interface!")
        end
    endfunction

    virtual task run_phase (uvm_phase phase);
        request_acknowledge_item req_item;
        super.run_phase(phase);

        forever begin
            `uvm_info(get_type_name(), $sformatf ("Writeing..."), UVM_MEDIUM)
            seq_item_port.get_next_item(req_item);
            $display("%s", req_item.sprint());
            request_acknowledge_slv.ra_drv_slv.ack<=0;
            @(posedge request_acknowledge_slv.ra_drv_slv.req);
            repeat(req_item.meta_data) @(request_acknowledge_slv.ra_drv_slv);
            request_acknowledge_slv.ra_drv_slv.ack<=1;
            @(request_acknowledge_slv.ra_drv_slv);
            request_acknowledge_slv.ra_drv_slv.ack<=0;
            seq_item_port.item_done();
            
            
        end
    endtask
endclass
