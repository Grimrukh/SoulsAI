local DEF_MAX_ACT = 20
function Common_Clear_Param(ActXPer, funcActX, defFuncParamTbl)
    local i = 1
    local local0 = 1
    for local1 = 1 - local0, DEF_MAX_ACT, local0 do
        ActXPer[local1] = 0
        funcActX[local1] = nil
        defFuncParamTbl[local1] = {}
    end
    return 
end

function Common_Battle_Activate(ai, goal, ActXPer, funcActX, atkAfterFunc, defFuncParamTbl)
    local funcActArr = {}
    local perActArr = {}
    local totalPerAct = 0
    local local0 = {}
    ai = goal
    ai = defFuncParamTbl
    ai = goal
    ai = defFuncParamTbl
    ai = goal
    ai = defFuncParamTbl
    ai = goal
    ai = defFuncParamTbl
    ai = goal
    ai = defFuncParamTbl
    ai = goal
    ai = defFuncParamTbl
    ai = goal
    ai = defFuncParamTbl
    ai = goal
    ai = defFuncParamTbl
    ai = goal
    ai = defFuncParamTbl
    ai = goal
    ai = defFuncParamTbl
    ai = goal
    ai = defFuncParamTbl
    ai = goal
    ai = defFuncParamTbl
    ai = goal
    ai = defFuncParamTbl
    ai = goal
    ai = defFuncParamTbl
    ai = goal
    ai = defFuncParamTbl
    ai = goal
    ai = defFuncParamTbl
    ai = goal
    ai = defFuncParamTbl
    ai = goal
    ai = defFuncParamTbl
    ai = goal
    ai = defFuncParamTbl
    ai = goal
    ai = defFuncParamTbl
    local0[1] = function ()
        return defAct01(ai, goal, defFuncParamTbl[1])
    end

    local0[2] = function ()
        return defAct02(ai, goal, defFuncParamTbl[2])
    end

    local0[3] = function ()
        return defAct03(ai, goal, defFuncParamTbl[3])
    end

    local0[4] = function ()
        return defAct04(ai, goal, defFuncParamTbl[4])
    end

    local0[5] = function ()
        return defAct05(ai, goal, defFuncParamTbl[5])
    end

    local0[6] = function ()
        return defAct06(ai, goal, defFuncParamTbl[6])
    end

    local0[7] = function ()
        return defAct07(ai, goal, defFuncParamTbl[7])
    end

    local0[8] = function ()
        return defAct08(ai, goal, defFuncParamTbl[8])
    end

    local0[9] = function ()
        return defAct09(ai, goal, defFuncParamTbl[9])
    end

    local0[10] = function ()
        return defAct10(ai, goal, defFuncParamTbl[10])
    end

    local0[11] = function ()
        return defAct11(ai, goal, defFuncParamTbl[11])
    end

    local0[12] = function ()
        return defAct12(ai, goal, defFuncParamTbl[12])
    end

    local0[13] = function ()
        return defAct12(ai, goal, defFuncParamTbl[13])
    end

    local0[14] = function ()
        return defAct12(ai, goal, defFuncParamTbl[14])
    end

    local0[15] = function ()
        return defAct12(ai, goal, defFuncParamTbl[15])
    end

    local0[16] = function ()
        return defAct12(ai, goal, defFuncParamTbl[16])
    end

    local0[17] = function ()
        return defAct12(ai, goal, defFuncParamTbl[17])
    end

    local0[18] = function ()
        return defAct12(ai, goal, defFuncParamTbl[18])
    end

    local0[19] = function ()
        return defAct12(ai, goal, defFuncParamTbl[19])
    end

    local0[20] = function ()
        return defAct12(ai, goal, defFuncParamTbl[20])
    end

    local i = 1
    local local1 = 1
    for local2 = 1 - local1, DEF_MAX_ACT, local1 do
        if funcActX[local2] ~= nil then
            funcActArr[local2] = funcActX[local2]
        else
            funcActArr[local2] = local0[local2]
        end
        perActArr[local2] = ActXPer[local2]
        totalPerAct = totalPerAct + perActArr[local2]
    end
    local funcAfterAdjustSpace = nil
    if atkAfterFunc ~= nil then
        funcAfterAdjustSpace = atkAfterFunc
    else
        funcAfterAdjustSpace = function ()
        HumanCommon_ActAfter_AdjustSpace(ai, goal, atkAfterOddsTbl)
        return 
    end

        ai = goal
    end
    local GetWellSpace_Odds = 0
    local doAdmirer = ai:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
    local role = ai:GetTeamOrder(ORDER_TYPE_Role)
    local Odds_Guard = 0
    if doAdmirer == 1 and role == ROLE_TYPE_Torimaki then
        Torimaki_Act(ai, goal, Odds_Guard)
    elseif doAdmirer == 1 and role == ROLE_TYPE_Kankyaku then
        Kankyaku_Act(ai, goal, Odds_Guard)
    else
        local forceActIdx = ai:DbgGetForceActIdx()
        if 0 < forceActIdx and forceActIdx <= DEF_MAX_ACT then
            GetWellSpace_Odds = funcActArr[forceActIdx]()
            ai:DbgSetLastActIdx(forceActIdx)
        else
            local fateAct = ai:GetRandam_Int(1, totalPerAct)
            local totalPer = 0
            local i = 1
            local local3 = 1
            for local4 = 1 - local3, DEF_MAX_ACT, local3 do
                totalPer = totalPer + perActArr[local4]
                if fateAct <= totalPer then
                    GetWellSpace_Odds = funcActArr[local4]()
                    ai:DbgSetLastActIdx(local4)
                    local4 = DEF_MAX_ACT
                end
            end
        end
    end
    local fateGWS = ai:GetRandam_Int(1, 100)
    if fateGWS <= GetWellSpace_Odds then
        funcAfterAdjustSpace()
    end
    return 
