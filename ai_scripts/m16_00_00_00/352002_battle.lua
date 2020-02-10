REGISTER_GOAL(GOAL_wyvern_on_earth352002_Battle, "wyvern_on_earth352002Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 2.3
local Att3001_Dist_min = 0
local Att3001_Dist_max = 2.5
local Att3002_Dist_min = 0
local Att3002_Dist_max = 4.3
local Att3003_Dist_min = 0
local Att3003_Dist_max = 8
local Att3004_Dist_min = 0
local Att3004_Dist_max = 8
local Att3005_Dist_min = 0.5
local Att3005_Dist_max = 7.3
local Att3006_Dist_min = 4.5
local Att3006_Dist_max = 13
REGISTER_GOAL_NO_UPDATE(GOAL_wyvern_on_earth352002_Battle, 1)
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3001_Dist_max
Att3000_Dist_min = Att3003_Dist_max
Att3000_Dist_min = Att3004_Dist_max
function wyvern_on_earth352002Battle_Activate(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local fate4 = ai:GetRandam_Int(1, 100)
    local fate5 = ai:GetRandam_Int(1, 100)
    local GetWellSpace_Odds = 0
    local targetDist = ai:GetDist(TARGET_ENE_0)
    ai:AddObserveRegion(0, TARGET_ENE_0, 1602801)
    ai:AddObserveRegion(1, TARGET_ENE_0, 1602802)
    ai:AddObserveRegion(2, TARGET_ENE_0, 1602803)
    ai:AddObserveRegion(3, TARGET_ENE_0, 1602804)
    ai:AddObserveRegion(4, TARGET_ENE_0, 1602805)
    ai:AddObserveRegion(5, TARGET_ENE_0, 1602806)
    ai:AddObserveRegion(6, TARGET_ENE_0, 1602807)
    ai:AddObserveRegion(7, TARGET_ENE_0, 1602808)
    ai:AddObserveRegion(8, TARGET_ENE_0, 1602809)
    ai:AddObserveRegion(9, TARGET_ENE_0, 1602810)
    ai:AddObserveRegion(10, TARGET_ENE_0, 1602811)
    ai:AddObserveRegion(11, TARGET_ENE_0, 1602812)
    ai:AddObserveRegion(12, TARGET_ENE_0, 1602813)
    ai:AddObserveRegion(13, TARGET_ENE_0, 1602814)
    ai:AddObserveRegion(14, TARGET_ENE_0, 1602815)
    ai:AddObserveRegion(15, TARGET_ENE_0, 1602816)
    ai:AddObserveRegion(16, TARGET_ENE_0, 1602735)
    local canAct12 = 0
    local canAct08 = 0
    local canAct11 = 0
    local canAct07 = 0
    if ai:IsOnNearMeshByPos(TARGET_SELF, AI_DIR_TYPE_F, 17.5) then
        canAct12 = 1
    end
    if ai:IsOnNearMeshByPos(TARGET_SELF, AI_DIR_TYPE_F, 12.8) then
        canAct08 = 1
    end
    if ai:IsOnNearMeshByPos(TARGET_SELF, AI_DIR_TYPE_F, 12.5) then
        canAct11 = 1
    end
    if ai:IsOnNearMeshByPos(TARGET_SELF, AI_DIR_TYPE_B, 11.6) then
        canAct07 = 1
    end
    local Act01Per = 0
    local Act02Per = 0
    local Act03Per = 0
    local Act04Per = 0
    local Act05Per = 0
    local Act06Per = 0
    local Act07Per = 0
    local Act08Per = 0
    local Act09Per = 0
    local Act10Per = 0
    local Act11Per = 0
    local Act12Per = 0
    local Act13Per = 0
    local Act14Per = 0
    ai:SetEventMoveTarget(1602735)
    local Sumade = ai:GetDistAtoB(POINT_EVENT, TARGET_SELF)
    if 8.5 <= targetDist and targetDist <= 14.5 and canAct12 == 1 then
        Act12Per = 150
    end
    if 4 <= targetDist and targetDist <= 8.2 and canAct08 == 1 then
        Act08Per = 150
    end
    if 4 <= targetDist and targetDist <= 8.2 and (not (not ai:IsInsideTargetRegion(TARGET_SELF, 1602808) or not ai:IsInsideTargetRegion(TARGET_ENE_0, 1602808)) or not (not ai:IsInsideTargetRegion(TARGET_SELF, 1602808) or not ai:IsInsideTargetRegion(TARGET_ENE_0, 1602809)) or not (not ai:IsInsideTargetRegion(TARGET_SELF, 1602808) or not ai:IsInsideTargetRegion(TARGET_ENE_0, 1602810)) or not (not ai:IsInsideTargetRegion(TARGET_SELF, 1602810) or not ai:IsInsideTargetRegion(TARGET_ENE_0, 1602808)) or not (not ai:IsInsideTargetRegion(TARGET_SELF, 1602810) or not ai:IsInsideTargetRegion(TARGET_ENE_0, 1602810)) or not (not ai:IsInsideTargetRegion(TARGET_SELF, 1602810) or not ai:IsInsideTargetRegion(TARGET_ENE_0, 1602812)) or ai:IsInsideTargetRegion(TARGET_SELF, 1602810) and ai:IsInsideTargetRegion(TARGET_ENE_0, 1602814)) then
        Act06Per = 150
    end
    if 0 <= targetDist and targetDist <= 10 and (not (not ai:IsInsideTargetRegion(TARGET_SELF, 1602808) or not ai:IsInsideTargetRegion(TARGET_ENE_0, 1602810)) or not (not ai:IsInsideTargetRegion(TARGET_SELF, 1602808) or not ai:IsInsideTargetRegion(TARGET_ENE_0, 1602815)) or ai:IsInsideTargetRegion(TARGET_SELF, 1602815) and ai:IsInsideTargetRegion(TARGET_ENE_0, 1602808)) then
        Act10Per = 150
    end
    if 0 <= targetDist and targetDist <= 6 and canAct11 == 1 then
        Act11Per = 150
    end
    if 0 <= targetDist and targetDist <= 1.5 and (not not ai:IsInsideTargetRegion(TARGET_SELF, 1602811) or not not ai:IsInsideTargetRegion(TARGET_SELF, 1602812) or not not ai:IsInsideTargetRegion(TARGET_SELF, 1602808) or ai:IsInsideTargetRegion(TARGET_SELF, 1602810)) then
        Act09Per = 150
    end
    if 0 <= targetDist and targetDist <= 1.5 and canAct07 == 1 then
        Act07Per = 150
    end
    if 6 <= targetDist then
        Act04Per = 50
        Act05Per = 50
        Act01Per = 0
    elseif 2.5 <= targetDist then
        if ai:IsFinishTimer(0) == true then
            Act14Per = 10
        end
        Act04Per = 20
        Act05Per = 40
        Act01Per = 40
    else
        if ai:IsFinishTimer(0) == true then
            Act14Per = 40
        end
        Act04Per = 10
        Act05Per = 15
        Act01Per = 45
    end
    local fateAct = ai:GetRandam_Int(1, Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per + Act10Per + Act11Per + Act12Per + Act13Per + Act14Per)
    if fateAct <= Act01Per then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 2, TARGET_ENE_0, Att3000_Dist_max, TARGET_SELF, false, -1)
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        GetWellSpace_Odds = 100
    elseif fateAct <= Act01Per + Act02Per then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3001_Dist_max, TARGET_SELF, false, -1)
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
        GetWellSpace_Odds = 100
    elseif fateAct <= Act01Per + Act02Per + Act03Per then
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
        GetWellSpace_Odds = 0
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 2, TARGET_ENE_0, Att3003_Dist_max, TARGET_SELF, false, -1)
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
        GetWellSpace_Odds = 0
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 2, TARGET_ENE_0, Att3004_Dist_max, TARGET_SELF, false, -1)
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
        GetWellSpace_Odds = 0
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per then
        wyvern_on_earth352002_Turn(ai, goal)
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3006, TARGET_ENE_0, DIST_Middle, 0)
        GetWellSpace_Odds = 0
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per then
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
        GetWellSpace_Odds = 0
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per then
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
        GetWellSpace_Odds = 0
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per then
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3008, TARGET_ENE_0, DIST_Middle, 0)
        GetWellSpace_Odds = 0
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per + Act10Per then
        wyvern_on_earth352002_Turn(ai, goal)
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3009, TARGET_ENE_0, DIST_Middle, 0)
        GetWellSpace_Odds = 0
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per + Act10Per + Act11Per then
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3010, TARGET_ENE_0, DIST_Middle, 0)
        GetWellSpace_Odds = 0
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per + Act10Per + Act11Per + Act12Per then
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3011, TARGET_ENE_0, DIST_Middle, 0)
        GetWellSpace_Odds = 0
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per + Act10Per + Act11Per + Act12Per + Act13Per then
        if 2 <= Sumade then
            ai:SetEventMoveTarget(1602736)
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 2, POINT_EVENT, 3, TARGET_SELF, True, -1)
        end
        goal:AddSubGoal(GOAL_COMMON_If, 10, 0)
        GetWellSpace_Odds = 0
    else
        if fate3 <= 50 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 0, 701, TARGET_NONE, -1, AI_DIR_TYPE_B, 4.2)
        elseif fate3 <= 75 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 0, 702, TARGET_NONE, -1, AI_DIR_TYPE_L, 4.2)
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 0, 703, TARGET_NONE, -1, AI_DIR_TYPE_R, 4.2)
        end
        ai:SetTimer(0, 5)
    end
    local fateGWS = ai:GetRandam_Int(1, 100)
    if fateGWS <= GetWellSpace_Odds then
        wyvern_on_earth352002_ActAfter_AdjustSpace(ai, goal)
    end
    return 
