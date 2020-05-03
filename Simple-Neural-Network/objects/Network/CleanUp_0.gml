for(var i = 0; i < array_length_1d(InputLayer); i++) {
	instance_destroy(InputLayer[i]);
}
for(var i = 0; i < array_length_1d(Hidden1Layer); i++) {
	instance_destroy(Hidden1Layer[i]);
}
for(var i = 0; i < array_length_1d(Hidden2Layer); i++) {
	instance_destroy(Hidden2Layer[i]);
}
for(var i = 0; i < array_length_1d(Hidden3Layer); i++) {
	instance_destroy(Hidden3Layer[i]);
}
for(var i = 0; i < array_length_1d(OutputLayer); i++) {
	instance_destroy(OutputLayer[i]);
}

InputLayer = 0;
Hidden1Layer = 0;
Hidden2Layer = 0;
Hidden3Layer = 0;
OutputLayer = 0;
owner = noone;