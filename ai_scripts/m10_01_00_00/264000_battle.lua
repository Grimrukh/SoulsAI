REGISTER_GOAL(GOAL_KajiyaAndre264000_Battle, "KajiyaAndre264000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 0.5
local Att3001_Dist_min = 0
local Att3001_Dist_max = 0.5
local Att3002_Dist_min = 0
local Att3002_Dist_max = 1.3
local Att3003_Dist_min = 0
local Att3003_Dist_max = 1.2
local Att3004_Dist_min = 0
local Att3004_Dist_max = 1.1
local Att3005_Dist_min = 0
local Att3005_Dist_max = 0.8
local Att3006_Dist_min = 0
local Att3006_Dist_max = 1.1
local Att3007_Dist_min = 1
local Att3007_Dist_max = 2.5
REGISTER_GOAL_NO_UPDATE(GOAL_KajiyaAndre264000_Battle, 1)
Att3000_Dist_min = Att3006_Dist_max
function KajiyaAndre264000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local eventNo = ai:GetEventRequest()
    if 4.2 <= targetDist then
        actPerArr[1] = 20
        actPerArr[2] = 80
        actPerArr[3] = 0
        actPerArr[4] = 0
        actPerArr[5] = 0
        actPerArr[6] = 0
    else
        actPerArr[1] = 0
        actPerArr[2] = 20
        actPerArr[3] = 20
        actPerArr[4] = 20
        actPerArr[5] = 20
        actPerArr[6] = 20
    end
    local local0 = {Att3006_Dist_max, 0, 3006, DIST_Near}
    defFuncParamTbl[1] = local0
    actFuncArr[2] = REGIST_FUNC(ai, goal, KajiyaAndre264000_Act02)
    actFuncArr[3] = REGIST_FUNC(ai, goal, KajiyaAndre264000_Act03)
    actFuncArr[4] = REGIST_FUNC(ai, goal, KajiyaAndre264000_Act04)
    actFuncArr[5] = REGIST_FUNC(ai, goal, KajiyaAndre264000_Act05)
    actFuncArr[6] = REGIST_FUNC(ai, goal, KajiyaAndre264000_Act06)
    local atkAfterFunc = REGIST_FUNC(ai, goal, KajiyaAndre264000_ActAfter_AdjustSpace)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3007_Dist_max
function KajiyaAndre264000_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3007_Dist_max
    local dashDist = Att3007_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 3, 3007, TARGET_ENE_0, DIST_Near, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3000_Dist_max
function KajiyaAndre264000_Act03(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Near, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3003, TARGET_ENE_0, DIST_Near, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3001, TARGET_ENE_0, DIST_Near, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, DIST_Near, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3000_Dist_max
function KajiyaAndre264000_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Near, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3001, TARGET_ENE_0, DIST_Near, 0)
    end
    if fate2 <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3000, TARGET_ENE_0, DIST_Near, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3003, TARGET_ENE_0, DIST_Near, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Near, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, DIST_Near, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3000_Dist_max
function KajiyaAndre264000_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 0
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3004, TARGET_ENE_0, DIST_Near, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3005, TARGET_ENE_0, DIST_Near, 0)
    end
    if fate2 <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3004, TARGET_ENE_0, DIST_Near, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3003, TARGET_ENE_0, DIST_Near, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3005, TARGET_ENE_0, DIST_Near, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, DIST_Near, 0)
    end
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3006, TARGET_ENE_0, DIST_Near, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3000_Dist_max
function KajiyaAndre264000_Act06(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local fate4 = ai:GetRandam_Int(1, 100)
    local fate5 = ai:GetRandam_Int(1, 100)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 25 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Near, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3005, TARGET_ENE_0, DIST_Near, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, DIST_Near, 0)
    elseif fate <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3001, TARGET_ENE_0, DIST_Near, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3004, TARGET_ENE_0, DIST_Near, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3003, TARGET_ENE_0, DIST_Near, 0)
    elseif fate <= 75 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Near, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3005, TARGET_ENE_0, DIST_Near, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3006, TARGET_ENE_0, DIST_Near, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3001, TARGET_ENE_0, DIST_Near, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3004, TARGET_ENE_0, DIST_Near, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3006, TARGET_ENE_0, DIST_Near, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function KajiyaAndre264000_ActAfter_AdjustSpace(ai, goal, paramTbl)
    local GW_fate = ai:GetRandam_Int(0, 100)
    local bRight = ai:GetRandam_Int(0, 1)
    local friendNum = ai:GetTeamRecordCount(COORDINATE_TYPE_SideWalk_L + bRight, TARGET_ENE_0, 2)
    if GW_fate <= 30 and friendNum < 2 then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, 2, TARGET_ENE_0, true, -1)
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, bRight, ai:GetRandam_Int(30, 45), true, true, -1)
    elseif GW_fate <= 60 then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, 3, TARGET_ENE_0, true, -1)
    elseif GW_fate <= 80 then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 4)
    else
        local fate = ai:GetRandam_Int(1, 100)
        if fate <= 50 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
        end
    end
    return 
