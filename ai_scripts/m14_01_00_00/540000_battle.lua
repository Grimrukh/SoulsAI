REGISTER_GOAL(GOAL_Boss_Izalis540000_Battle, "Boss_Izalis540000Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_Boss_Izalis540000_Battle, 1)
function Boss_Izalis540000Battle_Activate(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local fate4 = ai:GetRandam_Int(1, 100)
    local eventNo = ai:GetEventRequest(0)
    local Act01Per = 0
    local Act02Per = 0
    local Act03Per = 0
    local Act04Per = 0
    local Act05Per = 0
    local Act11Per = 0
    local Act12Per = 0
    local Act13Per = 0
    local Act14Per = 0
    local Act15Per = 0
    local Act16Per = 0
    local Act21Per = 0
    local Act22Per = 0
    local Act23Per = 0
    local Act24Per = 0
    local Act25Per = 0
    local Act26Per = 0
    local Act31Per = 0
    local Act32Per = 0
    local Act33Per = 0
    local Act34Per = 0
    local Act35Per = 0
    local Act36Per = 0
    local Act40Per = 0
    local Att3000flag = 0
    local Att3001flag = 0
    local Att3002flag = 0
    local Att3003flag = 0
    local Att3004flag = 0
    local Att3006flag = 0
    local Att3007flag = 0
    local Att3008flag = 0
    local Att3009flag = 0
    local Att3010flag = 0
    local Att3011flag = 0
    local Att13000flag = 0
    local Att13001flag = 0
    local Att13002flag = 0
    local Att13003flag = 0
    local Att13004flag = 0
    local Att13005flag = 0
    local Att13006flag = 0
    local Att13007flag = 0
    local Att13008flag = 0
    local Att13009flag = 0
    local Att13010flag = 0
    local Att13011flag = 0
    if ai:IsInsideTargetRegion(TARGET_ENE_0, 1412570) then
        Att3006flag = 1
        Att13006flag = 1
    end
    if ai:IsInsideTargetRegion(TARGET_ENE_0, 1412572) then
        Att3007flag = 1
        Att13007flag = 1
    end
    if ai:IsInsideTargetRegion(TARGET_ENE_0, 1412576) then
        Att3008flag = 1
        Att13008flag = 1
    end
    if ai:IsInsideTargetRegion(TARGET_ENE_0, 1412580) then
        Att3009flag = 1
        Att13009flag = 1
    end
    if ai:IsInsideTargetRegion(TARGET_ENE_0, 1412584) then
        Att3010flag = 1
        Att13010flag = 1
    end
    if ai:IsInsideTargetRegion(TARGET_ENE_0, 1412588) then
        Att3011flag = 1
        Att13011flag = 1
    end
    if not not ai:IsInsideTargetRegion(TARGET_ENE_0, 1412609) or not not ai:IsInsideTargetRegion(TARGET_ENE_0, 1412610) or not not ai:IsInsideTargetRegion(TARGET_ENE_0, 1412614) or ai:IsInsideTargetRegion(TARGET_ENE_0, 1412615) then
        Att3000flag = 1
        Att13000flag = 1
    end
    if not not ai:IsInsideTargetRegion(TARGET_ENE_0, 1412612) or not not ai:IsInsideTargetRegion(TARGET_ENE_0, 1412613) or not not ai:IsInsideTargetRegion(TARGET_ENE_0, 1412617) or ai:IsInsideTargetRegion(TARGET_ENE_0, 1412618) then
        Att3001flag = 1
        Att13001flag = 1
    end
    if not not ai:IsInsideTargetRegion(TARGET_ENE_0, 1412619) or not not ai:IsInsideTargetRegion(TARGET_ENE_0, 1412620) or not not ai:IsInsideTargetRegion(TARGET_ENE_0, 1412624) or ai:IsInsideTargetRegion(TARGET_ENE_0, 1412625) then
        Att3003flag = 1
        Att13004flag = 1
    end
    if not not ai:IsInsideTargetRegion(TARGET_ENE_0, 1412622) or not not ai:IsInsideTargetRegion(TARGET_ENE_0, 1412623) or not not ai:IsInsideTargetRegion(TARGET_ENE_0, 1412627) or ai:IsInsideTargetRegion(TARGET_ENE_0, 1412628) then
        Att3004flag = 1
        Att13005flag = 1
    end
    if not not ai:IsInsideTargetRegion(TARGET_ENE_0, 1412611) or ai:IsInsideTargetRegion(TARGET_ENE_0, 1412616) then
        Att3002flag = 1
        Att13002flag = 1
    end
    if ai:IsFinishTimer(0) == true then
        Att13003flag = 1
    end
    if ai:HasSpecialEffectId(TARGET_SELF, 5130) then
        if Att13006flag == 1 then
            Act31Per = 100
        end
        if Att13007flag == 1 then
            Act32Per = 100
        end
        if Att13008flag == 1 then
            Act33Per = 100
        end
        if Att13009flag == 1 then
            Act34Per = 100
        end
        if Att13010flag == 1 then
            Act35Per = 100
        end
        if Att13011flag == 1 then
            Act36Per = 100
        end
        if Att13002flag == 1 then
            Act23Per = 100
        end
        if Att13000flag == 1 then
            Act21Per = 2
        end
        if Att13001flag == 1 then
            Act22Per = 2
        end
        if Att13003flag == 1 then
            Act24Per = 20
        end
        if Att13004flag == 1 then
            Act25Per = 2
        end
        if Att13005flag == 1 then
            Act26Per = 2
        end
        Act40Per = 10
    else
        if Att3006flag == 1 then
            Act11Per = 100
        end
        if Att3007flag == 1 then
            Act12Per = 100
        end
        if Att3008flag == 1 then
            Act13Per = 100
        end
        if Att3009flag == 1 then
            Act14Per = 100
        end
        if Att3010flag == 1 then
            Act15Per = 100
        end
        if Att3011flag == 1 then
            Act16Per = 100
        end
        if Att3002flag == 1 then
            Act03Per = 100
        end
        if Att3000flag == 1 then
            Act01Per = 2
        end
        if Att3001flag == 1 then
            Act02Per = 2
        end
        if Att3003flag == 1 then
            Act04Per = 2
        end
        if Att3004flag == 1 then
            Act05Per = 2
        end
        Act40Per = 10
    end
    goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(2.5, 4), TARGET_NONE, 0, 0, 0)
    local fateAct = ai:GetRandam_Int(1, Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act11Per + Act12Per + Act13Per + Act14Per + Act15Per + Act16Per + Act21Per + Act22Per + Act23Per + Act24Per + Act25Per + Act26Per + Act31Per + Act32Per + Act33Per + Act34Per + Act35Per + Act36Per + Act40Per)
    if fateAct <= Act01Per then
        Boss_Izalis540000_Act01(ai, goal)
    elseif fateAct <= Act01Per + Act02Per then
        Boss_Izalis540000_Act02(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per then
        Boss_Izalis540000_Act03(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per then
        Boss_Izalis540000_Act04(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per then
        Boss_Izalis540000_Act05(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act11Per then
        Boss_Izalis540000_Act11(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act11Per + Act12Per then
        Boss_Izalis540000_Act12(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act11Per + Act12Per + Act13Per then
        Boss_Izalis540000_Act13(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act11Per + Act12Per + Act13Per + Act14Per then
        Boss_Izalis540000_Act14(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act11Per + Act12Per + Act13Per + Act14Per + Act15Per then
        Boss_Izalis540000_Act15(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act11Per + Act12Per + Act13Per + Act14Per + Act15Per + Act16Per then
        Boss_Izalis540000_Act16(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act11Per + Act12Per + Act13Per + Act14Per + Act15Per + Act16Per + Act21Per then
        Boss_Izalis540000_Act21(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act11Per + Act12Per + Act13Per + Act14Per + Act15Per + Act16Per + Act21Per + Act22Per then
        Boss_Izalis540000_Act22(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act11Per + Act12Per + Act13Per + Act14Per + Act15Per + Act16Per + Act21Per + Act22Per + Act23Per then
        Boss_Izalis540000_Act23(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act11Per + Act12Per + Act13Per + Act14Per + Act15Per + Act16Per + Act21Per + Act22Per + Act23Per + Act24Per then
        Boss_Izalis540000_Act24(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act11Per + Act12Per + Act13Per + Act14Per + Act15Per + Act16Per + Act21Per + Act22Per + Act23Per + Act24Per + Act25Per then
        Boss_Izalis540000_Act25(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act11Per + Act12Per + Act13Per + Act14Per + Act15Per + Act16Per + Act21Per + Act22Per + Act23Per + Act24Per + Act25Per + Act26Per then
        Boss_Izalis540000_Act26(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act11Per + Act12Per + Act13Per + Act14Per + Act15Per + Act16Per + Act21Per + Act22Per + Act23Per + Act24Per + Act25Per + Act26Per + Act31Per then
        Boss_Izalis540000_Act31(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act11Per + Act12Per + Act13Per + Act14Per + Act15Per + Act16Per + Act21Per + Act22Per + Act23Per + Act24Per + Act25Per + Act26Per + Act31Per + Act32Per then
        Boss_Izalis540000_Act32(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act11Per + Act12Per + Act13Per + Act14Per + Act15Per + Act16Per + Act21Per + Act22Per + Act23Per + Act24Per + Act25Per + Act26Per + Act31Per + Act32Per + Act33Per then
        Boss_Izalis540000_Act33(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act11Per + Act12Per + Act13Per + Act14Per + Act15Per + Act16Per + Act21Per + Act22Per + Act23Per + Act24Per + Act25Per + Act26Per + Act31Per + Act32Per + Act33Per + Act34Per then
        Boss_Izalis540000_Act34(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act11Per + Act12Per + Act13Per + Act14Per + Act15Per + Act16Per + Act21Per + Act22Per + Act23Per + Act24Per + Act25Per + Act26Per + Act31Per + Act32Per + Act33Per + Act34Per + Act35Per then
        Boss_Izalis540000_Act35(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act11Per + Act12Per + Act13Per + Act14Per + Act15Per + Act16Per + Act21Per + Act22Per + Act23Per + Act24Per + Act25Per + Act26Per + Act31Per + Act32Per + Act33Per + Act34Per + Act35Per + Act36Per then
        Boss_Izalis540000_Act36(ai, goal)
    else
        Boss_Izalis540000_Act40(ai, goal)
    end
    return 
end

function Boss_Izalis540000_Act01(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3000, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act02(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3001, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act03(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3002, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act04(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3003, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act05(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3004, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act11(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3006, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act12(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3007, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act13(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3008, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act14(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3009, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act15(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3010, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act16(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3011, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act21(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3000, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act22(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3001, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act23(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3002, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act24(ai, goal)
    ai:SetTimer(0, 30)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3003, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act25(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3004, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act26(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3005, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act31(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3006, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act32(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3007, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act33(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3008, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act34(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3009, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act35(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3010, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act36(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3011, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Boss_Izalis540000_Act40(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(1, 3), TARGET_NONE, 0, 0, 0)
    return 
end

function Boss_Izalis540000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Boss_Izalis540000Battle_Terminate(ai, goal)
    return 
end

function Boss_Izalis540000Battle_Interupt(ai, goal)
    return false
end

return 
