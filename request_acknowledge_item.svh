class AFVIP_item extends uvm_sequence_item;

rand bit [31:0] data;
rand bit [31:0] data_1;
rand bit [31:0] data_2;
rand bit [31:0] addr;
rand int meta_data;
/*constraint c_data{
  data<50;
}


constraint c_addr{
  addr%4==0;
}



constraint c_meta_data{
    meta_data<=31;
};
*/


`uvm_object_utils_begin(AFVIP_item)
  `uvm_field_int       (data,        UVM_DEFAULT)
  `uvm_field_int       (meta_data,   UVM_DEFAULT)
  `uvm_field_int       (data_1,      UVM_DEFAULT)
  `uvm_field_int       (data_2,      UVM_DEFAULT)
  `uvm_field_int       (addr,        UVM_DEFAULT)
`uvm_object_utils_end

function new (string name="");

super.new(name);

endfunction: new

endclass: AFVIP_item
