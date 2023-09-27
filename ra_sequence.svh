class ra_sequence extends uvm_sequence;
    `uvm_object_utils (ra_sequence)

    function new (string name = "ra_sequence");
        super.new (name);
    endfunction

    virtual task body();
        request_acknowledge_item item;
        int s=0;
        item = request_acknowledge_item::type_id::create("item");
        for(int i=0;i<20;i++)begin
        start_item(item);

        if(!(item.randomize() with {meta_data inside{[s:s]};data==i;}))
        s++;
        `uvm_error(get_type_name(), "Rand error!")
        finish_item(item);; end
    endtask: body
endclass: ra_sequence