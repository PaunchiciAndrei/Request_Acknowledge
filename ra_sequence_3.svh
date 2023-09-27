class ra_sequence_3 extends uvm_sequence;
    `uvm_object_utils (ra_sequence_3)

    function new (string name = "ra_sequence_3");
        super.new (name);
    endfunction

    virtual task body();
        request_acknowledge_item item_1;
        item_1 = request_acknowledge_item::type_id::create("item_1");
        forever begin
        start_item(item_1);

        if(!(item_1.randomize() with {meta_data inside{[1:31]};}))
        
        `uvm_error(get_type_name(), "Rand error!")
        
        finish_item(item_1);

     end
    endtask: body
endclass: ra_sequence_3