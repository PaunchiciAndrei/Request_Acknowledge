class req_ack_test_2 extends uvm_test; 
    `uvm_component_utils(req_ack_test_2)
 
     function new (string name, uvm_component parent = null);
         super.new(name,parent);
     endfunction
 
     req_ack_enviroment top_env_1;
 
     virtual function void build_phase(uvm_phase phase);
         super.build_phase(phase);
 
         top_env_1 = req_ack_enviroment::type_id::create("top_env_1",this);
 
     endfunction
 
     function void start_of_simulation_phase(uvm_phase phase);
         super.start_of_simulation_phase(phase);
     endfunction
 
     virtual task run_phase(uvm_phase phase);
         ra_sequence_2 seq_1 = ra_sequence_2::type_id::create("seq_1");
         ra_sequence_3 seq_2 = ra_sequence_3::type_id::create("seq_2");
         phase.raise_objection(this);
         fork
         seq_1.start(top_env_1.m_ra_agent.rq_seq);
         seq_2.start(top_env_1.m_ra_agent_slave.rq_seq);
         join_any
         phase.drop_objection (this);
     endtask
 
     
    endclass