end

function defAct01(ai, goal, paramTbl)
    local local0 = {1.5, 0, 3000, DIST_Middle, nil}
    if paramTbl[1] ~= nil then
        local0 = paramTbl
    end
    local approachDist = local0[1]
    local dashDist = local0[1] + 2
    local Odds_Guard = local0[2]
    local AttID = local0[3]
    local AttDist = local0[4]
    local GetWellSpace_Odds = GET_PARAM_IF_NIL_DEF(local0[5], 100)
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    return GetWellSpace_Odds
end

function defAct02(ai, goal, paramTbl)
    local local0 = {}
    local local1, local2, local3, local4 = nil
    local0[1] = 1.5
    local0[2] = 0
    local0[3] = 10
    local0[4] = 40
    local0[5] = local1
    local0[6] = local2
    local0[7] = local3
    local0[8] = local4
    if paramTbl[1] ~= nil then
        local0 = paramTbl
    end
    return HumanCommon_Approach_and_ComboAtk(ai, goal, local0)
end

function defAct03(ai, goal, paramTbl)
    local local0 = {1.5, 0, 3005, DIST_Middle, nil}
    if paramTbl[1] ~= nil then
        local0 = paramTbl
    end
    local approachDist = local0[1]
    local dashDist = local0[1] + 2
    local Odds_Guard = local0[2]
    local AttID = local0[3]
    local AttDist = local0[4]
    local GetWellSpace_Odds = GET_PARAM_IF_NIL_DEF(local0[5], 100)
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    return GetWellSpace_Odds
end

function defAct04(ai, goal, paramTbl)
    local local0 = {5, 0, 3007, DIST_Middle, 3005, DIST_Middle, nil}
    if paramTbl[1] ~= nil then
        local0 = paramTbl
    end
    local approachDist = local0[1]
    local dashDist = local0[1] + 2
    local Odds_Guard = local0[2]
    local GBAID = local0[3]
    local GBADist = local0[4]
    local AttID = local0[5]
    local AttDist = local0[6]
    local GetWellSpace_Odds = GET_PARAM_IF_NIL_DEF(local0[7], 100)
    Approach_and_GuardBreak_Act(ai, goal, approachDist, dashDist, Odds_Guard, GBAID, GBADist, AttID, AttDist)
    return GetWellSpace_Odds
