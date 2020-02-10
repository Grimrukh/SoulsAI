REGISTER_LOGIC_FUNC(LOGIC_ID_Kyochojin231000, "Kyochojin231000_Logic", "Kyochojin231000_Interupt")
function OnIf_231000(ai, goal, codeNo)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local eventNo = ai:GetEventRequest(0)
    if codeNo == 1 then
        ai:SetEventMoveTarget(1102714)
        ai:AddTopGoal(GOAL_COMMON_Turn, 10, POINT_EVENT, 1)
        ai:AddTopGoal(GOAL_COMMON_Attack, 20, 3014, POINT_EVENT, DIST_Middle, 0)
    elseif codeNo == 2 then
        ai:SetEventMoveTarget(1102715)
        ai:AddTopGoal(GOAL_COMMON_Turn, 10, POINT_EVENT, 1)
        ai:AddTopGoal(GOAL_COMMON_Attack, 20, 3015, POINT_EVENT, DIST_Middle, 0)
    elseif codeNo == 3 then
        ai:SetEventMoveTarget(1102711)
        ai:AddTopGoal(GOAL_COMMON_Turn, 10, POINT_EVENT, 1)
        ai:AddTopGoal(GOAL_COMMON_Attack, 20, 3016, POINT_EVENT, DIST_Middle, 0)
    elseif codeNo == 4 then
        ai:SetEventMoveTarget(1102710)
        ai:AddTopGoal(GOAL_COMMON_Turn, 10, POINT_EVENT, 1)
        ai:AddTopGoal(GOAL_COMMON_Attack, 20, 3017, POINT_EVENT, DIST_Middle, 0)
    elseif codeNo == 5 then
        ai:SetEventMoveTarget(1102713)
        ai:AddTopGoal(GOAL_COMMON_Turn, 10, POINT_EVENT, 1)
        ai:AddTopGoal(GOAL_COMMON_Attack, 20, 3018, POINT_EVENT, DIST_Middle, 0)
    elseif codeNo == 6 then
        ai:SetEventMoveTarget(1102712)
        ai:AddTopGoal(GOAL_COMMON_Turn, 10, POINT_EVENT, 1)
        ai:AddTopGoal(GOAL_COMMON_Attack, 20, 3019, POINT_EVENT, DIST_Middle, 0)
    else
        ai:AddTopGoal(GOAL_COMMON_Attack, 10, 3006, TARGET_ENE_0, DIST_Middle, 0)
    end
    return 
end

function Kyochojin231000_Logic(ai)
    local eventNo = ai:GetEventRequest(0)
    local isFindTarget = ai:IsSearchTarget(TARGET_ENE_0)
    local pointDist = ai:GetMovePointEffectRange()
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if not (isFindTarget ~= false or 1 > eventNo) or 10 <= targetDist and 1 <= eventNo then
        if eventNo == 1 then
            ai:SetEventMoveTarget(1102710)
            ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 2, POINT_EVENT, 1, TARGET_SELF, false, -1)
            ai:AddTopGoal(GOAL_COMMON_If, 30, 1)
        elseif eventNo == 2 then
            ai:SetEventMoveTarget(1102712)
            ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 2, POINT_EVENT, 1, TARGET_SELF, false, -1)
            ai:AddTopGoal(GOAL_COMMON_If, 30, 2)
        elseif eventNo == 3 then
            ai:SetEventMoveTarget(1102710)
            ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 2, POINT_EVENT, 1, TARGET_SELF, false, -1)
            ai:AddTopGoal(GOAL_COMMON_If, 30, 3)
        elseif eventNo == 4 then
            ai:SetEventMoveTarget(1102711)
            ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 2, POINT_EVENT, 1, TARGET_SELF, false, -1)
            ai:AddTopGoal(GOAL_COMMON_If, 30, 4)
        elseif eventNo == 5 then
            ai:SetEventMoveTarget(1102712)
            ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 2, POINT_EVENT, 1, TARGET_SELF, false, -1)
            ai:AddTopGoal(GOAL_COMMON_If, 30, 5)
        elseif eventNo == 6 then
            ai:SetEventMoveTarget(1102713)
            ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 2, POINT_EVENT, 1, TARGET_SELF, false, -1)
            ai:AddTopGoal(GOAL_COMMON_If, 30, 6)
        else
            ai:AddTopGoal(GOAL_Kyochojin231000_Battle, -1, 0, 0, 0, 0)
        end
    elseif isFindTarget == false then
        ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 7, POINT_INITIAL, 0.1, TARGET_SELF, false, -1)
    elseif 75 <= pointDist then
        if 5 <= targetDist then
            ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 7, POINT_INITIAL, 0.1, TARGET_SELF, false, -1)
        elseif 3 <= targetDist then
            ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 2, POINT_INITIAL, 0.1, TARGET_ENE_0, true, -1)
        else
            ai:AddTopGoal(GOAL_Kyochojin231000_Battle, -1, 0, 0, 0, 0)
        end
    elseif ai:IsBattleState() then
        if 50 <= pointDist then
            if 15 <= targetDist then
                ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 7, POINT_INITIAL, 0.1, TARGET_SELF, false, -1)
            else
                ai:AddTopGoal(GOAL_Kyochojin231000_Battle, -1, 0, 0, 0, 0)
            end
        elseif 25 <= pointDist then
            if 20 <= targetDist then
                ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 7, POINT_INITIAL, 0.1, TARGET_SELF, false, -1)
            else
                ai:AddTopGoal(GOAL_Kyochojin231000_Battle, -1, 0, 0, 0, 0)
            end
        elseif 20 <= targetDist then
            ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 7, POINT_INITIAL, 0.1, TARGET_SELF, false, -1)
        else
            ai:AddTopGoal(GOAL_Kyochojin231000_Battle, -1, 0, 0, 0, 0)
        end
    elseif ai:IsCautionState() then
        ai:AddTopGoal(GOAL_COMMON_Wait, 2, TARGET_ENE_0, 0, 0, 0)
    elseif 30 <= targetDist then
        ai:AddTopGoal(GOAL_COMMON_Wait, 2, TARGET_NONE, 0, 0, 0)
    elseif 12 <= targetDist then
        ai:AddTopGoal(GOAL_COMMON_Wait, 2, TARGET_ENE_0, 0, 0, 0)
    else
        ai:AddTopGoal(GOAL_Kyochojin231000_Battle, -1, 0, 0, 0, 0)
    end
    return 
end

function Kyochojin231000_Interupt(ai, goal)
    if ai:IsInterupt(INTERUPT_Damaged) then
        ai:AddTopGoal(GOAL_Kyochojin231000_Battle, -1, 0, 0, 0, 0)
    end
    return 
end

return 
