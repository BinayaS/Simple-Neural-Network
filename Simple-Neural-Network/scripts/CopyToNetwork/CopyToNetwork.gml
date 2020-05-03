/// CopyToNetwork(network0, network1)
// @argument0 network0 network to be copied
// @argument1 network1 network to be replaced

var size1 = argument0.Hidden1LayerSize;
var size2 = argument0.Hidden2LayerSize;
var size3 = argument0.Hidden3LayerSize;
var size4 = argument0.OutputLayerSize;

//Update hidden1
for(var i = 0; i < size1; i++) {
	//Set weight
	array_copy(argument1.Hidden1Layer[i].Weights, 0, argument0.Hidden1Layer[i].Weights, 0, array_length_1d(argument0.Hidden1Layer[i].Weights));
	//Set bias
	argument1.Hidden1Layer[i].Bias = argument0.Hidden1Layer[i].Bias;
}

//Update hidden2
for(var i = 0; i < size2; i++) {
	//Set weight
	array_copy(argument1.Hidden2Layer[i].Weights, 0, argument0.Hidden2Layer[i].Weights, 0, array_length_1d(argument0.Hidden2Layer[i].Weights));
	//Set bias
	argument1.Hidden2Layer[i].Bias = argument0.Hidden2Layer[i].Bias;
}

//Update hidden2
for(var i = 0; i < size3; i++) {
	//Set weight
	array_copy(argument1.Hidden3Layer[i].Weights, 0, argument0.Hidden3Layer[i].Weights, 0, array_length_1d(argument0.Hidden3Layer[i].Weights));
	//Set bias
	argument1.Hidden3Layer[i].Bias = argument0.Hidden3Layer[i].Bias;
}

//Update layerOutput
for(var i = 0; i < size4; i++) {
	//Set weight
	array_copy(argument1.OutputLayer[i].Weights, 0, argument0.OutputLayer[i].Weights, 0, array_length_1d(argument0.OutputLayer[i].Weights));
	//Set bias
	argument1.OutputLayer[i].Bias = argument0.OutputLayer[i].Bias;
}