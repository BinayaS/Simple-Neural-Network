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
draw_self();