end

function KajiyaAndre264000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function KajiyaAndre264000Battle_Terminate(ai, goal)
    return 
end

Att3000_Dist_min = Att3006_Dist_max
Att3000_Dist_min = Att3007_Dist_max
function KajiyaAndre264000Battle_Interupt(ai, goal)
    local superStepDist = 3
    local superStepPer = 35
    local bkStepPer = 30
    local leftStepPer = 35
    local rightStepPer = 35
    if FindAttack_Step(ai, goal, superStepDist, superStepPer, bkStepPer, leftStepPer, rightStepPer) then
        return true
    else
        local distDamagedStep = 3
        local oddsDamagedStep = 25
        local bkStepPer = 30
        local leftStepPer = 35
        local rightStepPer = 35
        local safetyDist = 4
        if Damaged_Step(ai, goal, distDamagedStep, oddsDamagedStep, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
            return true
        else
            local distGuardBreak_Act = 2
            local oddsGuardBreak_Act = 35
            local fate = ai:GetRandam_Int(1, 100)
            if GuardBreak_Act(ai, goal, distGuardBreak_Act, oddsGuardBreak_Act) then
                if fate <= 50 then
                    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3006_Dist_max, TARGET_SELF, false, -1)
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3006, TARGET_ENE_0, DIST_Middle, 0)
                else
                    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3007_Dist_max, TARGET_SELF, false, -1)
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
                end
                return true
            else
                local distUseItem_Act = 5
                local oddsUseItem_Act = 30
                local fate = ai:GetRandam_Int(1, 100)
                if UseItem_Act(ai, goal, distUseItem_Act, oddsUseItem_Act) then
                    if fate <= 50 then
                        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3006_Dist_max, TARGET_SELF, false, -1)
                        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3006, TARGET_ENE_0, DIST_Middle, 0)
                    else
                        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3007_Dist_max, TARGET_SELF, false, -1)
                        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
                    end
                    return true
                else
                    local distResNear = 8.5
                    local distResFar = 18
                    local oddsResNear = 0
                    local oddsResFar = 30
                    local fate = ai:GetRandam_Int(1, 100)
                    local fate2 = ai:GetRandam_Int(1, 100)
                    local ResBehavID = Shoot_2dist(ai, goal, distResNear, distResFar, oddsResNear, oddsResFar)
                    if ResBehavID == 1 then
                        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
                        return true
                    elseif ResBehavID == 2 then
                        if fate <= 50 then
                            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3007_Dist_max, TARGET_SELF, false, -1)
                            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
                            return true
                        elseif fate <= 75 then
                            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
                        else
                            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
                        end
                        return true
                    else
                        local oddsResponse = 20
                        local bkStepPer = 60
                        local leftStepPer = 20
                        local rightStepPer = 20
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
    end
end

return 