end

function defAct05(ai, goal, paramTbl)
    local local0 = {4, 6, 0, 3008, DIST_None, nil}
    if paramTbl[1] ~= nil then
        local0 = paramTbl
    end
    return HumanCommon_KeepDist_and_ThrowSomething(ai, goal, local0)
end

function defAct06(ai, goal, paramTbl)
    local local0 = {3000, DIST_Far, nil}
    if paramTbl[1] ~= nil then
        local0 = paramTbl
    end
    local GetWellSpace_Odds = GET_PARAM_IF_NIL_DEF(local0[3], 0)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, local0[1], TARGET_ENE_0, local0[2], 0)
    return GetWellSpace_Odds
end

function defAct07(ai, goal, paramTbl)
    local local0 = {1.5, 0, 3001, DIST_Middle}
    if paramTbl[1] ~= nil then
        local0 = paramTbl
    end
    local approachDist = local0[1]
    local dashDist = local0[1] + 2
    local Odds_Guard = local0[2]
    local AttID = local0[3]
    local AttDist = local0[4]
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    return 100
end

function defAct08(ai, goal, paramTbl)
    local local0 = {nil}
    if paramTbl[1] ~= nil then
        local0 = paramTbl
    end
    local GetWellSpace_Odds = GET_PARAM_IF_NIL_DEF(local0[1], 0)
    Watching_Parry_Chance_Act(ai, goal)
    return GetWellSpace_Odds
end

function defAct09(ai, goal, paramTbl)
    local local0 = {}
    local local1, local2, local3, local4 = nil
    local0[1] = 1.5
    local0[2] = 0
    local0[3] = 10
    local0[4] = 40
    local0[5] = local1
    local0[6] = local2
    local0[7] = local3
    local0[8] = local4
    if paramTbl[1] ~= nil then
        local0 = paramTbl
    end
    return HumanCommon_Approach_and_ComboAtk(ai, goal, local0)
end

function defAct10(ai, goal, paramTbl)
    local local0 = {3000, 3001, 2, 4, 0}
    if paramTbl[1] ~= nil then
        local0 = paramTbl
    end
    return HumanCommon_Shooting_Act(ai, goal, Tbl)
end

function defAct11(ai, goal, paramTbl)
    local local0 = {3002, 3003, 2, 4, 0}
    if paramTbl[1] ~= nil then
        local0 = paramTbl
    end
    return HumanCommon_Shooting_Act(ai, goal, Tbl)
end

function defAct12(ai, goal, paramTbl)
    local local0 = {1.5, 0, 3001, DIST_Middle}
    if paramTbl[1] ~= nil then
        local0 = paramTbl
    end
    local approachDist = local0[1]
    local dashDist = local0[1] + 2
    local Odds_Guard = local0[2]
    local AttID = local0[3]
    local AttDist = local0[4]
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    return 100
end

function defAct13(ai, goal, paramTbl)
    local local0 = {1.5, 0, 3000, DIST_Middle, nil}
    if paramTbl[1] ~= nil then
        local0 = paramTbl
    end
    local approachDist = local0[1]
    local dashDist = local0[1] + 2
    local Odds_Guard = local0[2]
    local AttID = local0[3]
    local AttDist = local0[4]
    local GetWellSpace_Odds = GET_PARAM_IF_NIL_DEF(local0[5], 100)
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    return GetWellSpace_Odds
end

