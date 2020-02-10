REGISTER_GOAL(GOAL_IronGolem232000_Battle, "IronGolem232000Battle")
local Att3000_Dist_min = 1.4
local Att3000_Dist_max = 3.8
local Att3002_Dist_min = 1.1
local Att3002_Dist_max = 4.2
local Att3003_Dist_min = 1
local Att3003_Dist_max = 3.1
local Att3006_Dist_min = -1.5
local Att3006_Dist_max = 3.8
local Att3007_Dist_min = -1.5
local Att3007_Dist_max = 0.4
local Att3009_Dist_min = -1.5
local Att3009_Dist_max = -0.5
local Att3010_Dist_min = -1.5
local Att3010_Dist_max = 0
local Att3012_Dist_min = 12
local Att3012_Dist_max = 30
REGISTER_GOAL_NO_UPDATE(GOAL_IronGolem232000_Battle, 1)
function IronGolem232000Battle_Activate(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local fate4 = ai:GetRandam_Int(1, 100)
    local fate5 = ai:GetRandam_Int(1, 100)
    local fate6 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local EventNo = ai:GetEventRequest()
    local GetWellSpace_Odds = 0
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
    local Act13Per = 0
    ai:AddObserveChrDmySphere(0, TARGET_ENE_0, 3, 1.4)
    ai:AddObserveChrDmySphere(1, TARGET_ENE_0, 30, 1.4)
    ai:AddObserveChrDmySphere(2, TARGET_ENE_0, 4, 1.4)
    ai:AddObserveChrDmySphere(3, TARGET_ENE_0, 40, 1.4)
    local FirstImpression = ai:GetNumber(0)
    local RateThrow = 1
    if ai:IsFinishTimer(0) == false then
        RateThrow = 0.1
    end
    local RateRightCrush = 1
    if ai:IsFinishTimer(1) == false then
        RateRightCrush = 0.2
    end
    local RateLeftCrush = 1
    if ai:IsFinishTimer(2) == false then
        RateLeftCrush = 0.2
    end
    local RateStep = 1
    if ai:IsFinishTimer(3) == false then
        RateStep = 0
    end
    local RateNagi = 1
    if ai:IsInsideTargetRegion(TARGET_ENE_0, 1502730) then
        RateNagi = 0
    end
    if FirstImpression == 0 then
        Act11Per = 100
    elseif not not ai:IsInsideObserve(0) or ai:IsInsideObserve(1) and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 120) and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) and fate <= 75 * RateRightCrush then
        Act03Per = 100
    elseif not not ai:IsInsideObserve(2) or ai:IsInsideObserve(3) and fate2 <= 75 * RateLeftCrush then
        Act04Per = 50
        Act09Per = 50
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 30) and 0 <= targetDist and targetDist <= 4 and fate3 <= 75 * RateThrow then
        Act05Per = 100
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 30) and -1.5 <= targetDist and targetDist <= 1.5 and fate4 <= 60 then
        Act06Per = 100
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 50) and -1.5 <= targetDist and targetDist <= 1.5 and fate5 <= 75 * RateThrow then
        Act07Per = 100
    elseif 12 <= targetDist then
        Act00Per = 5
        Act01Per = 10 * RateNagi
        Act02Per = 5
        Act10Per = 50
        Act12Per = 30
    elseif 6 <= targetDist then
        Act00Per = 30
        Act01Per = 45 * RateNagi
        Act02Per = 15
        Act05Per = 10 * RateThrow
    elseif 3 <= targetDist then
        Act00Per = 20
        Act01Per = 35 * RateNagi
        Act02Per = 10
        Act05Per = 15 * RateThrow
        Act13Per = 20 * RateStep
    elseif 1.4 <= targetDist then
        Act00Per = 5
        Act01Per = 10 * RateNagi
        Act02Per = 10
        Act05Per = 25 * RateThrow
        Act13Per = 50 * RateStep
    elseif -0.5 <= targetDist then
        if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 120) then
            Act05Per = 20 * RateThrow
            Act06Per = 15
            Act07Per = 5 * RateThrow
            Act08Per = 10
            Act13Per = 300 * RateStep
        else
            Act05Per = 20 * RateThrow
            Act06Per = 15
            Act07Per = 5 * RateThrow
            Act08Per = 10
            Act13Per = 50 * RateStep
        end
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 120) then
        Act06Per = 10
        Act07Per = 10 * RateThrow
        Act08Per = 10
        Act13Per = 300 * RateStep
        Act03Per = 5 * RateRightCrush
        Act04Per = 5 * RateLeftCrush
    else
        Act06Per = 10
        Act07Per = 10 * RateThrow
        Act08Per = 10
        Act13Per = 70 * RateStep
        Act03Per = 5 * RateRightCrush
        Act04Per = 5 * RateLeftCrush
    end
    if not not ai:IsInsideObserve(0) or ai:IsInsideObserve(1) then
        Act07Per = 200
    end
    local fateAct = ai:GetRandam_Int(1, Act00Per + Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per + Act10Per + Act11Per + Act12Per + Act13Per)
    if fateAct <= Act00Per then
        IronGolem232000_Act00(ai, goal)
    elseif fateAct <= Act00Per + Act01Per then
        IronGolem232000_Act01(ai, goal)
    elseif fateAct <= Act00Per + Act01Per + Act02Per then
        IronGolem232000_Act02(ai, goal)
    elseif fateAct <= Act00Per + Act01Per + Act02Per + Act03Per then
        IronGolem232000_Act03(ai, goal)
    elseif fateAct <= Act00Per + Act01Per + Act02Per + Act03Per + Act04Per then
        IronGolem232000_Act04(ai, goal)
    elseif fateAct <= Act00Per + Act01Per + Act02Per + Act03Per + Act04Per + Act05Per then
        IronGolem232000_Act05(ai, goal)
    elseif fateAct <= Act00Per + Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per then
        IronGolem232000_Act06(ai, goal)
    elseif fateAct <= Act00Per + Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per then
        IronGolem232000_Act07(ai, goal)
    elseif fateAct <= Act00Per + Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per then
        IronGolem232000_Act08(ai, goal)
    elseif fateAct <= Act00Per + Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per then
        IronGolem232000_Act09(ai, goal)
    elseif fateAct <= Act00Per + Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per + Act10Per then
        IronGolem232000_Act10(ai, goal)
    elseif fateAct <= Act00Per + Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per + Act10Per + Act11Per then
        IronGolem232000_Act11(ai, goal)
    elseif fateAct <= Act00Per + Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per + Act10Per + Act11Per + Act12Per then
        IronGolem232000_Act12(ai, goal)
    else
        IronGolem232000_Act13(ai, goal)
    end
    return 
