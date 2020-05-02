if(showSelf) {
	if(!updateInput) {
		var i = 0;
		repeat(ds_list_size(Inputs)) {
			var _InputNeuron = ds_list_find_value(Inputs, i);
			var _color = c_green;
			draw_set_alpha(_InputNeuron.Output);
			if(ds_list_find_value(Weights, i) < 0) {
				_color = c_red;
			}
			draw_line_color(x-8, y, _InputNeuron.x+8, _InputNeuron.y, _color, _color);
			i++;
		}
		draw_set_alpha(1);
	}
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	draw_sprite(sprNeuronOutline, 0, x, y);
}