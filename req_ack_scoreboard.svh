class req_ack_scoreboard extends uvm_scoreboard;
    bit[31:0] data_test;
    bit[31:0] data1=0;
    bit[31:0] data2=1;
    `uvm_component_utils (req_ack_scoreboard)

    function new (string name ="req_ack_scoreboard", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    uvm_analysis_imp #(request_acknowledge_item, req_ack_scoreboard) ra_imp;

    function void build_phase(uvm_phase phase);
        ra_imp = new("ra_imp", this);
    endfunction

    virtual function void write(request_acknowledge_item item);


      //  `uvm_info("write", $sformatf("Data received=0x0%h", data_1), UVM_MEDIUM)
        $display("%s", item.sprint());
        

        data_test= data1+data2;
        if(item.data_1==data_test)
        $display("Good!");


        else 
        $display("Bad!");
        $display("received %d EXP %d", item.data_1, data_test );
        `uvm_error (get_type_name (), $sformatf ("Fibonacci sequence mismatch. Received %d, Expected %d", item.data_1, data_test))
        
        data1=data2;
        data2=data_test;

    endfunction
endclass
