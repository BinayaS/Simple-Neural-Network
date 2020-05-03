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
	draw_sprite(sprAgentTop, 0, x, y);
	network.showNetwork = true;
} else {
	draw_self();	
}
draw_text(x - 16, y + 8, fitness);