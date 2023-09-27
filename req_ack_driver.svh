class req_ack_driver extends uvm_driver#(request_acknowledge_item);

    `uvm_component_utils (req_ack_driver)

    virtual request_acknowledge_interface request_acknowledge;

    function new(string name= "req_ack_driver", uvm_component parent = null);
        super.new (name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db #(virtual request_acknowledge_interface) :: get (this,"","request_acknowledge",request_acknowledge))begin
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

            request_acknowledge.ra_drv.req <=1;
            request_acknowledge.ra_drv.data<= req_item.data;
            request_acknowledge.ra_drv.data_1<= req_item.data_1;
            request_acknowledge.ra_drv.addr<= req_item.addr;
            @(posedge request_acknowledge.ra_drv.ack);
            request_acknowledge.ra_drv.req<=0;
            repeat(req_item.meta_data) @(request_acknowledge.ra_drv);
            seq_item_port.item_done();
            
            
        end
    endtask
endclass



