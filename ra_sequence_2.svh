class ra_sequence_2 extends uvm_sequence;
    `uvm_object_utils (ra_sequence_2)

    function new (string name = "ra_sequence_2");
        super.new (name);
    endfunction

    virtual task body();
        request_acknowledge_item item_1;
        bit [31:0] dat1=0;
        bit [31:0] dat2=1;
        
        item_1 = request_acknowledge_item::type_id::create("item_1");
        for(int i=1;i<31;i++)begin
        start_item(item_1);

        if(!(item_1.randomize() with {meta_data inside{[i:i]};addr%16==0;data_1==dat1+dat2;}))
        
        `uvm_error(get_type_name(), "Rand error!")
        
        finish_item(item_1);
        dat1=dat2;
        dat2=item_1.data_1;

     end
    endtask: body
endclass: ra_sequence_2