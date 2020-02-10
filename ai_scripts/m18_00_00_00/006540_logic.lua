REGISTER_LOGIC_FUNC(LOGIC_ID_SunKnight6540, "sunKnight6540_Logic", "sunKnight6540_Interupt")
function sunKnight6540_Logic(ai)
    ai:AddTopGoal(GOAL_SunKnight6540_Battle, -1, 0, 0, 0, 0)
    return 
end

function sunKnight6540_Interupt(ai, goal)
    return 
end

return 
