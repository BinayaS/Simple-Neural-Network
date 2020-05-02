if(update) {

	#region Update Input for InputLayer neurons
	var i = 0;
	repeat(InputLayerSize) {
		var _inputNeuron = ds_list_find_value(InputLayer, i);
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
	var _neuronUp = ds_list_find_value(OutputLayer, 0);
	var _neuronDown = ds_list_find_value(OutputLayer, 1);
	var _neuronLeft = ds_list_find_value(OutputLayer, 2);
	var _neuronRight = ds_list_find_value(OutputLayer, 3);
	
	//Left or right
	if(_neuronLeft.Output - _neuronRight.Output > 0) {
		owner.left = 1;
		owner.right = 0;
	} else {
		owner.right = 1;
		owner.left = 0;
	}
	
	//Up or down
	if(_neuronUp.Output - _neuronDown.Output > 0) {
		owner.up = 1;
		owner.down = 0;
	} else {
		owner.down = 1;
		owner.up = 0;
	}
	#endregion

}