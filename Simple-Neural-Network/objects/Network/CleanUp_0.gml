for(var i = 0; i < ds_list_size(InputLayer); i++) {
	instance_destroy(ds_list_find_value(InputLayer, i));
}
for(var i = 0; i < ds_list_size(Hidden1Layer); i++) {
	instance_destroy(ds_list_find_value(Hidden1Layer, i));
}
for(var i = 0; i < ds_list_size(Hidden2Layer); i++) {
	instance_destroy(ds_list_find_value(Hidden2Layer, i));
}
for(var i = 0; i < ds_list_size(Hidden3Layer); i++) {
	instance_destroy(ds_list_find_value(Hidden3Layer, i));
}
for(var i = 0; i < ds_list_size(OutputLayer); i++) {
	instance_destroy(ds_list_find_value(OutputLayer, i));
}

ds_list_clear(InputLayer);
ds_list_destroy(InputLayer);

ds_list_clear(Hidden1Layer);
ds_list_destroy(Hidden1Layer);

ds_list_clear(Hidden2Layer);
ds_list_destroy(Hidden2Layer);

ds_list_clear(Hidden3Layer);
ds_list_destroy(Hidden3Layer);

ds_list_clear(OutputLayer);
ds_list_destroy(OutputLayer);

InputLayer = 0;
Hidden1Layer = 0;
Hidden2Layer = 0;
Hidden3Layer = 0;
OutputLayer = 0;
owner = noone;