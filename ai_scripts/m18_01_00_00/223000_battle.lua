REGISTER_GOAL(GOAL_GreaterDemon223000_Battle, "GreaterDemon223000Battle")
local Att3000_Dist_min = 6
local Att3000_Dist_max = 12
local Att3002_Dist_min = 4
local Att3002_Dist_max = 12
local Att3004_Dist_min = 14
local Att3004_Dist_max = 19
local Att3005_Dist_min = -3
local Att3005_Dist_max = 2
local Att3006_Dist_min = 3
local Att3006_Dist_max = 10
local Att3007_Dist_min = -3
local Att3007_Dist_max = 5
REGISTER_GOAL_NO_UPDATE(GOAL_GreaterDemon223000_Battle, 1)
Att3000_Dist_min = Att3000_Dist_max
function GreaterDemon223000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local eventNo = ai:GetEventRequest(0)
    if eventNo == 10 then
        actPerArr[9] = 100
    elseif 14 <= targetDist then
        actPerArr[1] = 10
        actPerArr[2] = 5
        actPerArr[4] = 0
        actPerArr[5] = 20
        actPerArr[6] = 0
        actPerArr[7] = 65
        actPerArr[8] = 0
    elseif 10 <= targetDist then
        actPerArr[1] = 50
        actPerArr[2] = 40
        actPerArr[4] = 0
        actPerArr[5] = 10
        actPerArr[6] = 0
        actPerArr[7] = 0
        actPerArr[8] = 0
    elseif 6 <= targetDist then
        actPerArr[1] = 25
        actPerArr[2] = 25
        actPerArr[4] = 0
        actPerArr[5] = 40
        actPerArr[6] = 0
        actPerArr[7] = 0
        actPerArr[8] = 10
    elseif 2.5 <= targetDist then
        actPerArr[1] = 0
        actPerArr[2] = 0
        actPerArr[4] = 0
        actPerArr[5] = 50
        actPerArr[6] = 15
        actPerArr[7] = 0
        actPerArr[8] = 35
    elseif 0.5 <= targetDist then
        actPerArr[1] = 0
        actPerArr[2] = 0
        actPerArr[4] = 10
        actPerArr[5] = 0
        actPerArr[6] = 55
        actPerArr[7] = 0
        actPerArr[8] = 35
    else
        actPerArr[1] = 0
        actPerArr[2] = 0
        actPerArr[4] = 50
        actPerArr[5] = 0
        actPerArr[6] = 25
        actPerArr[7] = 0
        actPerArr[8] = 25
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, GreaterDemon223000_Act01)
    local local0 = {Att3000_Dist_max, 0, 20, 80}
    defFuncParamTbl[2] = local0
    actFuncArr[4] = REGIST_FUNC(ai, goal, GreaterDemon223000_Act04)
    actFuncArr[5] = REGIST_FUNC(ai, goal, GreaterDemon223000_Act05)
    actFuncArr[6] = REGIST_FUNC(ai, goal, GreaterDemon223000_Act06)
    actFuncArr[7] = REGIST_FUNC(ai, goal, GreaterDemon223000_Act07)
    actFuncArr[8] = REGIST_FUNC(ai, goal, GreaterDemon223000_Act08)
    actFuncArr[9] = REGIST_FUNC(ai, goal, GreaterDemon223000_Act09)
    local atkAfterFunc = REGIST_FUNC(ai, goal, GreaterDemon223000_ActAfter_AdjustSpace)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3002_Dist_max
function GreaterDemon223000_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3002_Dist_max
    local dashDist = Att3002_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 10 then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3005_Dist_max
function GreaterDemon223000_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3005_Dist_max
    local dashDist = Att3005_Dist_max + 6
    local Odds_Guard = 0
    local AttID = 3005
    local AttDist = DIST_Middle
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3005, TARGET_ENE_0, DIST_Middle, 0, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3006_Dist_max
function GreaterDemon223000_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3006_Dist_max
    local dashDist = Att3006_Dist_max + 6
    local Odds_Guard = 0
    local AttID = 3006
    local AttDist = DIST_Far
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3007_Dist_max
function GreaterDemon223000_Act06(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3007_Dist_max
    local dashDist = Att3007_Dist_max + 6
    local Odds_Guard = 0
    local AttID = 3007
    local AttDist = DIST_Middle
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3007, TARGET_ENE_0, DIST_Middle, 0, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3004_Dist_max
function GreaterDemon223000_Act07(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3004_Dist_max
    local dashDist = Att3004_Dist_max + 6
    local Odds_Guard = 0
    local AttID = 3004
    local AttDist = DIST_Middle
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function GreaterDemon223000_Act08(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 701, TARGET_ENE_0, -1, AI_DIR_TYPE_B, 6)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function GreaterDemon223000_Act09(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_MoveToSomewhere, 20, POINT_MOVE_POINT, AI_DIR_TYPE_CENTER, 2, TARGET_SELF, true)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function GreaterDemon223000_ActAfter_AdjustSpace(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if fate > 75 then
        if fate <= 90 then
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 2.5, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(15, 30), true, true, -1)
            return true
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 701, TARGET_ENE_0, -1, AI_DIR_TYPE_B, 6)
            return true
        end
    else
        return false
    end
end

function GreaterDemon223000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function GreaterDemon223000Battle_Terminate(ai, goal)
    return 
end

function GreaterDemon223000Battle_Interupt(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local superStepDist = 3
    local superStepPer = 5
    local bkStepPer = 100
    local leftStepPer = 0
    local rightStepPer = 0
    local safetyDist = 6
    if FindAttack_Step(ai, goal, superStepDist, superStepPer, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
        return true
    else
        local distDamagedStep = 3
        local oddsDamagedStep = 5
        local bkStepPer = 100
        local leftStepPer = 0
        local rightStepPer = 0
        local safetyDist = 6
        if Damaged_Step(ai, goal, distDamagedStep, oddsDamagedStep, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
            return true
        else
            local distUseItem_Act = 12
            local oddsUseItem_Act = 15
            local targetDist = ai:GetDist(TARGET_ENE_0)
            if UseItem_Act(ai, goal, distUseItem_Act, oddsUseItem_Act) then
                if 10 <= targetDist then
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                elseif 6 <= targetDist then
                    if fate <= 50 then
                        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                    else
                        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3006, TARGET_ENE_0, DIST_Middle, 0)
                    end
                elseif 3 <= targetDist then
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3006, TARGET_ENE_0, DIST_Middle, 0)
                else
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
                end
                return true
            else
                return false
            end
        end
    end
end

return 
