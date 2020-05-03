if(update) {
	Output = 0;
	
	//Update output value
	for(var i = 0; i < array_length_1d(Inputs); i++) {
		var _neuron = Inputs[i];
		Output += _neuron.Output * Weights[i];
	}

	//Add our bias
	Output += Bias;
	
	//Apply sigmoid
	Output = 1/(1 + exp(-Output));
	
	//Update alpha
	image_alpha = Output
} else if(updateInput) {
	Output = 0;
	
	//Update output value
	Output += input;

	//Add our bias
	Output += Bias;
	
	//Apply sigmoid
	Output = 1/(1 + exp(-Output));
	
	//Update alpha
	image_alpha = Output
}