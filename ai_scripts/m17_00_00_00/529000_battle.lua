REGISTER_GOAL(GOAL_WhiteDragon_Seath529000_Battle, "WhiteDragon_Seath529000Battle")
local Att3000_Dist_min = -0.2
local Att3000_Dist_max = 2
local Att3001_Dist_min = 6.2
local Att3001_Dist_max = 8.9
local Att3002_Dist_min = -2.4
local Att3002_Dist_max = 9.1
local Att3003_Dist_min = -2.4
local Att3003_Dist_max = 4.6
local Att3004_Dist_min = -2
local Att3004_Dist_max = 5.3
local Att3005_Dist_min = -2.4
local Att3005_Dist_max = 9.3
local Att3006_Dist_min = -2.4
local Att3006_Dist_max = 4
local Att3007_Dist_min = -2.4
local Att3007_Dist_max = 4
local Att3008_Dist_min = -4
local Att3008_Dist_max = -2.9
local Att3009_Dist_min = -4
local Att3009_Dist_max = -0.8
local Att3010_Dist_min = -2.4
local Att3010_Dist_max = -2.47
REGISTER_GOAL_NO_UPDATE(GOAL_WhiteDragon_Seath529000_Battle, 1)
function WhiteDragon_Seath529000Battle_Activate(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    ai:AddObserveChrDmySphere(0, TARGET_ENE_0, 130, 3)
    ai:AddObserveChrDmySphere(1, TARGET_ENE_0, 131, 4)
    ai:AddObserveChrDmySphere(2, TARGET_ENE_0, 132, 5)
    ai:AddObserveChrDmySphere(3, TARGET_ENE_0, 133, 3)
    ai:AddObserveChrDmySphere(4, TARGET_ENE_0, 134, 4)
    ai:AddObserveChrDmySphere(5, TARGET_ENE_0, 135, 5)
    ai:AddObserveChrDmySphere(6, TARGET_ENE_0, 136, 3)
    ai:AddObserveChrDmySphere(7, TARGET_ENE_0, 137, 4)
    ai:AddObserveChrDmySphere(8, TARGET_ENE_0, 138, 5)
    ai:AddObserveChrDmySphere(9, TARGET_ENE_0, 139, 3)
    ai:AddObserveChrDmySphere(10, TARGET_ENE_0, 140, 4)
    ai:AddObserveChrDmySphere(11, TARGET_ENE_0, 141, 5)
    ai:AddObserveChrDmySphere(12, TARGET_ENE_0, 142, 3)
    ai:AddObserveChrDmySphere(13, TARGET_ENE_0, 143, 4)
    ai:AddObserveChrDmySphere(14, TARGET_ENE_0, 144, 5)
    local GetWellSpace_Odds = 100
    local Act00Per = 0
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
    local GetWellSpace_Odds = 100
    if not not ai:IsInsideObserve(3) or not not ai:IsInsideObserve(4) or not not ai:IsInsideObserve(6) or not not ai:IsInsideObserve(7) or not not ai:IsInsideObserve(9) or not not ai:IsInsideObserve(10) or not not ai:IsInsideObserve(12) or ai:IsInsideObserve(13) then
        Act00Per = 100
    end
    if not not ai:IsInsideObserve(2) or not not ai:IsInsideObserve(5) or not not ai:IsInsideObserve(8) or not not ai:IsInsideObserve(11) or ai:IsInsideObserve(14) then
        Act01Per = 100
    end
    if not not ai:IsInsideObserve(7) or ai:IsInsideObserve(8) then
        Act02Per = 100
    end
    if not not ai:IsInsideObserve(6) or not not ai:IsInsideObserve(9) or ai:IsInsideObserve(12) then
        Act03Per = 80
    end
    if not not ai:IsInsideObserve(3) or not not ai:IsInsideObserve(4) or not not ai:IsInsideObserve(6) or ai:IsInsideObserve(7) then
        Act04Per = 80
    end
    if not not ai:IsInsideObserve(0) or not not ai:IsInsideObserve(3) or not not ai:IsInsideObserve(6) or not not ai:IsInsideObserve(9) or ai:IsInsideObserve(12) then
        Act10Per = 0
    end
    if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 15) and targetDist <= 18.7 then
        Act02Per = 100
    end
    if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 160) then
        if 17.6 <= targetDist then
            Act00Per = 10
            Act01Per = 45
            Act02Per = 45
        elseif 9.4 <= targetDist then
            Act06Per = 30
            Act07Per = 30
            Act12Per = 40
        else
            Act05Per = 25
            Act06Per = 20
            Act07Per = 20
            Act12Per = 35
        end
    elseif targetDist <= -1 then
        if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 10) then
            Act00Per = 30
            Act02Per = 0
            Act08Per = 10
            Act09Per = 10
            Act05Per = 40
        elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 64) and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
            Act05Per = 20
            Act08Per = 40
            Act10Per = 40
        elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 54) and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 180) then
            Act05Per = 20
            Act09Per = 40
            Act10Per = 40
        else
            Act05Per = 50
            Act10Per = 50
        end
    else
        Act11Per = 100
    end
    local fateAct = ai:GetRandam_Int(1, Act00Per + Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per + Act10Per + Act11Per + Act12Per)
    if fateAct <= Act00Per then
        WhiteDragon_Seath529000_Act00(ai, goal)
    elseif fateAct <= Act00Per + Act01Per then
        WhiteDragon_Seath529000_Act01(ai, goal)
    elseif fateAct <= Act00Per + Act01Per + Act02Per then
        WhiteDragon_Seath529000_Act02(ai, goal)
    elseif fateAct <= Act00Per + Act01Per + Act02Per + Act03Per then
        WhiteDragon_Seath529000_Act03(ai, goal)
    elseif fateAct <= Act00Per + Act01Per + Act02Per + Act03Per + Act04Per then
        WhiteDragon_Seath529000_Act04(ai, goal)
    elseif fateAct <= Act00Per + Act01Per + Act02Per + Act03Per + Act04Per + Act05Per then
        WhiteDragon_Seath529000_Act05(ai, goal)
    elseif fateAct <= Act00Per + Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per then
        WhiteDragon_Seath529000_Act06(ai, goal)
    elseif fateAct <= Act00Per + Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per then
        WhiteDragon_Seath529000_Act07(ai, goal)
    elseif fateAct <= Act00Per + Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per then
        WhiteDragon_Seath529000_Act08(ai, goal)
    elseif fateAct <= Act00Per + Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per then
        WhiteDragon_Seath529000_Act09(ai, goal)
    elseif fateAct <= Act00Per + Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per + Act10Per then
        WhiteDragon_Seath529000_Act10(ai, goal)
    elseif fateAct <= Act00Per + Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per + Act10Per + Act11Per then
        WhiteDragon_Seath529000_Act11(ai, goal)
    else
        WhiteDragon_Seath529000_Act12(ai, goal)
    end
    local fateGWS = ai:GetRandam_Int(1, 100)
    if fateGWS <= GetWellSpace_Odds then
        WhiteDragon_Seath529000_GetWellSpace_Act(ai, goal)
    end
    return 
