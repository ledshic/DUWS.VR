
// dismiss players AI

_arrayOfYellowUnits = [];

{
    _team = assignedTeam _x;
    if (_team == "YELLOW") then {
        _arrayOfYellowUnits = _arrayOfYellowUnits + [_x];
    }
} forEach units group player;

if (count _arrayOfYellowUnits<1) exitWith {hint localize "STR_DUWS_X_5i5rdhy7"};

_newGroup = createGroup WEST;
_arrayOfYellowUnits join _newGroup; 
player hcSetGroup [_newGroup,""];

hint localize "STR_DUWS_X_c2hnymzn";