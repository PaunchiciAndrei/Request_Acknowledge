class AFVIP_scoreboard extends uvm_scoreboard;

    `uvm_component_utils (AFVIP_scoreboard)

    function new (string name ="AFVIP_scoreboard", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    uvm_analysis_imp #(AFVIP_item, AFVIP_scoreboard) afvip_imp;

    function void build_phase(uvm_phase phase);
        afvip_imp = new("afvip_imp", this);
    endfunction

    virtual function void write(AFVIP_item item);


       `uvm_info("write", $sformatf("Data received=0x0%h", data), UVM_MEDIUM)
        $display("%s", item.sprint());

    endfunction
endclass: AFVIP_scoreboard