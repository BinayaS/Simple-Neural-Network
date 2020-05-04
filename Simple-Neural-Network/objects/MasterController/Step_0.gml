Timer = max(0, Timer-1);

//Next Generation
if(Timer == 0) {
	//sort player's array
	for(var i = 0; i < ToSpawnNumber-1; i++) {
		var minIndex = i;
		for(var j = i+1; j < ToSpawnNumber; j++) {
			if(AgentsList1[j].fitness > AgentsList1[minIndex].fitness) {
				minIndex = j;	
			}
		}
		var temp = AgentsList1[minIndex];
		AgentsList1[minIndex] = AgentsList1[i];
		AgentsList1[i] = temp;
	}
	
	//if(move) {
	//	x = AgentsList1[0].x;
	//	y = AgentsList1[0].y;
	
	//	var _solidHit = collision_circle(x, y, 32, Solid, true, true);
	//	if(_solidHit != noone) {
	//		var _dir = point_direction(x, y, _solidHit.x, _solidHit.y);
	//		move_outside_all(-_dir, 1000);
	//	}
	//} else {
	//	x = startX;
	//	y = startY;
	//}
	
	runString = "Run: " + string(currentRun);
	currentRun += 1;
	
	PrintToFiles();
	
	Temp();
	
	move = true;
	if(currentRun mod 5 == 0) {
		TimeTillRestart = max(TimeTillRestart+room_speed, room_speed*10);
	}
	instance_destroy(Trail);

	//if(currentRun mod 100 == 0) {
	//	if(hitGoal == 0) {
	//		room_restart();	
	//	}
	//}
	if(currentRun mod 100 == 0) {
		game_end();
	}

	if(hitGoal == 0) {
		haveHit = false;
	} else {
		haveHit = true;	
	}

	Alive = ToSpawnNumber;
	Timer = TimeTillRestart;
	TotalFitness = 0;
	hitGoal = 0;
	deadByWall = 0;
	Goal.agent = noone;

}