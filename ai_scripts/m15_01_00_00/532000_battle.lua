REGISTER_GOAL(GOAL_ImperialMother532000_Battle, "ImperialMother532000Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_ImperialMother532000_Battle, 1)
function ImperialMother532000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local eventNo = ai:GetEventRequest()
    ai:AddObserveArea(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 360, 15)
    local FirstImpression = ai:GetNumber(0)
    local WarpOdds = 1
    if eventNo == 1 then
        WarpOdds = 0
    end
    if FirstImpression == 0 then
        actPerArr[6] = 100
    elseif ai:HasSpecialEffectId(TARGET_SELF, 5400) then
        if 75 <= targetDist then
            actPerArr[5] = 100
        elseif 25 <= targetDist then
            actPerArr[1] = 30
            actPerArr[2] = 35
            actPerArr[3] = 35
            actPerArr[4] = 0 * WarpOdds
            actPerArr[5] = 0
        elseif 12 <= targetDist then
            actPerArr[1] = 40
            actPerArr[2] = 35
            actPerArr[3] = 25
            actPerArr[4] = 0 * WarpOdds
            actPerArr[5] = 0
        elseif 6 <= targetDist then
            actPerArr[1] = 30
            actPerArr[2] = 40
            actPerArr[3] = 30
            actPerArr[4] = 0 * WarpOdds
            actPerArr[5] = 0
        else
            actPerArr[1] = 5
            actPerArr[2] = 35
            actPerArr[3] = 60
            actPerArr[4] = 0 * WarpOdds
            actPerArr[5] = 0
        end
    elseif 75 <= targetDist then
        actPerArr[5] = 100
    elseif 25 <= targetDist then
        actPerArr[1] = 20
        actPerArr[2] = 35
        actPerArr[3] = 35
        actPerArr[4] = 0 * WarpOdds
        actPerArr[5] = 0
    elseif 12 <= targetDist then
        actPerArr[1] = 35
        actPerArr[2] = 45
        actPerArr[3] = 20
        actPerArr[4] = 0 * WarpOdds
        actPerArr[5] = 0
    elseif 6 <= targetDist then
        actPerArr[1] = 15
        actPerArr[2] = 55
        actPerArr[3] = 30
        actPerArr[4] = 0 * WarpOdds
        actPerArr[5] = 0
    else
        actPerArr[1] = 0
        actPerArr[2] = 40
        actPerArr[3] = 60
        actPerArr[4] = 0 * WarpOdds
        actPerArr[5] = 0
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, ImperialMother532000_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, ImperialMother532000_Act02)
    actFuncArr[3] = REGIST_FUNC(ai, goal, ImperialMother532000_Act03)
    actFuncArr[4] = REGIST_FUNC(ai, goal, ImperialMother532000_Act04)
    actFuncArr[5] = REGIST_FUNC(ai, goal, ImperialMother532000_Act05)
    actFuncArr[6] = REGIST_FUNC(ai, goal, ImperialMother532000_Act06)
    local local0 = {0, 70, 0, 0, 30, 0, 0}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace_IncludeSidestep, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

function ImperialMother532000_Act01(ai, goal)
    if ai:HasSpecialEffectId(TARGET_SELF, 5401) then
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3005, TARGET_ENE_0, DIST_None, 0)
    end
    local FirstAttID = 3000
    local ComAttID = 3001
    local ShootNum = ai:GetRandam_Int(2, 3)
    Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ImperialMother532000_Act02(ai, goal)
    if ai:HasSpecialEffectId(TARGET_SELF, 5400) then
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3004, TARGET_ENE_0, DIST_None, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3003, TARGET_ENE_0, DIST_None, 1.5, 20)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ImperialMother532000_Act03(ai, goal)
    if ai:HasSpecialEffectId(TARGET_SELF, 5400) then
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3004, TARGET_ENE_0, DIST_None, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3006, TARGET_ENE_0, DIST_None, 1.5, 20)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ImperialMother532000_Act04(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    if ai:HasSpecialEffectId(TARGET_SELF, 5400) then
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3004, TARGET_ENE_0, DIST_None, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3002, TARGET_ENE_0, DIST_None, 0, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ImperialMother532000_Act05(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(1, 2), TARGET_ENE_0, 0, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ImperialMother532000_Act06(ai, goal)
    ai:SetNumber(0, 1)
    if ai:HasSpecialEffectId(TARGET_SELF, 5400) then
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3004, TARGET_ENE_0, DIST_None, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3002, TARGET_ENE_0, DIST_None, 0, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ImperialMother532000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function ImperialMother532000Battle_Terminate(ai, goal)
    return 
end

function ImperialMother532000Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local eventNo = ai:GetEventRequest()
    if ai:IsInterupt(INTERUPT_Damaged) and targetDist <= 3 and eventNo ~= 1 then
        goal:ClearSubGoal()
        if ai:HasSpecialEffectId(TARGET_SELF, 5400) then
            goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3004, TARGET_ENE_0, DIST_None, 0)
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3002, TARGET_ENE_0, DIST_None, 0, -1)
        return true
    elseif ai:IsInterupt(INTERUPT_Inside_ObserveArea) and eventNo ~= 1 then
        goal:ClearSubGoal()
        if ai:HasSpecialEffectId(TARGET_SELF, 5400) then
            goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3004, TARGET_ENE_0, DIST_None, 0)
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3002, TARGET_ENE_0, DIST_None, 0, -1)
        return true
    else
        return false
    end
end

return 