end

Att3000_Dist_min = Att3000_Dist_max
function IronGolem232000_Act00(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 0
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 70 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_Middle, 2, 45)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_Middle, 2, 45)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
    end
    return 
end

Att3000_Dist_min = Att3002_Dist_max
function IronGolem232000_Act01(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3002_Dist_max
    local dashDist = Att3002_Dist_max + 0
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 75 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3002, TARGET_ENE_0, DIST_Far, 2, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3002, TARGET_ENE_0, DIST_Far, 2, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3008, TARGET_ENE_0, DIST_Middle, 0)
    end
    return 
end

Att3000_Dist_min = Att3003_Dist_max
function IronGolem232000_Act02(ai, goal)
    local approachDist = Att3003_Dist_max
    local dashDist = Att3003_Dist_max + 0
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3003, TARGET_ENE_0, DIST_Middle, 2, 30)
    return 
end

function IronGolem232000_Act03(ai, goal)
    ai:SetTimer(1, 15)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3004, TARGET_ENE_0, DIST_Near, 0, 180)
    return 
end

function IronGolem232000_Act04(ai, goal)
    ai:SetTimer(2, 15)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3005, TARGET_ENE_0, DIST_Near, 0, 180)
    return 
end

Att3000_Dist_min = Att3006_Dist_max
function IronGolem232000_Act05(ai, goal)
    local approachDist = Att3006_Dist_max
    local dashDist = Att3006_Dist_max + 0
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    ai:SetTimer(0, 25)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3006, TARGET_ENE_0, DIST_Middle, 2, 30)
    return 
end

Att3000_Dist_min = Att3007_Dist_max
function IronGolem232000_Act06(ai, goal)
    local approachDist = Att3007_Dist_max
    local dashDist = Att3007_Dist_max + 0
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3007, TARGET_ENE_0, DIST_Middle, 2, 30)
    return 
end

function IronGolem232000_Act07(ai, goal)
    ai:SetTimer(0, 25)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3009, TARGET_ENE_0, DIST_Middle, 0, 180)
    return 
end

Att3000_Dist_min = Att3010_Dist_max
function IronGolem232000_Act08(ai, goal)
    local approachDist = Att3010_Dist_max
    local dashDist = Att3010_Dist_max + 0
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3010, TARGET_ENE_0, DIST_Near, 2, 90)
    return 
end

function IronGolem232000_Act09(ai, goal)
    ai:SetTimer(2, 15)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3011, TARGET_ENE_0, DIST_Near, 0, 180)
    return 
end

Att3000_Dist_min = Att3012_Dist_max
function IronGolem232000_Act10(ai, goal)
    local approachDist = Att3012_Dist_max
    local dashDist = Att3012_Dist_max + 0
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3012, TARGET_ENE_0, DIST_None, -1, 20)
    return 
end

Att3000_Dist_min = Att3012_Dist_max
Att3000_Dist_min = Att3002_Dist_max
function IronGolem232000_Act11(ai, goal)
    ai:SetNumber(0, 1)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 30, TARGET_ENE_0, Att3012_Dist_max, TARGET_SELF, false, -1)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3012, TARGET_ENE_0, DIST_None, -1, 20)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3002_Dist_max, TARGET_SELF, false, -1)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3002, TARGET_ENE_0, DIST_Far, 2, 90)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3008, TARGET_ENE_0, DIST_Middle, 0)
    return 
end

function IronGolem232000_Act12(ai, goal)
    local approachDist = 8.5
    local dashDist = 8.5
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3002, TARGET_ENE_0, DIST_Far, 2, 90)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3008, TARGET_ENE_0, DIST_Middle, 0)
    return 
end

function IronGolem232000_Act13(ai, goal)
    ai:SetTimer(3, 10)
    goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 6)
    return 
end

function IronGolem232000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function IronGolem232000Battle_Terminate(ai, goal)
    return 
end

function IronGolem232000Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local distUseItem_Act = 20
    local oddsUseItem_Act = 50
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if UseItem_Act(ai, goal, distUseItem_Act, oddsUseItem_Act) then
        if 12 <= targetDist then
            IronGolem232000_Act10(ai, goal)
        elseif 8.5 <= targetDist then
            IronGolem232000_Act12(ai, goal)
        elseif 4.1 <= targetDist then
            IronGolem232000_Act01(ai, goal)
        elseif 0 <= targetDist then
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 120) then
                IronGolem232000_Act13(ai, goal)
            else
                IronGolem232000_Act05(ai, goal)
            end
        else
            IronGolem232000_Act13(ai, goal)
        end
        return true
    else
        return false
    end
end

return 
