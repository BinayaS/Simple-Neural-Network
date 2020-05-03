/// GetRandomMutationNetworks(network)
// @argument0 network

var size0 = argument0.InputLayerSize;
var size1 = argument0.Hidden1LayerSize;
var size2 = argument0.Hidden2LayerSize;
var size3 = argument0.Hidden3LayerSize;
var size4 = argument0.OutputLayerSize;

var mutateRate = 0.01;

//Give random values to Hidden1LayerSize
for(var i = 0; i < size1; i++) {
	
	var k = 0;
	repeat(size0) {
		var rand = random(1)
		if(rand < mutateRate) {
			//Mutate weight
			argument0.Hidden1Layer[i].Weights[k] += random_range(-0.5, 0.5);; // = random_range(-4, 4);
		}
		k++;
	}
	
		var rand = random(1)
		if(rand < mutateRate) {
		//Mutate Bias
		argument0.Hidden1Layer[i].Bias += random_range(-0.1, 0.1); // = random_range(-1, 1);
	}
}

//Give random values to Hidden2LayerSize
for(var i = 0; i < size2; i++) {
	var k = 0;
	repeat(size1) {
		var rand = random(1)
		if(rand < mutateRate) {
			//Mutate weight
			argument0.Hidden2Layer[i].Weights[k] += random_range(-0.5, 0.5);
		}
		k++;
	}
	
		var rand = random(1)
		if(rand < mutateRate) {
		//Mutate Bias
		argument0.Hidden2Layer[i].Bias += random_range(-0.1, 0.1);
	}
}

//Give random values to Hidden3LayerSize
for(var i = 0; i < size3; i++) {
	var k = 0;
	repeat(size2) {
		var rand = random(1)
		if(rand < mutateRate) {
			//Mutate weight
			argument0.Hidden3Layer[i].Weights[k] += random_range(-0.5, 0.5);
		}
		k++;
	}
	
		var rand = random(1)
		if(rand < mutateRate) {
		//Mutate Bias
		argument0.Hidden3Layer[i].Bias += random_range(-0.1, 0.1);
	}
}

//Give random values to OutputLayerSize
for(var i = 0; i < size4; i++) {
	var k = 0;
	repeat(size3) {
		var rand = random(1)
		if(rand < mutateRate) {
			//Mutate weight
			argument0.OutputLayer[i].Weights[k] += random_range(-0.5, 0.5);
		}
		k++;
	}
	
		var rand = random(1)
		if(rand < mutateRate) {
		//Mutate Bias
		argument0.OutputLayer[i].Bias += random_range(-0.1, 0.1);
	}
}