function defAct14(ai, goal, paramTbl)
    local local0 = {1.5, 0, 3000, DIST_Middle, nil}
    if paramTbl[1] ~= nil then
        local0 = paramTbl
    end
    local approachDist = local0[1]
    local dashDist = local0[1] + 2
    local Odds_Guard = local0[2]
    local AttID = local0[3]
    local AttDist = local0[4]
    local GetWellSpace_Odds = GET_PARAM_IF_NIL_DEF(local0[5], 100)
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    return GetWellSpace_Odds
end

function defAct15(ai, goal, paramTbl)
    local local0 = {1.5, 0, 3000, DIST_Middle, nil}
    if paramTbl[1] ~= nil then
        local0 = paramTbl
    end
    local approachDist = local0[1]
    local dashDist = local0[1] + 2
    local Odds_Guard = local0[2]
    local AttID = local0[3]
    local AttDist = local0[4]
    local GetWellSpace_Odds = GET_PARAM_IF_NIL_DEF(local0[5], 100)
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    return GetWellSpace_Odds
end

function defAct16(ai, goal, paramTbl)
    local local0 = {1.5, 0, 3000, DIST_Middle, nil}
    if paramTbl[1] ~= nil then
        local0 = paramTbl
    end
    local approachDist = local0[1]
    local dashDist = local0[1] + 2
    local Odds_Guard = local0[2]
    local AttID = local0[3]
    local AttDist = local0[4]
    local GetWellSpace_Odds = GET_PARAM_IF_NIL_DEF(local0[5], 100)
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    return GetWellSpace_Odds
end

function defAct17(ai, goal, paramTbl)
    local local0 = {1.5, 0, 3000, DIST_Middle, nil}
    if paramTbl[1] ~= nil then
        local0 = paramTbl
    end
    local approachDist = local0[1]
    local dashDist = local0[1] + 2
    local Odds_Guard = local0[2]
    local AttID = local0[3]
    local AttDist = local0[4]
    local GetWellSpace_Odds = GET_PARAM_IF_NIL_DEF(local0[5], 100)
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    return GetWellSpace_Odds
end

function defAct18(ai, goal, paramTbl)
    local local0 = {1.5, 0, 3000, DIST_Middle, nil}
    if paramTbl[1] ~= nil then
        local0 = paramTbl
    end
    local approachDist = local0[1]
    local dashDist = local0[1] + 2
    local Odds_Guard = local0[2]
    local AttID = local0[3]
    local AttDist = local0[4]
    local GetWellSpace_Odds = GET_PARAM_IF_NIL_DEF(local0[5], 100)
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    return GetWellSpace_Odds
end

function defAct19(ai, goal, paramTbl)
    local local0 = {1.5, 0, 3000, DIST_Middle, nil}
    if paramTbl[1] ~= nil then
        local0 = paramTbl
    end
    local approachDist = local0[1]
    local dashDist = local0[1] + 2
    local Odds_Guard = local0[2]
    local AttID = local0[3]
    local AttDist = local0[4]
    local GetWellSpace_Odds = GET_PARAM_IF_NIL_DEF(local0[5], 100)
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    return GetWellSpace_Odds
end

function defAct20(ai, goal, paramTbl)
    local local0 = {1.5, 0, 3000, DIST_Middle, nil}
    if paramTbl[1] ~= nil then
        local0 = paramTbl
    end
    local approachDist = local0[1]
    local dashDist = local0[1] + 2
    local Odds_Guard = local0[2]
    local AttID = local0[3]
    local AttDist = local0[4]
    local GetWellSpace_Odds = GET_PARAM_IF_NIL_DEF(local0[5], 100)
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    return GetWellSpace_Odds
end

