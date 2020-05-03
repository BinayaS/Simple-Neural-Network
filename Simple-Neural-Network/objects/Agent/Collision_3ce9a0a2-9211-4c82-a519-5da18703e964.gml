if(update) {
	MasterController.Alive--;
	touchedGoal = true;
	update = false;
	up = 0;
	down = 0;
	left = 0;
	right = 0;
	MasterController.move = false;
	MasterController.hitGoal++;
}