if(update) {
	//Output = 0;
	
	//Update output value
	for(var i = 0; i < ds_list_size(Inputs); i++) {
		var _neuron = ds_list_find_value(Inputs, i);
		Output += _neuron.Output * ds_list_find_value(Weights, i);
	}

	//Add our bias
	Output += Bias;
	
	//Apply sigmoid
	Output = 1/(1 + exp(-Output));
	
	//Update alpha
	image_alpha = Output
} else if(updateInput) {
	//Output = 0;
	
	//Update output value
	Output += input;

	//Add our bias
	Output += Bias;
	
	//Apply sigmoid
	Output = 1/(1 + exp(-Output));
	
	//Update alpha
	image_alpha = Output
}