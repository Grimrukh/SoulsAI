REGISTER_GOAL(GOAL_FourKnightD_m17_237001_Battle, "FourKnightD_m17_237001Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 3.1
local Att3003_Dist_min = 0
local Att3003_Dist_max = 3.5
local Att3005_Dist_min = 2.5
local Att3005_Dist_max = 4
local Att3006_Dist_min = 4
local Att3006_Dist_max = 6
local Att3007_Dist_min = 6
local Att3007_Dist_max = 7.5
local Att3009_Dist_min = 0
local Att3009_Dist_max = 4.1
REGISTER_GOAL_NO_UPDATE(GOAL_FourKnightD_m17_237001_Battle, 1)
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3003_Dist_max
function FourKnightD_m17_237001Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if ai:ChkNearLowHpFriend(1, 20) and not ai:HasSpecialEffectId(TARGET_SELF, 5470) then
        if 8 <= targetDist then
            actPerArr[5] = 900
        elseif 4 <= targetDist then
            actPerArr[5] = 50
        elseif 2.5 <= targetDist then
            actPerArr[5] = 45
        else
            actPerArr[5] = 20
        end
    end
    if 8 <= targetDist then
        actPerArr[1] = 40
        actPerArr[2] = 0
        actPerArr[3] = 60
        actPerArr[9] = 0
    elseif 4 <= targetDist then
        actPerArr[1] = 30
        actPerArr[2] = 15
        actPerArr[3] = 15
        actPerArr[7] = 15
        actPerArr[9] = 15
    elseif 2.5 <= targetDist then
        actPerArr[1] = 20
        actPerArr[2] = 25
        actPerArr[3] = 10
        actPerArr[7] = 20
        actPerArr[9] = 25
    else
        actPerArr[1] = 10
        actPerArr[2] = 30
        actPerArr[3] = 0
        actPerArr[7] = 30
        actPerArr[9] = 30
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, FourKnightD_m17_237001_Act01)
    local local0 = {}
    local local1, local2, local3, local4 = nil
    local0[1] = Att3000_Dist_max
    local0[2] = 0
    local0[3] = 20
    local0[4] = 40
    local0[5] = local1
    local0[6] = local2
    local0[7] = local3
    local0[8] = local4
    defFuncParamTbl[2] = local0
    actFuncArr[3] = REGIST_FUNC(ai, goal, FourKnightD_m17_237001_Act03)
    actFuncArr[5] = REGIST_FUNC(ai, goal, FourKnightD_m17_237001_Act05)
    actFuncArr[7] = REGIST_FUNC(ai, goal, FourKnightD_m17_237001_Act07)
    local0 = {}
    local3, local4 = nil
    local0[1] = Att3003_Dist_max
    local0[2] = 0
    local0[3] = 40
    local0[4] = 100
    local0[5] = 3003
    local0[6] = 3004
    local0[7] = local3
    local0[8] = local4
    defFuncParamTbl[9] = local0
    local atkAfterFunc = REGIST_FUNC(ai, goal, FourKnightD_m17_237001_ActAfter_AdjustSpace)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