end

function wyvern_on_earth352002_Turn(ai, goal)
    ai:SetEventMoveTarget(1602817)
    local Dist_Self_1602817 = ai:GetDistAtoB(POINT_EVENT, TARGET_SELF)
    local Dist_ENE_1602817 = ai:GetDistAtoB(POINT_EVENT, TARGET_ENE_0)
    if Dist_ENE_1602817 <= Dist_Self_1602817 then
        ai:SetEventMoveTarget(1602817)
        goal:AddSubGoal(GOAL_COMMON_Turn, 10, POINT_EVENT, 2, 0, 0)
    else
        ai:SetEventMoveTarget(1602818)
        goal:AddSubGoal(GOAL_COMMON_Turn, 10, POINT_EVENT, 2, 0, 0)
    end
    return 
end

function wyvern_on_earth352002_ActAfter_AdjustSpace(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    return 
end

function OnIf_352002(ai, goal, codeNo)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if codeNo == 0 then
        goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_SELF)
        goal:AddSubGoal(GOAL_COMMON_Turn, 2, TARGET_ENE_0, 0, 0, 0)
        GetWellSpace_Odds = 0
    end
    return 
end

function wyvern_on_earth352002Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function wyvern_on_earth352002Battle_Terminate(ai, goal)
    return 
end

function wyvern_on_earth352002Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    return false
end

return 
