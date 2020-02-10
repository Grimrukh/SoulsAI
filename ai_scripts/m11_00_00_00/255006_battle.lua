REGISTER_GOAL(GOAL_HusiHeavy_Bow_only255006_Battle, "HusiHeavy_Bow_only255006Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_HusiHeavy_Bow_only255006_Battle, 1)
function OnIf_255006(ai, goal, codeNo)
    if ai:HasSpecialEffectId(TARGET_SELF, 3151) then
        ai:SetTimer(0, 120)
    else
        ai:SetTimer(0, 30)
    end
    return 
end

function HusiHeavy_Bow_only255006Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local hprate = ai:GetHpRate(TARGET_SELF)
    local myThinkId = ai:GetNpcThinkParamID()
    if hprate <= 0.4 and ai:IsFinishTimer(0) == true then
        if 20 <= targetDist then
            actPerArr[1] = 25
            actPerArr[2] = 0
            actPerArr[3] = 0
            actPerArr[4] = 75
        elseif 10 <= targetDist then
            actPerArr[1] = 15
            actPerArr[2] = 10
            actPerArr[3] = 0
            actPerArr[4] = 75
        elseif 4.5 <= targetDist then
            actPerArr[1] = 0
            actPerArr[2] = 15
            actPerArr[3] = 10
            actPerArr[4] = 75
        elseif 3 <= targetDist then
            actPerArr[1] = 0
            actPerArr[2] = 15
            actPerArr[3] = 35
            actPerArr[4] = 50
        else
            actPerArr[1] = 0
            actPerArr[2] = 0
            actPerArr[3] = 65
            actPerArr[4] = 35
        end
    elseif 20 <= targetDist then
        actPerArr[1] = 100
    elseif 10 <= targetDist then
        actPerArr[1] = 70
        actPerArr[2] = 30
    elseif 5 <= targetDist then
        actPerArr[2] = 60
        actPerArr[3] = 40
    else
        actPerArr[3] = 100
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, HusiHeavy_Bow_only255006_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, HusiHeavy_Bow_only255006_Act02)
    actFuncArr[3] = REGIST_FUNC(ai, goal, HusiHeavy_Bow_only255006_Act03)
    actFuncArr[4] = REGIST_FUNC(ai, goal, HusiHeavy_Bow_only255006_Act04)
    local local0 = {0, 100, 0, 0, 0, 0, 0}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace_IncludeSidestep, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

function HusiHeavy_Bow_only255006_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local myThinkId = ai:GetNpcThinkParamID()
    if myThinkId == 255004 then
        if fate <= 50 then
            local FirstAttID = 3000
            local ComAttID = 3001
            local ShootNum = ai:GetRandam_Int(2, 5)
            Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
        else
            local FirstAttID = 3002
            local ComAttID = 3003
            local ShootNum = ai:GetRandam_Int(2, 5)
            Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
        end
    else
        local FirstAttID = 3000
        local ComAttID = 3001
        local ShootNum = ai:GetRandam_Int(2, 5)
        Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function HusiHeavy_Bow_only255006_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local myThinkId = ai:GetNpcThinkParamID()
    if myThinkId == 255004 then
        if fate <= 50 then
            local FirstAttID = 3000
            local ComAttID = 3001
            local ShootNum = ai:GetRandam_Int(2, 5)
            Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
        else
            local FirstAttID = 3002
            local ComAttID = 3003
            local ShootNum = ai:GetRandam_Int(2, 5)
            Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
        end
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2, TARGET_ENE_0, 20, TARGET_ENE_0, true, -1)
    else
        local FirstAttID = 3000
        local ComAttID = 3001
        local ShootNum = ai:GetRandam_Int(2, 5)
        Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2, TARGET_ENE_0, 20, TARGET_ENE_0, true, -1)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function HusiHeavy_Bow_only255006_Act03(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local myThinkId = ai:GetNpcThinkParamID()
    if myThinkId == 255004 then
        if fate <= 50 then
            local FirstAttID = 3000
            local ComAttID = 3001
            local ShootNum = ai:GetRandam_Int(1, 3)
            Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
        else
            local FirstAttID = 3002
            local ComAttID = 3003
            local ShootNum = ai:GetRandam_Int(1, 3)
            Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
        end
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, 20, TARGET_SELF, false, -1)
    else
        local FirstAttID = 3000
        local ComAttID = 3001
        local ShootNum = ai:GetRandam_Int(1, 3)
        Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function HusiHeavy_Bow_only255006_Act04(ai, goal, paramTbl)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, 4.5, TARGET_ENE_0, true, -1)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3200, TARGET_ENE_0, DIST_None)
    goal:AddSubGoal(GOAL_COMMON_If, 15, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function HusiHeavy_Bow_only255006Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function HusiHeavy_Bow_only255006Battle_Terminate(ai, goal)
    return 
end

function HusiHeavy_Bow_only255006Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local superStepDist = 3
    local superStepPer = 10
    local bkStepPer = 50
    local leftStepPer = 25
    local rightStepPer = 25
    if FindAttack_Step(ai, goal, superStepDist, superStepPer, bkStepPer, leftStepPer, rightStepPer) then
        return true
    else
        local distDamagedStep = 3
        local oddsDamagedStep = 15
        local bkStepPer = 50
        local leftStepPer = 25
        local rightStepPer = 25
        local safetyDist = 4
        if Damaged_Step(ai, goal, distDamagedStep, oddsDamagedStep, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
            return true
        else
            return false
        end
    end
end

return 
