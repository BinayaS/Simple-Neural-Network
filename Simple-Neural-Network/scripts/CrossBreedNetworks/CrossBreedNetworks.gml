/// CopyToNetwork(network0, network1)
// @argument0 network0 network to be copied
// @argument1 network1 network to be affected

var size0 = argument0.InputLayerSize;
var size1 = argument0.Hidden1LayerSize;
var size2 = argument0.Hidden2LayerSize;
var size3 = argument0.Hidden3LayerSize;
var size4 = argument0.OutputLayerSize;

//Update Hidden1Layer
for(var i = 0; i < size1; i++) {
	
	var k = 0;
	repeat(size0) {
		//swap between the two Weights based on random chance.
		var chance = irandom_range(0, 100);
		if(chance < 25) {
			argument1.Hidden1Layer[i].Weights[k] = argument0.Hidden1Layer[i].Weights[k];
		}
		k++;
	}
	
	////average the bias
	//argument1.Hidden1Layer[i].bias = floor((argument1.Hidden1Layer[i].bias + argument0.Hidden1Layer[i].bias)/2);
}

//Update Hidden2Layer
for(var i = 0; i < size2; i++) {
	
	var k = 0;
	repeat(size1) {
		//swap between the two Weights based on random chance.
		var chance = irandom_range(0, 100);
		if(chance < 25) {
			argument1.Hidden2Layer[i].Weights[k] = argument0.Hidden2Layer[i].Weights[k];
		}
		k++;
	}
	
	////Set bias
	//argument1.Hidden2Layer[i].bias = floor((argument1.Hidden2Layer[i].bias + argument0.Hidden2Layer[i].bias)/2);
}

//Update Hidden2Layer
for(var i = 0; i < size3; i++) {
	
	var k = 0;
	repeat(size1) {
		//swap between the two Weights based on random chance.
		var chance = irandom_range(0, 100);
		if(chance < 25) {
			argument1.Hidden3Layer[i].Weights[k] = argument0.Hidden3Layer[i].Weights[k];
		}
		k++;
	}
	
	////Set bias
	//argument1.Hidden2Layer[i].bias = floor((argument1.Hidden2Layer[i].bias + argument0.Hidden2Layer[i].bias)/2);
}


//Update OutputLayer
for(var i = 0; i < size4; i++) {
	
	var k = 0;
	repeat(size2) {
		//swap between the two Weights based on random chance.
		var chance = irandom_range(0, 100);
		if(chance < 25) {
			argument1.OutputLayer[i].Weights[k] = argument0.OutputLayer[i].Weights[k];
		}
		k++;
	}
	
	////Set bias
	//argument1.OutputLayer[i].bias = floor((argument1.OutputLayer[i].bias + argument0.OutputLayer[i].bias)/2);
}