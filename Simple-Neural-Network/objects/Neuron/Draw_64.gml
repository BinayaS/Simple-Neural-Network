if(showSelf) {
	if(!updateInput) {
		var i = 0;
		repeat(array_length_1d(Inputs)) {
			var _color = c_green;
			
			var _InputNeuron = Inputs[i];
			var _weight = Weights[i];
			
			draw_set_alpha(abs(_weight));
			if(_weight < 0) {
				_color = c_red;
			}
			draw_line_color(x-8, y, _InputNeuron.x+8, _InputNeuron.y, _color, _color);
			i++;
		}
		draw_set_alpha(1);
	}
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	draw_sprite(sprNeuronOutline, 0, x, y);
	if(baseY == 0) {
		draw_set_color($FFFF00);
	}
	if(rightText) {
		draw_text(x+16, y-8, text);
	} else {
		draw_set_halign(fa_right);
		draw_text(x-10, y-10, text);
		draw_set_halign(fa_left);
	}
	draw_set_color(c_white);
}