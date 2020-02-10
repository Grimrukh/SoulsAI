REGISTER_LOGIC_FUNC(LOGIC_ID_HeldKnight_laughtrec6590, "HeldKnight_laughtrec6590_Logic", "HeldKnight_laughtrec6590_Interupt")
function HeldKnight_laughtrec6590_Logic(ai)
    ai:AddTopGoal(GOAL_HeldKnight_laughtrec6590_Battle, -1, 0, 0, 0, 0)
    return 
end

function HeldKnight_laughtrec6590_Interupt(ai, goal)
    return 
end

return 
