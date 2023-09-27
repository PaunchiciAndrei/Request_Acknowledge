class req_ack_enviroment extends uvm_env;
    `uvm_component_utils(req_ack_enviroment)

    req_ack_agent m_ra_agent;
    req_ack_scoreboard ra_score;
    req_ack_agent m_ra_agent_slave;

    function new(string name="req_ack_enviroment", uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        m_ra_agent = req_ack_agent::type_id::create("m_ra_agent",this);
        m_ra_agent.get_is_master =1;
        ra_score = req_ack_scoreboard::type_id::create("ra_score",this);
        m_ra_agent_slave= req_ack_agent::type_id::create("m_ra_agent_slave",this);
        m_ra_agent_slave.get_is_master =0;
    endfunction

    virtual function void connect_phase (uvm_phase phase);
        super.connect_phase(phase);
        m_ra_agent.rq_mon.mon_analysis_port.connect(ra_score.ra_imp);
    endfunction
endclass