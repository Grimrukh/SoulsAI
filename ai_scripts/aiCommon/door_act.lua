REGISTER_GOAL(GOAL_COMMON_DoorAct, "DoorAct")
REGISTER_GOAL_UPDATE_TIME(GOAL_COMMON_DoorAct, 0.2, 0.3)
function DoorAct_Activate(ai, goal)
    ai:PrintText("[DoorAct_Activate]Notice ObjAct")
    ai:SetAllowTriggerNearObjAct()
    return 
end

function DoorAct_Update(ai, goal)
    local isExistReqObjAct = ai:IsExistReqObjAct()
    local hasObjActGoal = ai:HasGoal(GOAL_COMMON_ObjActTest)
    if isExistReqObjAct and hasObjActGoal == false then
        goal:AddSubGoal(GOAL_COMMON_ObjActTest, 10, OBJ_ACT_TYPE_DOOR)
    end
    goal:AddLifeParentSubGoal(0.3)
    return GOAL_RESULT_Continue
end

function DoorAct_Terminate(ai, goal)
    return 
end

REGISTER_GOAL_NO_INTERUPT(GOAL_COMMON_DoorAct, true)
function DoorAct_Interupt(ai, goal)
    return false
end

return 
