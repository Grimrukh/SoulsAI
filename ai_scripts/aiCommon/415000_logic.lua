REGISTER_LOGIC_FUNC(LOGIC_ID_ShinenBito415000, "ShinenBito415000_Logic", "ShinenBito415000_Interupt")
function ShinenBito415000_Logic(ai)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    if ai:GetNumber(1) == 0 then
        ai:SetTimer(1, ai:GetRandam_Int(30, 60))
        ai:SetNumber(1, 1)
    end
    if ai:IsChangeState() then
        if ai:IsBattleState() then
            if ai:HasSpecialEffectId(TARGET_SELF, 5402) then
                if ai:GetNpcThinkParamID() <= 415009 then
                    if fate <= 33 and 8 <= targetDist then
                        ai:AddTopGoal(GOAL_COMMON_AttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_Middle, 2, 5)
                    else
                        ai:AddTopGoal(GOAL_COMMON_AttackTunableSpin, 10, 3014, TARGET_ENE_0, DIST_Middle, 2, 5)
                    end
                elseif fate <= 5 and 8 <= targetDist then
                    ai:AddTopGoal(GOAL_COMMON_AttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_Middle, 2, 5)
                else
                    ai:AddTopGoal(GOAL_COMMON_AttackTunableSpin, 10, 3014, TARGET_ENE_0, DIST_Middle, 2, 5)
                end
                ai:SetNumber(0, 1)
            end
        elseif ai:IsFindState() and ai:IsCautionState() and ai:GetNumber(0) == 1 then
            ai:AddTopGoal(GOAL_COMMON_NonspinningAttack, 10, 3001, TARGET_ENE_0, DIST_Middle)
            ai:SetNumber(0, 0)
        end
    elseif ai:IsSearchTarget(TARGET_ENE_0) == false and ai:IsFinishTimer(1) == true then
        ai:AddTopGoal(GOAL_COMMON_AttackTunableSpin, 10, 3011, TARGET_ENE_0, DIST_Middle, 2, 5)
        ai:SetNumber(1, 0)
    end
    COMMON_EasySetup3(ai)
    return 
end

function ShinenBito415000_Interupt(ai, goal)
    return false
end

return 
