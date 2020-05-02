///Fill weights and bias with random values
var _size = ds_list_size(Weights);

//Has values else need to put in new values
if(_size > 0) {
	for(var i = 0; i < inputSize; i++) {
		ds_list_replace(Weights, i, random_range(-4, 4))
	}
} else {
	repeat(inputSize) {
		ds_list_add(Weights, random_range(-4, 4));
	}
}
Bias = random_range(-1, 1);
update = true;
updateInput = false;