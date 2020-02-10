REGISTER_GOAL(GOAL_LightKnight_Sword256000_Battle, "LightKnight_Sword256000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 2.2
local Att3003_Dist_min = 0
local Att3003_Dist_max = 2.4
local Att3004_Dist_min = 2.5
local Att3004_Dist_max = 4.5
local Att3005_Dist_min = 0
local Att3005_Dist_max = 2.3
local Att3006_Dist_min = 0
local Att3006_Dist_max = 1.1
REGISTER_GOAL_NO_UPDATE(GOAL_LightKnight_Sword256000_Battle, 1)
function OnIf_256000(ai, goal, codeNo)
    if ai:HasSpecialEffectId(TARGET_SELF, 3151) then
        ai:SetTimer(0, 120)
    else
        ai:SetTimer(0, 30)
    end
    return 
end

Att3000_Dist_min = Att3005_Dist_max
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3003_Dist_max
Att3000_Dist_min = Att3006_Dist_max
Att3000_Dist_min = Att3004_Dist_max
function LightKnight_Sword256000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local hprate = ai:GetHpRate(TARGET_SELF)
    if ai:IsLadderAct(TARGET_SELF) then
        actPerArr[3] = 100
    elseif hprate <= 0.4 and ai:IsFinishTimer(0) == true then
        if 4.5 <= targetDist then
            actPerArr[1] = 7
            actPerArr[2] = 5
            actPerArr[3] = 8
            actPerArr[7] = 5
            actPerArr[8] = 75
        elseif 3 <= targetDist then
            actPerArr[1] = 15
            actPerArr[2] = 15
            actPerArr[3] = 11
            actPerArr[7] = 9
            actPerArr[8] = 50
        else
            actPerArr[1] = 25
            actPerArr[2] = 25
            actPerArr[3] = 15
            actPerArr[7] = 0
            actPerArr[8] = 35
        end
    elseif 4 <= targetDist then
        if ai:IsTargetGuard(TARGET_ENE_0) == true then
            actPerArr[1] = 20
            actPerArr[2] = 15
            actPerArr[3] = 25
            actPerArr[4] = 25
            actPerArr[7] = 15
        else
            actPerArr[1] = 25
            actPerArr[2] = 25
            actPerArr[3] = 15
            actPerArr[4] = 0
            actPerArr[7] = 35
        end
    elseif 2.5 <= targetDist then
        if ai:IsTargetGuard(TARGET_ENE_0) == true then
            actPerArr[1] = 15
            actPerArr[2] = 10
            actPerArr[3] = 25
            actPerArr[4] = 40
            actPerArr[7] = 10
        else
            actPerArr[1] = 30
            actPerArr[2] = 30
            actPerArr[3] = 25
            actPerArr[4] = 0
            actPerArr[7] = 15
        end
    elseif ai:IsTargetGuard(TARGET_ENE_0) == true then
        actPerArr[1] = 10
        actPerArr[2] = 10
        actPerArr[3] = 20
        actPerArr[4] = 60
        actPerArr[7] = 0
    else
        actPerArr[1] = 35
        actPerArr[2] = 35
        actPerArr[3] = 30
        actPerArr[4] = 0
        actPerArr[7] = 0
    end
    local local0 = {Att3005_Dist_max, 75, 3005, DIST_Middle, nil}
    defFuncParamTbl[1] = local0
    local0 = {}
    local local1, local2, local3, local4 = nil
    local0[1] = Att3000_Dist_max
    local0[2] = 75
    local0[3] = 10
    local0[4] = 30
    local0[5] = local1
    local0[6] = local2
    local0[7] = local3
    local0[8] = local4
    defFuncParamTbl[2] = local0
    local0 = {Att3003_Dist_max, 75, 3003, DIST_Middle, nil}
    defFuncParamTbl[3] = local0
    local0 = {Att3006_Dist_max, 75, 3006, DIST_Middle, 3003, DIST_Middle, nil}
    defFuncParamTbl[4] = local0
    local0 = {Att3004_Dist_max, 75, 3004, DIST_Middle, nil}
    defFuncParamTbl[7] = local0
    actFuncArr[8] = REGIST_FUNC(ai, goal, LightKnight_Sword256000_Act08)
    local0 = {100, 60, 10, 10, 0, 10, 10}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace_IncludeSidestep, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3005_Dist_max
function LightKnight_Sword256000_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3008, TARGET_SELF, DIST_None)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3005_Dist_max, TARGET_SELF, false, 9910)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3005, TARGET_ENE_0, DIST_Middle)
    if fate <= 75 then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 4)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function LightKnight_Sword256000_Act06(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3008, TARGET_SELF, DIST_None)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function LightKnight_Sword256000_Act08(ai, goal, paramTbl)
    local fate = ai:GetRandam_Int(1, 100)
    if fate <= 40 then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, 4.5, TARGET_ENE_0, true, 9910)
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3200, TARGET_ENE_0, DIST_None)
    else
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 701, TARGET_ENE_0, -1, AI_DIR_TYPE_B, 2.5)
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3200, TARGET_ENE_0, DIST_None)
    end
    goal:AddSubGoal(GOAL_COMMON_If, 15, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function LightKnight_Sword256000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function LightKnight_Sword256000Battle_Terminate(ai, goal)
    return 
end

Att3000_Dist_min = Att3004_Dist_max
function LightKnight_Sword256000Battle_Interupt(ai, goal)
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    end
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local distResponse = 3
    local oddsResponse = 25
    local oddsStep = 20
    local bkStepPer = 60
    local leftStepPer = 20
    local rightStepPer = 20
    local safetyDist = 2.8
    local oddsLeaveAndSide = 50
    local timeSide = 3.5
    local distLeave = 2.5
    if FindAttack_Step_or_Guard(ai, goal, distResponse, oddsResponse, oddsStep, bkStepPer, leftStepPer, rightStepPer, safetyDist, oddsLeaveAndSide, timeSide, distLeave) then
        return true
    end
    local distResponse = 3
    local oddsResponse = 25
    local oddsStep = 30
    local bkStepPer = 60
    local leftStepPer = 20
    local rightStepPer = 20
    local safetyDist = 2.8
    local oddsLeaveAndSide = 50
    local timeSide = 3.5
    local distLeave = 2.5
    if Damaged_Step_or_Guard(ai, goal, distResponse, oddsResponse, oddsStep, bkStepPer, leftStepPer, rightStepPer, safetyDist, oddsLeaveAndSide, timeSide, distLeave) then
        return true
    end
    local distGuardBreak_Act = 2.4
    local oddsGuardBreak_Act = 30
    if GuardBreak_Act(ai, goal, distGuardBreak_Act, oddsGuardBreak_Act) then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
        return true
    end
    local distMissSwing_Int = 6.5
    local oddsMissSwing_Int = 60
    if MissSwing_Int(ai, goal, distMissSwing_Int, oddsMissSwing_Int) then
        if 2.5 <= targetDist then
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3004_Dist_max, TARGET_SELF, false, -1)
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
        end
        return true
    end
    local distUseItem_Act = 6.5
    local oddsUseItem_Act = 30
    if UseItem_Act(ai, goal, distUseItem_Act, oddsUseItem_Act) then
        if 2.5 <= targetDist then
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3004_Dist_max, TARGET_SELF, false, -1)
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
        end
        return true
    end
    local distResNear = 4.5
    local distResFar = 13
    local oddsResNear = 0
    local oddsResFar = 50
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local ResBehavID = Shoot_2dist(ai, goal, distResNear, distResFar, oddsResNear, oddsResFar)
    if ResBehavID == 1 then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, 9910)
    elseif ResBehavID == 2 then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, 9910)
    end
    local oddsResponse = 50
    local bkStepPer = 60
    local leftStepPer = 20
    local rightStepPer = 20
    local safetyDist = 2.8
    if RebByOpGuard_Step(ai, goal, oddsResponse, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
        return true
    else
        local distSuccessGuard_Act = 2.4
        local oddsSuccessGuard_Act = 50
        if SuccessGuard_Act(ai, goal, distSuccessGuard_Act, oddsSuccessGuard_Act) then
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
            return true
        else
            return false
        end
    end
end

return 