function FourKnightD_m17_237001_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    goal:AddSubGoal(GOAL_COMMON_Attack, 5, 3005, TARGET_ENE_0, DIST_None, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function FourKnightD_m17_237001_Act03(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    goal:AddSubGoal(GOAL_COMMON_Attack, 5, 3006, TARGET_ENE_0, DIST_None, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function FourKnightD_m17_237001_Act05(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_None, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3009_Dist_max
function FourKnightD_m17_237001_Act07(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3009_Dist_max, TARGET_SELF, false, -1)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3009, TARGET_ENE_0, DIST_None, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function FourKnightD_m17_237001_ActAfter_AdjustSpace(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    if fate > 10 then
        if fate <= 90 then
            goal:AddSubGoal(GOAL_COMMON_If, 10, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_Wait, 2, TARGET_NONE, 0, 0, 0)
            return true
        end
    end
    return false
end

function OnIf_237001(ai, goal, codeNo)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local canStep701 = 0
    local canStep702 = 0
    local canStep703 = 0
    local canStep711 = 0
    local canStep712 = 0
    local canStep713 = 0
    local canStep721 = 0
    local canStep722 = 0
    local canStep723 = 0
    if ai:IsOnNearMeshByPos(TARGET_SELF, AI_DIR_TYPE_B, 7.5) then
        canStep721 = 1
    end
    if ai:IsOnNearMeshByPos(TARGET_SELF, AI_DIR_TYPE_L, 7.5) then
        canStep722 = 1
    end
    if ai:IsOnNearMeshByPos(TARGET_SELF, AI_DIR_TYPE_R, 7.5) then
        canStep723 = 1
    end
    if ai:IsOnNearMeshByPos(TARGET_SELF, AI_DIR_TYPE_B, 4.5) then
        canStep711 = 1
    end
    if ai:IsOnNearMeshByPos(TARGET_SELF, AI_DIR_TYPE_L, 4.5) then
        canStep712 = 1
    end
    if ai:IsOnNearMeshByPos(TARGET_SELF, AI_DIR_TYPE_R, 4.5) then
        canStep713 = 1
    end
    if ai:IsOnNearMeshByPos(TARGET_SELF, AI_DIR_TYPE_B, 3.5) then
        canStep701 = 1
    end
    if ai:IsOnNearMeshByPos(TARGET_SELF, AI_DIR_TYPE_L, 3.5) then
        canStep702 = 1
    end
    if ai:IsOnNearMeshByPos(TARGET_SELF, AI_DIR_TYPE_R, 3.5) then
        canStep703 = 1
    end
    if canStep723 == 1 or canStep722 == 1 or canStep721 == 1 then
        if canStep721 == 1 or canStep723 == 0 and canStep722 == 0 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 721, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 3)
        elseif fate3 <= 50 or canStep722 == 0 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 723, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 3)
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 722, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 3)
        end
        return true
    elseif canStep713 == 1 or canStep712 == 1 or canStep711 == 1 then
        if canStep711 == 1 or canStep713 == 0 and canStep712 == 0 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 711, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 2)
        elseif fate3 <= 50 or canStep712 == 0 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 713, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 2)
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 712, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 2)
        end
        return true
    elseif canStep701 == 1 or canStep703 == 0 and canStep702 == 0 then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 1)
    elseif fate3 <= 50 or canStep702 == 0 then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 1)
    else
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 1)
    end
    return true
end

function FourKnightD_m17_237001Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function FourKnightD_m17_237001Battle_Terminate(ai, goal)
    return 
end

Att3000_Dist_min = Att3005_Dist_max
function FourKnightD_m17_237001Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local eventNo = ai:GetEventRequest(0)
    local distNearRes = 3.5
    local oddsNearRes = 100
    local myThinkId = ai:GetNpcThinkParamID()
    if ai:IsInterupt(INTERUPT_Damaged) then
        if myThinkId == 237001 then
            if eventNo ~= 1 and targetDist <= 3.5 then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 3008, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
            elseif targetDist <= 3.5 and fate <= 50 then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 3)
            end
        elseif myThinkId == 237001 and targetDist <= 3.5 and fate <= 50 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 3)
        end
    end
    local distGuardBreak_Act = 3.1
    local oddsGuardBreak_Act = 50
    if GuardBreak_Act(ai, goal, distGuardBreak_Act, oddsGuardBreak_Act) then
        if fate <= 50 then
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
        end
        return true
    else
        local distMissSwing_Int = 6.5
        local oddsMissSwing_Int = 50
        if MissSwing_Int(ai, goal, distMissSwing_Int, oddsMissSwing_Int) then
            if fate <= 50 then
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
            else
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
            end
            return true
        else
            local distUseItem_Act = 8
            local oddsUseItem_Act = 15
            if UseItem_Act(ai, goal, distUseItem_Act, oddsUseItem_Act) then
                if targetDist <= 3.1 then
                    if fate <= 50 then
                        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                    else
                        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
                    end
                else
                    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3005_Dist_max, TARGET_SELF, false, -1)
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
                end
                return true
            elseif ai:IsInterupt(INTERUPT_ReboundByOpponentGuard) and fate <= 20 then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_If, 10, 0)
                return true
            else
                return false
            end
        end
    end
end

return 