end

Att3000_Dist_min = Att3000_Dist_max
function WhiteDragon_Seath529000_Act00(ai, goal)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 200
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_Middle, 5, 30)
    return 
end

Att3000_Dist_min = Att3001_Dist_max
function WhiteDragon_Seath529000_Act01(ai, goal)
    local approachDist = Att3001_Dist_max
    local dashDist = Att3001_Dist_max + 200
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3001, TARGET_ENE_0, DIST_Middle, 5, 30)
    return 
end

Att3000_Dist_min = Att3002_Dist_max
function WhiteDragon_Seath529000_Act02(ai, goal)
    local approachDist = Att3002_Dist_max
    local dashDist = Att3002_Dist_max + 200
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3002, TARGET_ENE_0, DIST_Middle, 5, 5)
    return 
end

Att3000_Dist_min = Att3003_Dist_max
function WhiteDragon_Seath529000_Act03(ai, goal)
    local approachDist = Att3003_Dist_max
    local dashDist = Att3003_Dist_max + 200
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
    return 
end

Att3000_Dist_min = Att3004_Dist_max
function WhiteDragon_Seath529000_Act04(ai, goal)
    local approachDist = Att3004_Dist_max
    local dashDist = Att3004_Dist_max + 200
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
    return 
end

Att3000_Dist_min = Att3005_Dist_max
function WhiteDragon_Seath529000_Act05(ai, goal)
    local approachDist = Att3005_Dist_max
    local dashDist = Att3005_Dist_max + 200
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
    return 
