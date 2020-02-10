REGISTER_GOAL(GOAL_KingIzalis523000_Battle, "KingIzalis523000Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_KingIzalis523000_Battle, 1)
function KingIzalis523000Battle_Activate(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local fate4 = ai:GetRandam_Int(1, 100)
    local Act01Per = 0
    local Act02Per = 0
    local Act03Per = 0
    local Act04Per = 0
    local Act05Per = 0
    local Act06Per = 0
    local Act07Per = 0
    local Act40Per = 0
    local Att3000flag = 0
    local Att3001flag = 0
    local Att3002flag = 0
    local Att3003flag = 0
    local Att3004flag = 0
    local Att3005flag = 0
    local Att3006flag = 0
    if ai:IsInsideTargetRegion(TARGET_ENE_0, 1412550) then
        Att3000flag = 1
    end
    if ai:IsInsideTargetRegion(TARGET_ENE_0, 1412552) then
        Att3001flag = 1
    end
    if ai:IsInsideTargetRegion(TARGET_ENE_0, 1412554) then
        Att3002flag = 1
    end
    if ai:IsInsideTargetRegion(TARGET_ENE_0, 1412555) then
        Att3003flag = 1
    end
    if not not ai:IsInsideTargetRegion(TARGET_ENE_0, 1412556) or ai:IsInsideTargetRegion(TARGET_ENE_0, 1412557) then
        Att3004flag = 1
    end
    if not not ai:IsInsideTargetRegion(TARGET_ENE_0, 1412560) or ai:IsInsideTargetRegion(TARGET_ENE_0, 1412561) then
        Att3005flag = 1
    end
    if ai:IsInsideTargetRegion(TARGET_ENE_0, 1412564) then
        Att3006flag = 1
    end
    if Att3000flag == 1 then
        Act01Per = 100
    end
    if Att3001flag == 1 then
        Act02Per = 100
    end
    if Att3002flag == 1 then
        Act03Per = 100
    end
    if Att3003flag == 1 then
        Act04Per = 100
    end
    if Att3004flag == 1 then
        Act05Per = 100
    end
    if Att3005flag == 1 then
        Act06Per = 100
    end
    if Att3006flag == 1 then
        Act07Per = 100
    end
    local fateAct = ai:GetRandam_Int(1, Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act40Per)
    if fateAct <= Act01Per then
        KingIzalis523000_Act01(ai, goal)
    elseif fateAct <= Act01Per + Act02Per then
        KingIzalis523000_Act02(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per then
        KingIzalis523000_Act03(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per then
        KingIzalis523000_Act04(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per then
        KingIzalis523000_Act05(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per then
        KingIzalis523000_Act06(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per then
        KingIzalis523000_Act07(ai, goal)
    else
        KingIzalis523000_Act40(ai, goal)
    end
    return 
end

function KingIzalis523000_Act01(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3000, TARGET_ENE_0, DIST_None, 0)
    return 
end

function KingIzalis523000_Act02(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3001, TARGET_ENE_0, DIST_None, 0)
    return 
end

function KingIzalis523000_Act03(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3002, TARGET_ENE_0, DIST_None, 0)
    return 
end

function KingIzalis523000_Act04(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3003, TARGET_ENE_0, DIST_None, 0)
    return 
end

function KingIzalis523000_Act05(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3004, TARGET_ENE_0, DIST_None, 0)
    return 
end

function KingIzalis523000_Act06(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3005, TARGET_ENE_0, DIST_None, 0)
    return 
end

function KingIzalis523000_Act07(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3006, TARGET_ENE_0, DIST_None, 0)
    return 
end

function KingIzalis523000_Act40(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(1, 3), TARGET_NONE, 0, 0, 0)
    return 
end

function KingIzalis523000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function KingIzalis523000Battle_Terminate(ai, goal)
    return 
end

function KingIzalis523000Battle_Interupt(ai, goal)
    return false
end

return 
