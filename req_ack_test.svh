class req_ack_test extends uvm_test;
    `uvm_component_utils(req_ack_test)

    function new (string name, uvm_component parent = null);
        super.new(name,parent);
    endfunction

    req_ack_enviroment top_env;

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        top_env = req_ack_enviroment::type_id::create("top_env",this);

    endfunction

    function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
    endfunction

    virtual task run_phase(uvm_phase phase);
        ra_sequence seq = ra_sequence::type_id::create("seq");
        phase.raise_objection(this);
        seq.start(top_env.m_ra_agent.rq_seq);
       // #10ns;
        //`uvm_info (get_type_name (), $sformatf ("Hello, World!"), UVM_INFO)
        phase.drop_objection (this);
    endtask

    
endclass