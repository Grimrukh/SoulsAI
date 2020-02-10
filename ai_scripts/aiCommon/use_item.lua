REGISTER_GOAL(GOAL_COMMON_UseItem, "UseItem")
REGISTER_GOAL_NO_UPDATE(GOAL_COMMON_UseItem, true)
REGISTER_GOAL_NO_INTERUPT(GOAL_COMMON_UseItem, true)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_UseItem, 0, "アイテムインデックス", 0)
function UseItem_Activate(ai, goal)
    local item_index = goal:GetParam(0)
    ai:ChangeEquipItem(item_index)
    goal:AddSubGoal(GOAL_COMMON_Attack, 5, NPC_ATK_Item, TARGET_NONE, DIST_None)
    return 
end

function UseItem_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function UseItem_Terminate(ai, goal)
    return 
end

function UseItem_Interupt(ai, goal)
    return false
end

return 
