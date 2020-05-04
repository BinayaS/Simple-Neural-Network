if(!smallGoalHit) {
	smallGoalHit = true;
	if(smallGoals+1 < 20) {
		smallGoals++;
		other.life--;
	}
}