var _agent = instance_nearest(x, y, Agent);
if(_agent != noone) {
	if(_agent != agent) {
		if(agent != noone) {
			agent.network.showNetwork = false;
			agent.network.baseY = 0;
		}
		agent = _agent;
		if(instance_exists(agent.network)) {
			agent.network.showNetwork = true;
			agent.network.baseY = 400;
		}
	}
	draw_line(x, y, agent.x, agent.y);
}
draw_self();