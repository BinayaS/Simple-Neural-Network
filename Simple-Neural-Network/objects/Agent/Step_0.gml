network.update = update;

if(update) {
	
	//Get inputs
	var horizontal = right - left;
	var vertical = down - up;
	var inputDirection = point_direction(0, 0, horizontal, vertical);
	var inputMagnitude = (horizontal != 0) || (vertical != 0);
	var xMove = lengthdir_x(inputMagnitude*walkspd, inputDirection);
	var yMove = lengthdir_y(inputMagnitude*walkspd, inputDirection);

	//Move self
	x += yMove;
	y += xMove;

	var dist = distance_to_object(Goal);
	if(dist == 0) {
		dist = 1;
	}

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

}