showText = !showText;

for(var i = 0; i < ToSpawnNumber; i++) {
	var _newAgent = AgentsList1[i];
	_newAgent.showLines = showLines;
	_newAgent.showText = showText;
}