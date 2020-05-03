if(showLines) {
	draw_line(x, y, x, y-lookDistance);
	draw_line(x, y, x, y+lookDistance);
	draw_line(x, y, x-lookDistance, y);
	draw_line(x, y, x+lookDistance, y);

	draw_line(x, y, x-lookDistance, y-lookDistance);
	draw_line(x, y, x-lookDistance, y+lookDistance);
	draw_line(x, y, x+lookDistance, y-lookDistance);
	draw_line(x, y, x+lookDistance, y+lookDistance);
}
if(topAgent) {
	network.showNetwork = true;
	draw_sprite_ext(sprAgentTop, 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
} else {
	draw_self();	
}
if(showText) {
	draw_text(x - 16, y + 8, fitness);
}