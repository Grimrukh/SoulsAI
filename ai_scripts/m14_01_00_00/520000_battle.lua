REGISTER_GOAL(GOAL_Mukade520000_Battle, "mukade520000Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_Mukade520000_Battle, 1)
local A = false
local B = false
function OnIf_520000(ai, goal, codeNo)
    if codeNo == 0 then
        if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 90) then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3001, TARGET_ENE_0, DIST_None, 0, -1)
        else
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3001, TARGET_ENE_0, DIST_None, -1, -1)
        end
    elseif codeNo == 1 then
        if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 90) then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3011, TARGET_ENE_0, DIST_None, 0, -1)
        else
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3011, TARGET_ENE_0, DIST_None, -1, -1)
        end
    end
    return 
end

A = B
function mukade520000Battle_Activate(ai, goal)
    local hprate = ai:GetHpRate(TARGET_SELF)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local fate4 = ai:GetRandam_Int(1, 100)
    local fate5 = ai:GetRandam_Int(1, 100)
    local fate6 = ai:GetRandam_Int(1, 100)
    local fate7 = ai:GetRandam_Int(1, 100)
    local fate8 = ai:GetRandam_Int(1, 100)
    local fate9 = ai:GetRandam_Int(1, 100)
    local fate10 = ai:GetRandam_Int(1, 100)
    local fate11 = ai:GetRandam_Int(1, 100)
    local PARTS_IDX_ARM1 = 0
    local PARTS_IDX_TAIL = 1
    local arm1DmgLv = ai:GetPartsDmg(PARTS_IDX_ARM1)
    local tailDmgLv = ai:GetPartsDmg(PARTS_IDX_TAIL)
    local Att3000_Dist_min = 3
    local Att3000_Dist_max = 9
    local Att3001_Dist_min = 0
    local Att3001_Dist_max = 8
    local Att3002_Dist_min = 3
    local Att3002_Dist_max = 17.5
    local Att3003_Dist_min = 6
    local Att3003_Dist_max = 13
    local Att3004_Dist_min = -4
    local Att3004_Dist_max = 7.5
    local Att3005_Dist_min = 16
    local Att3005_Dist_max = 25
    local Att3006_Dist_min = 4
    local Att3006_Dist_max = 10
    local Att3007_Dist_min = 2.4
    local Att3007_Dist_max = 7
    local Att3008_Dist_min = -4
    local Att3008_Dist_max = 0
    local Att3009_Dist_min = -4
    local Att3009_Dist_max = 0
    local Att3010_Dist_min = 3
    local Att3010_Dist_max = 9
    local Att3011_Dist_min = 0
    local Att3011_Dist_max = 8
    local Att3012_Dist_min = 6
    local Att3012_Dist_max = 13
    local Att3017_Dist_min = 16
    local Att3017_Dist_max = 25
    local RegenerateArm1Per = 0
    local RegenerateTailPer = 0
    local Act01Per = 0
    local Act02Per = 0
    local Act03Per = 0
    local Act04Per = 0
    local Act05Per = 0
    local Act06Per = 0
    local Act07Per = 0
    local Act08Per = 0
    local Act09Per = 0
    local Act10Per = 0
    local Act11Per = 0
    local Act12Per = 0
    local Act13Per = 0
    local Act14Per = 0
    local Act15Per = 0
    if arm1DmgLv == PARTS_DMG_LV1 then
        if A == false then
            -- Rare decompiling error:
            --local local0 = true
            --SETUPVAL 64 0 0

            -- Straightforward fix:
            A = true

            ai:SetTimer(0, 40)
        elseif ai:GetTimer(0) <= 0 then
            RegenerateArm1Per = 100
            -- Rare decompiling error:
            --local local0 = false
            --SETUPVAL 64 0 0

            -- Straightforward fix:
            A = false
        end
    elseif tailDmgLv == PARTS_DMG_LV1 then
        if B == false then
            -- Rare decompiling error:
            --local local0 = true
            --SETUPVAL 64 1 0

            -- Straightforward fix:
            B = true

            ai:SetTimer(1, 40)
        elseif ai:GetTimer(1) <= 0 then
            RegenerateTailPer = 100
            -- Rare decompiling error:
            --local local0 = false
            --SETUPVAL 64 1 0

            -- Straightforward fix:
            B = false
        end
    end
    if arm1DmgLv == PARTS_DMG_NONE then
        if hprate <= 0.5 and -5 <= targetDist and targetDist <= 2 and fate2 <= 60 then
            Act05Per = 100
        elseif hprate <= 0.5 and 16 <= targetDist and targetDist <= 25 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 240) and fate3 <= 60 then
            Act07Per = 100
        elseif 2.4 <= targetDist and targetDist <= 7 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 30) and fate4 <= 60 then
            Act10Per = 100
        elseif -2 <= targetDist and targetDist <= 7 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 20) and fate5 <= 80 then
            Act04Per = 100
        elseif -2 <= targetDist and targetDist <= 7 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 120) and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 90) and fate5 <= 80 then
            Act04Per = 100
        elseif targetDist <= 0 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 60) and fate6 <= 80 then
            Act08Per = 100
        elseif targetDist <= 0 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 60) and fate6 <= 80 then
            Act08Per = 100
        elseif targetDist <= 1 and fate7 <= 50 then
            Act11Per = 100
        elseif 4.5 <= targetDist and targetDist <= 8 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 40) and fate8 <= 50 then
            Act01Per = 100
        elseif 10 <= targetDist and targetDist <= 16 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 40) and fate9 <= 50 then
            Act02Per = 100
        elseif 7 <= targetDist and targetDist <= 13 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 120) and fate10 <= 50 then
            Act03Per = 100
        elseif 4 <= targetDist and targetDist <= 6.5 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 40) and fate11 <= 35 then
            Act06Per = 100
        elseif 20 <= targetDist then
            if 0.5 <= hprate then
                Act02Per = 100
            else
                Act02Per = 25
                Act07Per = 75
            end
        elseif 12 <= targetDist then
            if 0.5 <= hprate then
                Act02Per = 75
                Act03Per = 25
            else
                Act02Per = 20
                Act03Per = 5
                Act07Per = 75
            end
        elseif 8 <= targetDist then
            if 0.5 <= hprate then
                Act01Per = 25
                Act02Per = 5
                Act03Per = 60
                Act06Per = 10
            else
                Act01Per = 5
                Act02Per = 5
                Act03Per = 15
                Act05Per = 75
            end
        elseif 4 <= targetDist then
            if 0.5 <= hprate then
                Act01Per = 50
                Act03Per = 5
                Act06Per = 30
                Act11Per = 15
            else
                Act01Per = 15
                Act05Per = 75
                Act11Per = 10
            end
        elseif 0 <= targetDist then
            if 0.5 <= hprate then
                Act01Per = 15
                Act06Per = 45
                Act09Per = 25
                Act11Per = 15
            else
                Act01Per = 15
                Act06Per = 45
                Act09Per = 25
                Act11Per = 15
            end
        elseif 0.5 <= hprate then
            Act01Per = 15
            Act09Per = 35
            Act11Per = 50
        else
            Act01Per = 15
            Act09Per = 35
            Act11Per = 50
        end
    elseif hprate <= 0.5 and 12 <= targetDist and targetDist <= 20 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 240) and fate2 <= 35 then
        Act15Per = 100
    elseif 2.4 <= targetDist and targetDist <= 7 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 30) and fate3 <= 35 then
        Act10Per = 100
    elseif -2 <= targetDist and targetDist <= 7 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 20) and fate4 <= 45 then
        Act04Per = 100
    elseif -2 <= targetDist and targetDist <= 7 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 120) and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 90) and fate4 <= 45 then
        Act04Per = 100
    elseif targetDist <= 0 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 60) and fate5 <= 45 then
        Act08Per = 100
    elseif targetDist <= 0 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 60) and fate5 <= 45 then
        Act08Per = 100
    elseif targetDist <= 1 and fate6 <= 25 then
        Act11Per = 100
    elseif 20 <= targetDist then
        if 0.5 <= hprate then
            Act09Per = 0
            Act10Per = 0
            Act11Per = 0
            Act12Per = 25
            Act13Per = 25
            Act14Per = 50
            Act15Per = 0
        else
            Act09Per = 0
            Act10Per = 0
            Act11Per = 0
            Act12Per = 5
            Act13Per = 5
            Act14Per = 10
            Act15Per = 80
        end
    elseif 12 <= targetDist then
        if 0.5 <= hprate then
            Act09Per = 0
            Act10Per = 0
            Act11Per = 0
            Act12Per = 25
            Act13Per = 25
            Act14Per = 50
            Act15Per = 0
        else
            Act09Per = 0
            Act10Per = 0
            Act11Per = 0
            Act12Per = 5
            Act13Per = 5
            Act14Per = 10
            Act15Per = 80
        end
    elseif 8 <= targetDist then
        if 0.5 <= hprate then
            Act09Per = 15
            Act10Per = 0
            Act11Per = 0
            Act12Per = 25
            Act13Per = 15
            Act14Per = 45
            Act15Per = 0
        else
            Act09Per = 15
            Act10Per = 0
            Act11Per = 0
            Act12Per = 25
            Act13Per = 15
            Act14Per = 45
            Act15Per = 0
        end
    elseif 4 <= targetDist then
        if 0.5 <= hprate then
            Act09Per = 15
            Act10Per = 0
            Act11Per = 10
            Act12Per = 30
            Act13Per = 25
            Act14Per = 20
            Act15Per = 0
        else
            Act09Per = 15
            Act10Per = 0
            Act11Per = 10
            Act12Per = 30
            Act13Per = 25
            Act14Per = 20
            Act15Per = 0
        end
    elseif 0 <= targetDist then
        if 0.5 <= hprate then
            Act09Per = 25
            Act10Per = 0
            Act11Per = 20
            Act12Per = 20
            Act13Per = 35
            Act14Per = 0
            Act15Per = 0
        else
            Act09Per = 25
            Act10Per = 0
            Act11Per = 20
            Act12Per = 20
            Act13Per = 35
            Act14Per = 0
            Act15Per = 0
        end
    elseif 0.5 <= hprate then
        Act09Per = 30
        Act10Per = 0
        Act11Per = 40
        Act12Per = 15
        Act13Per = 15
        Act14Per = 0
        Act15Per = 0
    else
        Act09Per = 30
        Act10Per = 0
        Act11Per = 40
        Act12Per = 15
        Act13Per = 15
        Act14Per = 0
        Act15Per = 0
    end
    local fateAct = ai:GetRandam_Int(1, Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per + Act10Per + Act11Per + Act12Per + Act13Per + Act14Per + Act15Per)
    if RegenerateArm1Per == 100 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 8200, TARGET_NONE, DIST_None, 0, -1)
    elseif RegenerateTailPer == 100 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 8210, TARGET_NONE, DIST_None, 0, -1)
    elseif fateAct <= Act01Per then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3000_Dist_max, TARGET_SELF, true, -1)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_None, 1, -1)
    elseif fateAct <= Act01Per + Act02Per then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_ENE_0, Att3002_Dist_max, TARGET_SELF, true, -1)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3002, TARGET_ENE_0, DIST_None, -1, -1)
    elseif fateAct <= Act01Per + Act02Per + Act03Per then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3003_Dist_max, TARGET_SELF, true, -1)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3003, TARGET_ENE_0, DIST_None, 1, -1)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per then
        if tailDmgLv == PARTS_DMG_LV1 and arm1DmgLv == PARTS_DMG_LV1 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3015, TARGET_ENE_0, DIST_None, 0, -1)
        elseif tailDmgLv == PARTS_DMG_LV1 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3014, TARGET_ENE_0, DIST_None, 0, -1)
        elseif arm1DmgLv == PARTS_DMG_LV1 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3016, TARGET_ENE_0, DIST_None, 0, -1)
        else
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3004, TARGET_ENE_0, DIST_None, 0, -1)
        end
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3006_Dist_max, TARGET_SELF, true, -1)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3006, TARGET_ENE_0, DIST_None, 0, -1)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3001_Dist_max, TARGET_SELF, true, -1)
        goal:AddSubGoal(GOAL_COMMON_If, 10, 0)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3005_Dist_max, TARGET_SELF, true, -1)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3005, TARGET_ENE_0, DIST_None, -1, -1)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3008, TARGET_ENE_0, DIST_None, 0, -1)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 701, TARGET_NONE, 0, AI_DIR_TYPE_B, 7)
    elseif fate <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per + Act10Per then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 3, TARGET_ENE_0, Att3007_Dist_max, TARGET_SELF, true, -1)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3007, TARGET_ENE_0, DIST_None, -1, -1)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per + Act10Per + Act11Per then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3009, TARGET_ENE_0, DIST_None, 0, -1)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per + Act10Per + Act11Per + Act12Per then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3010_Dist_max, TARGET_SELF, true, -1)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3010, TARGET_ENE_0, DIST_None, 1, -1)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per + Act10Per + Act11Per + Act12Per + Act13Per then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3011_Dist_max, TARGET_SELF, true, -1)
        goal:AddSubGoal(GOAL_COMMON_If, 10, 1)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per + Act10Per + Act11Per + Act12Per + Act13Per + Act14Per then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3012_Dist_max, TARGET_SELF, true, -1)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3012, TARGET_ENE_0, DIST_None, -1, -1)
    else
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3017_Dist_max, TARGET_SELF, true, -1)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3017, TARGET_ENE_0, DIST_None, -1, -1)
    end
    return 
