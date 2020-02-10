REGISTER_GOAL(GOAL_Go_HawkEye411000_Battle, "Go_HawkEye411000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 1
local Att3001_Dist_min = 0
local Att3001_Dist_max = 1
local Att3002_Dist_min = 0
local Att3002_Dist_max = 2
local Att3003_Dist_min = 0
local Att3003_Dist_max = 2
local Att3004_Dist_min = 0
local Att3004_Dist_max = 2.5
local Att3005_Dist_min = 0
local Att3005_Dist_max = 2.5
local Att3006_Dist_min = 0
local Att3006_Dist_max = 2
local Att3007_Dist_min = 0
local Att3007_Dist_max = 2
local Att3008_Dist_min = 0
local Att3008_Dist_max = 100
REGISTER_GOAL_NO_UPDATE(GOAL_Go_HawkEye411000_Battle, 1)
function OnIf_411000(ai, goal, codeNo)
    if codeNo == 0 then
        Go_HawkEye411000_ActAfter_RealTime(ai, goal)
    end
    return 
end

function Go_HawkEye411000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local fate4 = ai:GetRandam_Int(1, 100)
    local eventNo = ai:GetEventRequest(0)
    if eventNo == 10 then
        actPerArr[10] = 100
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 90) then
        if targetDist <= 1 then
            actPerArr[7] = 100
        else
            actPerArr[5] = 0
            actPerArr[6] = 0
            actPerArr[7] = 0
            actPerArr[8] = 0
            actPerArr[9] = 0
            if ai:GetNumber(0) == 1 then
                actPerArr[1] = 0
                actPerArr[2] = 50
                actPerArr[3] = 0
                actPerArr[4] = 50
            else
                actPerArr[1] = 50
                actPerArr[2] = 0
                actPerArr[3] = 50
                actPerArr[4] = 0
            end
        end
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 90) then
        actPerArr[1] = 33
        actPerArr[2] = 0
        actPerArr[3] = 33
        actPerArr[4] = 0
        actPerArr[5] = 34
        actPerArr[6] = 0
        actPerArr[7] = 0
        actPerArr[8] = 0
        actPerArr[9] = 0
    elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 90) then
        actPerArr[1] = 0
        actPerArr[2] = 33
        actPerArr[3] = 0
        actPerArr[4] = 33
        actPerArr[5] = 0
        actPerArr[6] = 34
        actPerArr[7] = 0
        actPerArr[8] = 0
        actPerArr[9] = 0
    elseif targetDist <= 1 then
        actPerArr[8] = 100
    else
        actPerArr[3] = 0
        actPerArr[4] = 0
        actPerArr[7] = 0
        actPerArr[8] = 0
        actPerArr[9] = 0
        if ai:GetNumber(0) == 1 then
            actPerArr[1] = 0
            actPerArr[2] = 50
            actPerArr[5] = 0
            actPerArr[6] = 50
        else
            actPerArr[1] = 50
            actPerArr[2] = 0
            actPerArr[5] = 50
            actPerArr[6] = 0
        end
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, Go_HawkEye411000_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, Go_HawkEye411000_Act02)
    actFuncArr[3] = REGIST_FUNC(ai, goal, Go_HawkEye411000_Act03)
    actFuncArr[4] = REGIST_FUNC(ai, goal, Go_HawkEye411000_Act04)
    actFuncArr[5] = REGIST_FUNC(ai, goal, Go_HawkEye411000_Act05)
    actFuncArr[6] = REGIST_FUNC(ai, goal, Go_HawkEye411000_Act06)
    actFuncArr[7] = REGIST_FUNC(ai, goal, Go_HawkEye411000_Act07)
    actFuncArr[8] = REGIST_FUNC(ai, goal, Go_HawkEye411000_Act08)
    actFuncArr[9] = REGIST_FUNC(ai, goal, Go_HawkEye411000_Act09)
    actFuncArr[10] = REGIST_FUNC(ai, goal, Go_HawkEye411000_Act10)
    local atkAfterFunc = REGIST_FUNC(ai, goal, Go_HawkEye411000_ActAfter_AdjustSpace)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3000_Dist_max
