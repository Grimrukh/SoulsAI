REGISTER_GOAL(GOAL_Husi_Torch250001_Battle, "Husi_Torch250001Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 2
local Att3002_Dist_min = 2
local Att3002_Dist_max = 6
local Att3003_Dist_min = 2.9
local Att3003_Dist_max = 3.9
local Att3004_Dist_min = 4.6
local Att3004_Dist_max = 6.1
local Att3005_Dist_min = 6.7
local Att3005_Dist_max = 8.2
local Att3006_Dist_min = 1.35
local Att3006_Dist_max = 1.6
REGISTER_GOAL_NO_UPDATE(GOAL_Husi_Torch250001_Battle, 1)
Att3000_Dist_min = Att3006_Dist_max
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3002_Dist_max
function Husi_Torch250001Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if 9 <= targetDist then
        actPerArr[1] = 15
        actPerArr[2] = 0
        actPerArr[3] = 25
        actPerArr[7] = 60
    elseif 6 <= targetDist then
        actPerArr[1] = 20
        actPerArr[2] = 5
        actPerArr[3] = 40
        actPerArr[7] = 35
    elseif 3.5 <= targetDist then
        actPerArr[1] = 10
        actPerArr[2] = 40
        actPerArr[3] = 25
        actPerArr[7] = 25
    else
        actPerArr[1] = 30
        actPerArr[2] = 70
        actPerArr[3] = 0
        actPerArr[7] = 0
    end
    local local0 = {Att3006_Dist_max, 0, 3006, DIST_Far, 0}
    defFuncParamTbl[1] = local0
    local0 = {}
    local local1, local2, local3, local4 = nil
    local0[1] = Att3000_Dist_max
    local0[2] = 0
    local0[3] = 30
    local0[4] = 70
    local0[5] = local1
    local0[6] = local2
    local0[7] = local3
    local0[8] = local4
    defFuncParamTbl[2] = local0
    local0 = {Att3002_Dist_max, 0, 3002, DIST_Middle}
    defFuncParamTbl[3] = local0
    actFuncArr[7] = REGIST_FUNC(ai, goal, Husi_Torch250001_Act07)
    local0 = {0, 50, 10, 15, 25, 0}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3005_Dist_min
Att3000_Dist_min = Att3005_Dist_max
Att3000_Dist_min = Att3004_Dist_min
Att3000_Dist_min = Att3004_Dist_max
Att3000_Dist_min = Att3003_Dist_max
function Husi_Torch250001_Act07(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    if Att3005_Dist_min <= targetDist and fate <= 20 then
        local approachDist = Att3005_Dist_max
        local dashDist = Att3005_Dist_max + 2
        local Odds_Guard = 0
        local AttID = 3005
        local AttDist = DIST_Middle
        Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    elseif Att3004_Dist_min <= targetDist and fate2 <= 50 then
        local approachDist = Att3004_Dist_max
        local dashDist = Att3004_Dist_max + 2
        local Odds_Guard = 0
        local AttID = 3004
        local AttDist = DIST_Middle
        Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    else
        local approachDist = Att3003_Dist_max
        local dashDist = Att3003_Dist_max + 2
        local Odds_Guard = 0
        local AttID = 3003
        local AttDist = DIST_Middle
        Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Husi_Torch250001Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Husi_Torch250001Battle_Terminate(ai, goal)
    return 
end

function Husi_Torch250001Battle_Interupt(ai, goal)
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    else
        local fate = ai:GetRandam_Int(1, 100)
        local fate2 = ai:GetRandam_Int(1, 100)
        local fate3 = ai:GetRandam_Int(1, 100)
        local targetDist = ai:GetDist(TARGET_ENE_0)
        local distDamagedStep = 3
        local oddsDamagedStep = 15
        local bkStepPer = 30
        local leftStepPer = 35
        local rightStepPer = 35
        local safetyDist = 4
        if Damaged_Step(ai, goal, distDamagedStep, oddsDamagedStep, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
            return true
        else
            local distMissSwing_Attack = 2
            local oddsMissSwing_Attack = 10
            local AttID = 3000
            if MissSwing_Attack(ai, goal, distMissSwing_Attack, oddsMissSwing_Attack, AttID) then
                return true
            else
                local oddsResponse = 10
                local bkStepPer = 30
                local leftStepPer = 35
                local rightStepPer = 35
                local safetyDist = 4
                if RebByOpGuard_Step(ai, goal, oddsResponse, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
                    return true
                else
                    return false
                end
            end
        end
    end
end

return 
