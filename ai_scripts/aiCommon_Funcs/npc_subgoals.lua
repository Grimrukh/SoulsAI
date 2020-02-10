REGISTER_GOAL(GOAL_COMMON_DashAttack, "DashAttack")
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_DashAttack, 0, "à⁄ìÆëŒè€ÅyTypeÅz", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_DashAttack, 1, "çUåÇäJénãóó£ÅymÅz", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_DashAttack, 2, "çUåÇEzStateî‘çÜ", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_DashAttack, 3, "ÉKÅ[ÉhEzStateî‘çÜ", 0)
REGISTER_GOAL_NO_UPDATE(GOAL_COMMON_DashAttack, true)
REGISTER_GOAL_NO_INTERUPT(GOAL_COMMON_DashAttack, true)
function DashAttack_Activate(ai, goal)
    ai:StartDash()
    local target = goal:GetParam(0)
    local arrive_range = goal:GetParam(1)
    local guard_ezno = goal:GetParam(3)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, target, arrive_range, TARGET_SELF, false, guard_ezno)
    local attack_ezno = goal:GetParam(2)
    goal:AddSubGoal(GOAL_COMMON_DashAttack_Attack, 10, target, attack_ezno)
    return 
end

function DashAttack_Terminate(ai, goal)
    ai:EndDash()
    return 
end

function DashAttack_Update(ai, goal, dT)
    return GOAL_RESULT_Continue
end

function DashAttack_Interupt(ai, goal)
    return false
end

REGISTER_GOAL(GOAL_COMMON_DashAttack_Attack, "DashAttack_Attack")
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_DashAttack_Attack, 0, "à⁄ìÆëŒè€ÅyTypeÅz", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_DashAttack_Attack, 1, "çUåÇEzStateî‘çÜ", 0)
REGISTER_GOAL_NO_UPDATE(GOAL_COMMON_DashAttack_Attack, true)
REGISTER_GOAL_NO_INTERUPT(GOAL_COMMON_DashAttack_Attack, true)
function DashAttack_Attack_Activate(ai, goal)
    local target = goal:GetParam(0)
    local attack_ezno = goal:GetParam(1)
    ai:MoveTo(target, AI_DIR_TYPE_CENTER, 0, false)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, attack_ezno, target, DIST_None)
    return 
end

function DashAttack_Attack_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function DashAttack_Attack_Terminate(ai, goal)
    return 
end

function DashAttack_Attack_Interupt(ai, goal)
    return false
end

return 