function HumanCommon_KeepDist_and_ThrowSomething(ai, goal, paramTbl)
    local LeaDist = paramTbl[1]
    local approachDist = paramTbl[2]
    local dashDist = paramTbl[2] + 2
    local Odds_Guard = paramTbl[3]
    local AttID = paramTbl[4]
    local AttDist = paramTbl[5]
    KeepDist_and_Attack_Act(ai, goal, LeaDist, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    local GetWellSpace_Odds = GET_PARAM_IF_NIL_DEF(paramTbl[6], 0)
    return GetWellSpace_Odds
end

function HumanCommon_ActAfter_AdjustSpace(ai, goal, paramTbl)
    local Odds_Guard = paramTbl[1]
    local Odds_NoAct = paramTbl[2]
    local Odds_BackAndSide = paramTbl[3]
    local Odds_Back = paramTbl[4]
    local Odds_BitWait = paramTbl[5]
    local Odds_Backstep = paramTbl[6]
    GetWellSpace_Act(ai, goal, Odds_Guard, Odds_NoAct, Odds_BackAndSide, Odds_Back, Odds_BitWait, Odds_Backstep)
    return 
end

function HumanCommon_ActAfter_AdjustSpace_IncludeSidestep(ai, goal, paramTbl)
    local Odds_Guard = paramTbl[1]
    local Odds_NoAct = paramTbl[2]
    local Odds_BackAndSide = paramTbl[3]
    local Odds_Back = paramTbl[4]
    local Odds_BitWait = paramTbl[5]
    local Odds_Backstep = paramTbl[6]
    local Odds_Sidestep = paramTbl[7]
    GetWellSpace_Act_IncludeSidestep(ai, goal, Odds_Guard, Odds_NoAct, Odds_BackAndSide, Odds_Back, Odds_BitWait, Odds_Backstep, Odds_Sidestep)
    return 
end

function HumanCommon_Approach_and_ComboAtk(ai, goal, paramTbl)
    local approachDist = paramTbl[1]
    local dashDist = paramTbl[1] + 2
    local Odds_Guard = paramTbl[2]
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    local ID_Att01 = GET_PARAM_IF_NIL_DEF(paramTbl[5], 3000)
    local ID_Att02 = GET_PARAM_IF_NIL_DEF(paramTbl[6], 3001)
    local ID_Att03 = GET_PARAM_IF_NIL_DEF(paramTbl[7], 3002)
    local fate = ai:GetRandam_Int(1, 100)
    if fate <= paramTbl[3] then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, ID_Att01, TARGET_ENE_0, DIST_Middle, 0)
    elseif fate <= paramTbl[3] + paramTbl[4] then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, ID_Att01, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, ID_Att02, TARGET_ENE_0, DIST_Middle, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, ID_Att01, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, ID_Att02, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, ID_Att03, TARGET_ENE_0, DIST_Middle, 0)
    end
    local GetWellSpace_Odds = GET_PARAM_IF_NIL_DEF(paramTbl[8], 100)
    return GetWellSpace_Odds
end

function HumanCommon_Watching_Parry_Chance_Act(ai, goal, paramTbl)
    Watching_Parry_Chance_Act(ai, goal)
    local GetWellSpace_Odds = GET_PARAM_IF_NIL_DEF(paramTbl[1], 100)
    return GetWellSpace_Odds
end

function HumanCommon_Shooting_Act(ai, goal, paramTbl)
    local FirstAttID = paramTbl[1]
    local ComAttID = paramTbl[2]
    local ShootNum = ai:GetRandam_Int(paramTbl[3], paramTbl[4])
    local AfterActID = paramTbl[5]
    Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
    if AfterActID ~= 0 then
        if AfterActID == 1 then
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2, TARGET_ENE_0, 20, TARGET_ENE_0, true, -1)
        elseif AfterActID == 2 then
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, 20, TARGET_SELF, false, -1)
        else
            ai:PrintText("šlogical error, get the manager!š ")
        end
    end
    return 0
end

function GET_PARAM_IF_NIL_DEF(param, defaultParam)
    if param ~= nil then
        return param
    else
        return defaultParam
    end
end

function REGIST_FUNC(ai, goal, funcName, paramTbl)
    ai = funcName
    ai = goal
    ai = paramTbl
    return function ()
        return funcName(ai, goal, paramTbl)
    end

end

return 