end

Att3000_Dist_min = Att3006_Dist_max
function WhiteDragon_Seath529000_Act06(ai, goal)
    local approachDist = Att3006_Dist_max
    local dashDist = Att3006_Dist_max + 200
    local Odds_Guard = 0
    local PARTS_IDX_TAIL = 0
    local tailDmgLv = ai:GetPartsDmg(PARTS_IDX_TAIL)
    if tailDmgLv == PARTS_DMG_FINAL then
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3012, TARGET_ENE_0, DIST_Middle, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3006, TARGET_ENE_0, DIST_Middle, 0)
    end
    return 
end

Att3000_Dist_min = Att3007_Dist_max
function WhiteDragon_Seath529000_Act07(ai, goal)
    local approachDist = Att3007_Dist_max
    local dashDist = Att3007_Dist_max + 200
    local Odds_Guard = 0
    local PARTS_IDX_TAIL = 0
    local tailDmgLv = ai:GetPartsDmg(PARTS_IDX_TAIL)
    if tailDmgLv == PARTS_DMG_FINAL then
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3013, TARGET_ENE_0, DIST_Middle, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
    end
    return 
end

Att3000_Dist_min = Att3008_Dist_max
function WhiteDragon_Seath529000_Act08(ai, goal)
    local approachDist = Att3008_Dist_max
    local dashDist = Att3008_Dist_max + 200
    local Odds_Guard = 0
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3008, TARGET_ENE_0, DIST_Middle, 0)
    return 
end

Att3000_Dist_min = Att3009_Dist_max
function WhiteDragon_Seath529000_Act09(ai, goal)
    local approachDist = Att3009_Dist_max
    local dashDist = Att3009_Dist_max + 200
    local Odds_Guard = 0
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3009, TARGET_ENE_0, DIST_Middle, 0)
    return 
end

Att3000_Dist_min = Att3010_Dist_max
function WhiteDragon_Seath529000_Act10(ai, goal)
    local approachDist = Att3010_Dist_max
    local dashDist = Att3010_Dist_max + 200
    local Odds_Guard = 0
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3010, TARGET_ENE_0, DIST_Middle, 0)
    return 
end

Att3000_Dist_min = Att3001_Dist_max
function WhiteDragon_Seath529000_Act11(ai, goal)
    local approachDist = Att3001_Dist_max
    local dashDist = Att3001_Dist_max + 200
    local Odds_Guard = 0
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 1, TARGET_ENE_0, 0, TARGET_ENE_0, true, -1)
    return 
end

function WhiteDragon_Seath529000_Act12(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_Turn, 5, TARGET_ENE_0, 30, 0, 0)
    return 
end

function WhiteDragon_Seath529000_GetWellSpace_Act(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if fate <= 30 then
        goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.5, 1), 0, 0, 0, 0)
    end
    return 
end

function WhiteDragon_Seath529000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function WhiteDragon_Seath529000Battle_Terminate(ai, goal)
    return 
end

function WhiteDragon_Seath529000Battle_Interupt(ai, goal)
    return false
end

return 