end

function mukade520000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function mukade520000Battle_Terminate(ai, goal)
    return 
end

function mukade520000Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local distGuardBreak_Act = 13
    local oddsGuardBreak_Act = 80
    if GuardBreak_Act(ai, goal, distGuardBreak_Act, oddsGuardBreak_Act) then
        if arm1DmgLv == PARTS_DMG_NONE then
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3012, TARGET_ENE_0, DIST_Middle, 0)
        end
        return true
    else
        local distUseItem_Act = 13
        local oddsUseItem_Act = 10
        if UseItem_Act(ai, goal, distUseItem_Act, oddsUseItem_Act) then
            if arm1DmgLv == PARTS_DMG_NONE then
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
            else
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3012, TARGET_ENE_0, DIST_Middle, 0)
            end
            return true
        else
            local distResNear = 6
            local distResFar = 13
            local oddsResNear = 0
            local oddsResFar = 15
            local ResBehavID = Shoot_2dist(ai, goal, distResNear, distResFar, oddsResNear, oddsResFar)
            if ResBehavID == 1 then
                if fate <= 50 then
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 3)
                else
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 3)
                end
                return true
            elseif ResBehavID == 2 then
                if arm1DmgLv == PARTS_DMG_NONE then
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                else
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3012, TARGET_ENE_0, DIST_Middle, 0)
                end
                return true
            else
                return false
            end
        end
    end
end

return 
