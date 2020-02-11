REGISTER_LOGIC_FUNC(LOGIC_ID_WitchBeatrice6520, "WitchBeatrice6520_Logic", "WitchBeatrice6520_Interupt")
function WitchBeatrice6520_Logic(ai)
    ai:AddTopGoal(GOAL_WitchBeatrice6520_Battle, -1, 0, 0, 0, 0)
    return 
end

function WitchBeatrice6520_Interupt(ai, goal)
    return 
end

return 
