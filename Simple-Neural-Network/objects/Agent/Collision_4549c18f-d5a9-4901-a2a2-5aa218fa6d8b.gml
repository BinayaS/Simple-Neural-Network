if(update) {
	MasterController.Alive--;
	sprite_index = sprAgentDead;
	touchedWall = true;
	update = false;
	up = 0;
	down = 0;
	left = 0;
	right = 0;
}