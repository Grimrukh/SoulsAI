REGISTER_LOGIC_FUNC(LOGIC_ID_Go_HawkEye411000, "Go_HawkEye411000_Logic", "Go_HawkEye411000_Interupt")
function Go_HawkEye411000_Logic(ai)
    if ai:IsChangeState() then
        if ai:IsSearchTarget(TARGET_ENE_0) == false then
            ai:AddTopGoal(GOAL_COMMON_NonspinningAttack, 10, 3008, TARGET_ENE_0, DIST_Middle)
            return true
        end
        ai:AddTopGoal(GOAL_COMMON_NonspinningAttack, 10, 3009, TARGET_ENE_0, DIST_Middle)
        COMMON_EasySetup3(ai)
    else
        COMMON_EasySetup3(ai)
    end
    return 
end

function Go_HawkEye411000_Interupt(ai, goal)
    return false
end

return 
