update = false;
showLines = false;
topAgent = false;
startDist = distance_to_object(Goal);

startX = x;
startY = y;
reset = false;

walkspd = 6;
lookDistance = 200;
global.offNumber = -5;
division = 12;
setBack = 6;

fitness = 0;
touchedGoal = false;
timer = 0;

up = 0;
down = 0;
left = 0;
right = 0;

upCollision = 0;
upDistance = 0;

downCollision = 0;
downDistance = 0;

leftCollision = 0;
leftDistance = 0;

rightCollision = 0;
rightDistance = 0;

upLeftCollision = 0;
upLeftDistance = 0;

upRightCollision = 0;
upRightDistance = 0;

downLeftCollision = 0;
downLeftDistance = 0;

downRightCollision = 0;
downRightDistance = 0;

checkGoalDistance = 0;

network = instance_create_depth(32, 32, 0, Network);
network.owner = self;