function Go_HawkEye411000_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max
    local Odds_Guard = 0
    local fate = ai:GetRandam_Int(1, 100)
    if approachDist <= targetDist then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
    end
    if fate <= 25 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_Middle, 2, 45)
        ai:SetNumber(0, 1)
    elseif fate <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_Middle, 0, 30, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3011, TARGET_ENE_0, DIST_Middle, 0)
        ai:SetNumber(0, 0)
    elseif fate <= 75 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_Middle, 0, 30, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3011, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3012, TARGET_ENE_0, DIST_Middle, 0)
        ai:SetNumber(0, 1)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_Middle, 0, 30, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3011, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3012, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3013, TARGET_ENE_0, DIST_Middle, 0)
        ai:SetNumber(0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3001_Dist_max
function Go_HawkEye411000_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3001_Dist_max
    local dashDist = Att3001_Dist_max
    local Odds_Guard = 0
    local fate = ai:GetRandam_Int(1, 100)
    if approachDist <= targetDist then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
    end
    if fate <= 33 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3001, TARGET_ENE_0, DIST_Middle, 2, 45)
        ai:SetNumber(0, 0)
    elseif fate <= 66 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3001, TARGET_ENE_0, DIST_Middle, 0, 30, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3012, TARGET_ENE_0, DIST_Middle, 0)
        ai:SetNumber(0, 1)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3001, TARGET_ENE_0, DIST_Middle, 0, 30, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3012, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3013, TARGET_ENE_0, DIST_Middle, 0)
        ai:SetNumber(0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3002_Dist_max
function Go_HawkEye411000_Act03(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3002_Dist_max
    local dashDist = Att3002_Dist_max
    local Odds_Guard = 0
    local fate = ai:GetRandam_Int(1, 100)
    if approachDist <= targetDist then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
    end
    if fate <= 50 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3002, TARGET_ENE_0, DIST_Middle, 2, 45)
        ai:SetNumber(0, 1)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3002, TARGET_ENE_0, DIST_Middle, 0, 30, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3013, TARGET_ENE_0, DIST_Middle, 0)
        ai:SetNumber(0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3003_Dist_max
function Go_HawkEye411000_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3003_Dist_max
    local dashDist = Att3003_Dist_max
    local Odds_Guard = 0
    if approachDist <= targetDist then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3003, TARGET_ENE_0, DIST_Middle, 2, 45)
    ai:SetNumber(0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3004_Dist_max
function Go_HawkEye411000_Act05(ai, goal, paramTbl)
    local approachDist = Att3004_Dist_max
    local dashDist = Att3004_Dist_max
    local Odds_Guard = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3004, TARGET_ENE_0, DIST_Middle, 0, 360)
    ai:SetNumber(0, 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3005_Dist_max
function Go_HawkEye411000_Act06(ai, goal, paramTbl)
    local approachDist = Att3005_Dist_max
    local dashDist = Att3005_Dist_max
    local Odds_Guard = 0
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3005, TARGET_ENE_0, DIST_Middle, 0, 360)
    ai:SetNumber(0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3006_Dist_max
function Go_HawkEye411000_Act07(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3006_Dist_max
    local dashDist = Att3006_Dist_max
    local Odds_Guard = 0
    if approachDist <= targetDist then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3006, TARGET_ENE_0, DIST_Middle, 0, 360)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3007_Dist_max
function Go_HawkEye411000_Act08(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3007_Dist_max
    local dashDist = Att3007_Dist_max
    local Odds_Guard = 0
    if approachDist <= targetDist then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3007, TARGET_ENE_0, DIST_Middle, 0, 360)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Go_HawkEye411000_Act09(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3008, TARGET_ENE_0, DIST_Middle, 0, 360)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Go_HawkEye411000_Act10(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 30, POINT_INITIAL, 0, TARGET_NONE, false, -1)
    return 
end

function Go_HawkEye411000_ActAfter_AdjustSpace(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_If, 10, 0)
    return 
end

function Go_HawkEye411000_ActAfter_RealTime(ai, goal)
    return 
end

function Go_HawkEye411000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Go_HawkEye411000Battle_Terminate(ai, goal)
    return 
end

function Go_HawkEye411000Battle_Interupt(ai, goal)
    return false
end

return 
