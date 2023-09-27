class ra_sequence_1 extends uvm_sequence;
    `uvm_object_utils (ra_sequence_1)

    function new (string name = "ra_sequence_1");
        super.new (name);
    endfunction

    virtual task body();
        request_acknowledge_item item_1;
        bit [31:0] dat;
        
        item_1 = request_acknowledge_item::type_id::create("item_1");
        for(int i=0;i<20;i++)begin
        start_item(item_1);

        if(!(item_1.randomize() with {meta_data inside{[i:i]};addr%4==0;data_1>dat;}))
        
        `uvm_error(get_type_name(), "Rand error!")
        
        finish_item(item_1);;
        dat= item_1.data_1;
     end
    endtask: body
endclass: ra_sequence_1