if(reset) {
	update = true;
	touchedGoal = false;
	touchedWall = false;
	sprite_index = sprAgent;
	x = startX;
	y = startY;
	reset = false;
	network.update = true;
	network.alarm[0] = 2;
}

var dist = distance_to_object(Goal);
if(dist == 0) {
	dist = 1;
}

if(update) {
	
	//Get inputs
	var horizontal = right - left;
	var vertical = down - up;
	var inputDirection = point_direction(0, 0, horizontal, vertical);
	var inputMagnitude = (horizontal != 0) || (vertical != 0);
	var xMove = lengthdir_x(inputMagnitude*walkspd, inputDirection);
	var yMove = lengthdir_y(inputMagnitude*walkspd, inputDirection);

	image_angle = point_direction(x, y, x+xMove, y+yMove);

	//Move self
	x += xMove;
	y += yMove;
	
	if(!position_meeting(x, y, Trail)) {
		instance_create_depth(x, y, 100, Trail);
	}
	
	timer++;

	#region vision

	var _offNum = global.offNumber;

	//up
	upCollision = collision_line(x, y, x, y-lookDistance, Solid, false, true);
	if(upCollision) {
		upDistance = (-distance_to_object(upCollision)/(lookDistance/division))+setBack;
	} else {
		upDistance = _offNum;
	}
	
	//down
	downCollision = collision_line(x, y, x, y+lookDistance, Solid, false, true);
	if(downCollision) {
		downDistance = (-distance_to_object(downCollision)/(lookDistance/division))+setBack;
	} else {
		downDistance = _offNum;
	}
	
	//left
	leftCollision = collision_line(x, y, x-lookDistance, y, Solid, false, true);
	if(leftCollision) {
		leftDistance = (-distance_to_object(leftCollision)/(lookDistance/division))+setBack;
	} else {
		leftDistance = _offNum;
	}
	
	//right
	rightCollision = collision_line(x, y, x+lookDistance, y, Solid, false, true);
	if(rightCollision) {
		rightDistance = (-distance_to_object(rightCollision)/(lookDistance/division))+setBack;
	} else {
		rightDistance = _offNum;
	}
	
	//up left
	upLeftCollision = collision_line(x, y, x-lookDistance, y-lookDistance, Solid, false, true);
	if(upLeftCollision) {
		upLeftDistance = (-distance_to_object(upLeftCollision)/(lookDistance/division))+setBack;
	} else {
		upLeftDistance = _offNum;
	}
	
	//up right
	upRightCollision = collision_line(x, y, x+lookDistance, y-lookDistance, Solid, false, true);
	if(upRightCollision) {
		upRightDistance = (-distance_to_object(upRightCollision)/(lookDistance/division))+setBack;
	} else {
		upRightDistance = _offNum;
	}
	
	//down left
	downLeftCollision = collision_line(x, y, x-lookDistance, y+lookDistance, Solid, false, true);
	if(downLeftCollision) {
		downLeftDistance = (-distance_to_object(downLeftCollision)/(lookDistance/division))+setBack;
	} else {
		downLeftDistance = _offNum;
	}
	
	//down right
	downRightCollision = collision_line(x, y, x+lookDistance, y+lookDistance, Solid, false, true);
	if(downRightCollision) {
		downRightDistance = (-distance_to_object(downRightCollision)/(lookDistance/division))+setBack;
	} else {
		downRightDistance = _offNum;
	}

	checkGoalDistance = ((startDist-dist)/(startDist/division))-setBack;

#endregion
	
	//if(touchedGoal) {
	//	fitness = (((1/(timer*timer))*1000000000)*startDist*100)*10;
	//} else if(touchedWall) {
	//	if(collision_line(x, y, Goal.x, Goal.y, Solid, true, true) == noone) {
	//		fitness = ((1/(dist*dist))*100000000000)*2/4;
	//	} else {
	//		fitness = ((1/(dist*dist))*1000000000)/4;
	//	}
	//} else {
	//	if(collision_line(x, y, Goal.x, Goal.y, Solid, true, true) == noone) {
	//		fitness = ((1/(dist*dist))*100000000000)*2;
	//	} else {
	//		fitness = ((1/(dist*dist))*1000000000);
	//	}
	//}

}

//Update fitness fuction
//if(touchedGoal) {
//	fitness = (((1/(timer*timer))*1000000000)*startDist*100)*10;
//} else if(touchedWall) {
//	if(collision_line(x, y, Goal.x, Goal.y, Solid, true, true) == noone) {
//		fitness = ((1/(dist*dist))*100000000000)*2/4;
//	} else {
//		fitness = ((1/(dist*dist))*1000000000)/4;
//	}
//} else {
//	if(collision_line(x, y, Goal.x, Goal.y, Solid, true, true) == noone) {
//		fitness = ((1/(dist*dist))*100000000000)*2;
//	} else {
//		fitness = ((1/(dist*dist))*1000000000);
//	}
//}


var _fitDist = (1/(dist*dist))*100000000; //(startDist - dist);
	
if(touchedGoal) {
	_fitDist = _fitDist * 10000000000000;

} else if(touchedWall) {
	
	if(collision_line(x, y, Goal.x, Goal.y, Solid, true, true) != noone) {
		_fitDist = -_fitDist;
	} else {
		_fitDist = _fitDist/1000000;
	}
	
} else {
	if(collision_line(x, y, Goal.x, Goal.y, Solid, true, true) != noone) {
		_fitDist = _fitDist/1000000;
	} else {
		_fitDist = _fitDist/10000;
	}
}

if(timer mod 5 == 0) {
	if(abs(checkX - x) < 100 && abs(checkY - y) < 100) {
		_fitDist = _fitDist/1000;
	}
	checkX = x;
	checkY = y;
}

fitness = _fitDist*100;