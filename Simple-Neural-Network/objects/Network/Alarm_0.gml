#region Update Input for InputLayer neurons
	var i = 0;
	repeat(InputLayerSize) {
		var _inputNeuron = InputLayer[i];
		switch(i) {
			case 0:
				_inputNeuron.input = owner.upDistance;
			break;
		
			case 1:
				_inputNeuron.input = owner.downDistance;
			break;
		
			case 2:
				_inputNeuron.input = owner.leftDistance;
			break;
		
			case 3:
				_inputNeuron.input = owner.rightDistance;
			break;
		
			case 4:
				_inputNeuron.input = owner.upLeftDistance;
			break;
		
			case 5:
				_inputNeuron.input = owner.upRightDistance;
			break;
		
			case 6:
				_inputNeuron.input = owner.downLeftDistance;
			break;
		
			case 7:
				_inputNeuron.input = owner.downRightDistance;
			break;
		
			case 8:
				_inputNeuron.input = owner.checkGoalDistance;
			break;
		}
		i++;
	}
	#endregion

#region Update Agent from OutputLayer
var _neuronUp = OutputLayer[0];
var _neuronDown = OutputLayer[1];
var _neuronLeft = OutputLayer[2];
var _neuronRight = OutputLayer[3];
	
//Left or right
if(_neuronLeft.Output > moveThreshold && _neuronRight.Output > moveThreshold) {
if(_neuronLeft.Output > _neuronRight.Output) {
	owner.left = 1;
	owner.right = 0;
} else {
	owner.right = 1;
	owner.left = 0;
}
} else {
if(_neuronLeft.Output > moveThreshold) {
	owner.left = 1;
	owner.right = 0;
} else if(_neuronRight.Output > moveThreshold) {
	owner.right = 1;
	owner.left = 0;
}
}
	
//Up or down
if(_neuronUp.Output > moveThreshold && _neuronDown.Output > moveThreshold) {
if(_neuronUp.Output > _neuronDown.Output) {
	owner.up = 1;
	owner.down = 0;
} else {
	owner.down = 1;
	owner.up = 0;
}
} else {
if(_neuronUp.Output > moveThreshold) {
	owner.up = 1;
	owner.down = 0;
} else if(_neuronDown.Output > moveThreshold) {
	owner.down = 1;
	owner.up = 0;
}
}
#endregion

	
for(var i = 0; i < InputLayerSize; i++) {
	var _neuron = InputLayer[i];
	_neuron.showSelf = showNetwork;
}
for(var i = 0; i < Hidden1LayerSize; i++) {
	var _neuron = Hidden1Layer[i];
	_neuron.showSelf = showNetwork;
}
for(var i = 0; i < Hidden2LayerSize; i++) {
	var _neuron = Hidden2Layer[i];
	_neuron.showSelf = showNetwork;
}
for(var i = 0; i < Hidden3LayerSize; i++) {
	var _neuron = Hidden3Layer[i];
	_neuron.showSelf = showNetwork;
}
for(var i = 0; i < OutputLayerSize; i++) {
	var _neuron = OutputLayer[i];
	_neuron.showSelf = showNetwork;
}

if(update) {
	alarm[0] = 2;
}