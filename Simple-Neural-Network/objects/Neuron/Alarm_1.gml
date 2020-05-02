///Fill weights and bias with 1
var _size = ds_list_size(Weights);

//Has values else need to put in new values
if(_size > 0) {
	for(var i = 0; i < inputSize; i++) {
		ds_list_replace(Weights, i, 1)
	}
} else {
	repeat(inputSize) {
		ds_list_add(Weights, 1);	
	}
}
update = false;
updateInput = true;
getInput = true;