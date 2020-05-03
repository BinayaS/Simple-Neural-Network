if(instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
}

x = lerp(x, xTo, 0.1);
y = lerp(y, yTo, 0.1);

x = clamp(x, viewWidthHalf, room_width-viewWidthHalf);
y = clamp(y, viewHeightHalf, room_height-viewHeightHalf);

camera_set_view_pos(cam, x-viewWidthHalf, y-viewHeightHalf);