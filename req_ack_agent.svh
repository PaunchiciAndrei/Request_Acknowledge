class req_ack_agent extends uvm_agent;

    `uvm_component_utils (req_ack_agent)

    function new (string name = "req_ack_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction
bit get_is_master;
    req_ack_driver ra_driver;
    request_acknowledge_sequencer rq_seq;
    req_ack_monitor rq_mon;
    req_ack_driver_slv ra_driver_slv;

    virtual function void build_phase(uvm_phase phase);
        if(get_is_active()) begin
            rq_seq        = request_acknowledge_sequencer::type_id::create("rq_seq",        this);
            if(get_is_master)
            ra_driver     = req_ack_driver               ::type_id::create("ra_driver",        this);
            else
            ra_driver_slv = req_ack_driver_slv           ::type_id::create("ra_driver_slv", this);
        end

        rq_mon = req_ack_monitor::type_id::create("rq_mon", this);

    endfunction

    virtual function void connect_phase (uvm_phase phase);
        if(get_is_active())
        if(get_is_master)
        ra_driver.seq_item_port.connect(rq_seq.seq_item_export);
        else
        ra_driver_slv.seq_item_port.connect(rq_seq.seq_item_export);
    endfunction

endclass




