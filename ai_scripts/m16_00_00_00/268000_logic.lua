REGISTER_LOGIC_FUNC(LOGIC_ID_Ghost_Runaway268000, "Ghost_Runaway268000_Logic", "Ghost_Runaway268000_Interupt")
function Ghost_Runaway268000_Logic(ai)
    local myThinkId = ai:GetNpcThinkParamID()
    local DoObserveRegion = 0
    local ObserveRegion01 = 0
    local ObserveRegion02 = 0
    if 1 == 1 then
        if not ai:IsInsideTargetRegion(TARGET_SELF, 1602860) and not ai:IsInsideTargetRegion(TARGET_SELF, 1602860) then
            ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 10, POINT_INITIAL, 2, TARGET_SELF, false, -1)
            ai:AddTopGoal(GOAL_COMMON_Wait, 2, TARGET_ENE_0, 0, 0, 0)
        else
            COMMON_EasySetup3(ai)
        end
    else
        COMMON_EasySetup3(ai)
    end
    return 
end

function Ghost_Runaway268000_Interupt(ai, goal)
    return 
end

return 
