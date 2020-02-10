REGISTER_GOAL(GOAL_Tadare525000_Battle, "Tadare525000Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_Tadare525000_Battle, 1)
function Tadare525000Battle_Activate(ai, goal)
    local hprate = ai:GetHpRate(TARGET_SELF)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local eventNo = ai:GetEventRequest(1)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local fate4 = ai:GetRandam_Int(1, 100)
    local Act001Per = 0
    local Act002Per = 0
    local Act003Per = 0
    local Act004Per = 0
    local Act005Per = 0
    local Act006Per = 0
    local Act021Per = 0
    local Act022Per = 0
    local Act023Per = 0
    local Act024Per = 0
    local Act025Per = 0
    local Act026Per = 0
    local Act027Per = 0
    local Act041Per = 0
    local Act042Per = 0
    local Act043Per = 0
    local Act044Per = 0
    local Act045Per = 0
    local Act046Per = 0
    local Act047Per = 0
    local Act048Per = 0
    local Act049Per = 0
    local Act061Per = 0
    local Act062Per = 0
    local Act063Per = 0
    local Act064Per = 0
    local Act065Per = 0
    local Act066Per = 0
    local Act067Per = 0
    local Act068Per = 0
    local Act069Per = 0
    local Act070Per = 0
    local Act101Per = 0
    local Act102Per = 0
    local Act103Per = 0
    local Act104Per = 0
    local Act111Per = 0
    local Act112Per = 0
    local WalkArea = ai:GetNumber(0) + 1
    ai:KickLuaCall(10000, WalkArea, 0)
    if ai:HasSpecialEffectId(TARGET_SELF, 5131) then
        Act101Per = 100
    elseif ai:GetNumber(0) == 0 then
        if eventNo == 1 then
            Act102Per = 100
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412795) then
            Act112Per = 100
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412794) then
            Act111Per = 100
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412780) then
            Act026Per = 100
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412790) and targetDist <= 27 then
            Act001Per = 50
            Act002Per = 50
            Act003Per = 30
            Act004Per = 10
            Act005Per = 0
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412790) and targetDist <= 29 then
            Act001Per = 10
            Act002Per = 10
            Act003Per = 50
            Act004Per = 30
            Act005Per = 30
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412790) and targetDist <= 33 then
            Act001Per = 0
            Act002Per = 0
            Act003Per = 10
            Act004Per = 50
            Act005Per = 30
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412790) and targetDist <= 37 then
            Act001Per = 0
            Act002Per = 0
            Act003Per = 0
            Act004Per = 30
            Act005Per = 50
            Act104Per = 20
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412790) and targetDist <= 38.5 then
            Act001Per = 0
            Act002Per = 0
            Act003Per = 0
            Act004Per = 0
            Act005Per = 30
            Act104Per = 50
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412790) and targetDist <= 69.5 then
            if ai:IsInsideTargetRegion(TARGET_ENE_0, 1412796) then
                if targetDist <= 45 then
                    Act005Per = 30
                else
                    Act104Per = 100
                end
            else
                Act104Per = 25
                Act006Per = 75
            end
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412790) then
            Act104Per = 100
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412791) and targetDist <= 26 then
            Act021Per = 50
            Act022Per = 50
            Act023Per = 30
            Act024Per = 10
            Act025Per = 0
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412791) and targetDist <= 30 then
            Act021Per = 10
            Act022Per = 10
            Act023Per = 50
            Act024Per = 30
            Act025Per = 30
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412791) and targetDist <= 33 then
            Act021Per = 0
            Act022Per = 0
            Act023Per = 10
            Act024Per = 50
            Act025Per = 30
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412791) and targetDist <= 35 then
            Act021Per = 0
            Act022Per = 0
            Act023Per = 0
            Act024Per = 30
            Act025Per = 50
            Act104Per = 20
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412791) and targetDist <= 38 then
            Act021Per = 0
            Act022Per = 0
            Act023Per = 0
            Act024Per = 0
            Act025Per = 30
            Act104Per = 50
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412791) and targetDist <= 69.5 then
            if ai:IsInsideTargetRegion(TARGET_ENE_0, 1412780) then
                Act104Per = 35
            else
                Act104Per = 25
                Act027Per = 75
            end
        else
            Act104Per = 100
        end
    elseif ai:GetNumber(0) == 1 then
        if ai:IsInsideTargetRegion(TARGET_ENE_0, 1412795) then
            Act112Per = 100
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412794) then
            Act111Per = 100
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412790) and targetDist <= 22 then
            Act041Per = 50
            Act042Per = 60
            Act043Per = 5
            Act044Per = 0
            Act045Per = 0
            Act046Per = 5
            Act047Per = 0
            Act048Per = 30
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412790) and targetDist <= 25 then
            Act041Per = 5
            Act042Per = 60
            Act043Per = 30
            Act044Per = 10
            Act045Per = 0
            Act046Per = 20
            Act047Per = 5
            Act048Per = 20
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412790) and targetDist <= 27 then
            Act041Per = 5
            Act042Per = 60
            Act043Per = 50
            Act044Per = 10
            Act045Per = 20
            Act046Per = 50
            Act047Per = 20
            Act048Per = 0
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412790) and targetDist <= 32 then
            Act041Per = 0
            Act042Per = 5
            Act043Per = 30
            Act044Per = 30
            Act045Per = 20
            Act046Per = 50
            Act047Per = 20
            Act048Per = 0
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412790) and targetDist <= 36 then
            Act041Per = 0
            Act042Per = 0
            Act043Per = 0
            Act044Per = 50
            Act045Per = 20
            Act046Per = 0
            Act047Per = 20
            Act048Per = 0
            Act104Per = 80
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412790) and targetDist <= 38.5 then
            Act041Per = 0
            Act042Per = 0
            Act043Per = 0
            Act044Per = 50
            Act045Per = 0
            Act046Per = 0
            Act047Per = 0
            Act048Per = 0
            Act104Per = 80
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412790) and targetDist <= 69.5 then
            if ai:IsInsideTargetRegion(TARGET_ENE_0, 1412796) then
                if targetDist <= 45 then
                    Act044Per = 50
                else
                    Act104Per = 100
                end
            else
                Act104Per = 25
                Act049Per = 75
            end
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412790) then
            Act104Per = 100
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412791) and targetDist <= 27 then
            Act061Per = 50
            Act062Per = 0
            Act063Per = 5
            Act064Per = 0
            Act065Per = 0
            Act066Per = 10
            Act067Per = 0
            Act068Per = 100
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412791) and targetDist <= 29 then
            Act061Per = 10
            Act062Per = 30
            Act063Per = 50
            Act064Per = 5
            Act065Per = 100
            Act066Per = 0
            Act067Per = 30
            Act068Per = 0
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412791) and targetDist <= 33 then
            Act061Per = 0
            Act062Per = 50
            Act063Per = 50
            Act064Per = 30
            Act065Per = 100
            Act066Per = 30
            Act067Per = 100
            Act068Per = 0
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412791) and targetDist <= 37 then
            Act061Per = 0
            Act062Per = 5
            Act063Per = 5
            Act064Per = 50
            Act065Per = 100
            Act066Per = 50
            Act067Per = 100
            Act068Per = 0
            Act104Per = 50
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412791) and targetDist <= 40 then
            Act061Per = 0
            Act062Per = 0
            Act063Per = 0
            Act064Per = 30
            Act065Per = 50
            Act066Per = 30
            Act067Per = 30
            Act068Per = 0
            Act104Per = 100
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412791) and targetDist <= 69.5 then
            if ai:IsInsideTargetRegion(TARGET_ENE_0, 1412780) then
                Act104Per = 100
            else
                Act104Per = 25
                Act070Per = 75
            end
        else
            Act104Per = 100
        end
    end
    local fateAct = ai:GetRandam_Int(1, Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per + Act044Per + Act045Per + Act046Per + Act047Per + Act048Per + Act049Per + Act061Per + Act062Per + Act063Per + Act064Per + Act065Per + Act066Per + Act067Per + Act068Per + Act069Per + Act070Per + Act101Per + Act102Per + Act103Per + Act104Per + Act111Per + Act112Per)
    if fateAct <= Act001Per then
        Tadare525000_Act001(ai, goal)
    elseif fateAct <= Act001Per + Act002Per then
        Tadare525000_Act002(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per then
        Tadare525000_Act003(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per then
        Tadare525000_Act004(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per then
        Tadare525000_Act005(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per then
        Tadare525000_Act006(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per then
        Tadare525000_Act021(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per then
        Tadare525000_Act022(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per then
        Tadare525000_Act023(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per then
        Tadare525000_Act024(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per then
        Tadare525000_Act025(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per then
        Tadare525000_Act026(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per then
        Tadare525000_Act027(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per then
        Tadare525000_Act041(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per then
        Tadare525000_Act042(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per then
        Tadare525000_Act043(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per + Act044Per then
        Tadare525000_Act044(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per + Act044Per + Act045Per then
        Tadare525000_Act045(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per + Act044Per + Act045Per + Act046Per then
        Tadare525000_Act046(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per + Act044Per + Act045Per + Act046Per + Act047Per then
        Tadare525000_Act047(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per + Act044Per + Act045Per + Act046Per + Act047Per + Act048Per then
        Tadare525000_Act048(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per + Act044Per + Act045Per + Act046Per + Act047Per + Act048Per + Act049Per then
        Tadare525000_Act049(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per + Act044Per + Act045Per + Act046Per + Act047Per + Act048Per + Act049Per + Act061Per then
        Tadare525000_Act061(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per + Act044Per + Act045Per + Act046Per + Act047Per + Act048Per + Act049Per + Act061Per + Act062Per then
        Tadare525000_Act062(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per + Act044Per + Act045Per + Act046Per + Act047Per + Act048Per + Act049Per + Act061Per + Act062Per + Act063Per then
        Tadare525000_Act063(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per + Act044Per + Act045Per + Act046Per + Act047Per + Act048Per + Act049Per + Act061Per + Act062Per + Act063Per + Act064Per then
        Tadare525000_Act064(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per + Act044Per + Act045Per + Act046Per + Act047Per + Act048Per + Act049Per + Act061Per + Act062Per + Act063Per + Act064Per + Act065Per then
        Tadare525000_Act065(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per + Act044Per + Act045Per + Act046Per + Act047Per + Act048Per + Act049Per + Act061Per + Act062Per + Act063Per + Act064Per + Act065Per + Act066Per then
        Tadare525000_Act066(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per + Act044Per + Act045Per + Act046Per + Act047Per + Act048Per + Act049Per + Act061Per + Act062Per + Act063Per + Act064Per + Act065Per + Act066Per + Act067Per then
        Tadare525000_Act067(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act041Per + Act042Per + Act043Per + Act044Per + Act045Per + Act046Per + Act047Per + Act048Per + Act049Per + Act061Per + Act062Per + Act063Per + Act064Per + Act065Per + Act066Per + Act067Per + Act068Per then
        Tadare525000_Act068(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per + Act044Per + Act045Per + Act046Per + Act047Per + Act048Per + Act049Per + Act061Per + Act062Per + Act063Per + Act064Per + Act065Per + Act066Per + Act067Per + Act068Per + Act069Per then
        Tadare525000_Act069(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per + Act044Per + Act045Per + Act046Per + Act047Per + Act048Per + Act049Per + Act061Per + Act062Per + Act063Per + Act064Per + Act065Per + Act066Per + Act067Per + Act068Per + Act069Per + Act070Per then
        Tadare525000_Act070(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per + Act044Per + Act045Per + Act046Per + Act047Per + Act048Per + Act049Per + Act061Per + Act062Per + Act063Per + Act064Per + Act065Per + Act066Per + Act067Per + Act068Per + Act069Per + Act070Per + Act101Per then
        Tadare525000_Act101(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per + Act044Per + Act045Per + Act046Per + Act047Per + Act048Per + Act049Per + Act061Per + Act062Per + Act063Per + Act064Per + Act065Per + Act066Per + Act067Per + Act068Per + Act069Per + Act070Per + Act101Per + Act102Per then
        Tadare525000_Act102(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per + Act044Per + Act045Per + Act046Per + Act047Per + Act048Per + Act049Per + Act061Per + Act062Per + Act063Per + Act064Per + Act065Per + Act066Per + Act067Per + Act068Per + Act069Per + Act070Per + Act101Per + Act102Per + Act103Per then
        Tadare525000_Act103(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per + Act044Per + Act045Per + Act046Per + Act047Per + Act048Per + Act049Per + Act061Per + Act062Per + Act063Per + Act064Per + Act065Per + Act066Per + Act067Per + Act068Per + Act069Per + Act070Per + Act101Per + Act102Per + Act103Per + Act104Per then
        Tadare525000_Act104(ai, goal)
    elseif fateAct <= Act001Per + Act002Per + Act003Per + Act004Per + Act005Per + Act006Per + Act021Per + Act022Per + Act023Per + Act024Per + Act025Per + Act026Per + Act027Per + Act041Per + Act042Per + Act043Per + Act044Per + Act045Per + Act046Per + Act047Per + Act048Per + Act049Per + Act061Per + Act062Per + Act063Per + Act064Per + Act065Per + Act066Per + Act067Per + Act068Per + Act069Per + Act070Per + Act101Per + Act102Per + Act103Per + Act104Per + Act111Per then
        Tadare525000_Act111(ai, goal)
    else
        Tadare525000_Act112(ai, goal)
    end
    return 
end

function Tadare525000_Act001(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3000, TARGET_ENE_0, 35, 2.5, 25)
    return 
end

function Tadare525000_Act002(ai, goal)
    local fate2 = ai:GetRandam_Int(1, 100)
    if fate2 <= 40 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3001, TARGET_ENE_0, 40, 2.5, 25)
    elseif fate2 <= 95 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 20, 3001, TARGET_ENE_0, 40, 2.5, 25)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 20, 3005, TARGET_ENE_0, 40, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 20, 3001, TARGET_ENE_0, 40, 2.5, 25)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 20, 3005, TARGET_ENE_0, 40, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 20, 3005, TARGET_ENE_0, 40, 0)
    end
    return 
end

function Tadare525000_Act003(ai, goal)
    local fate2 = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 20, 3002, TARGET_ENE_0, 40, 2.5, 45)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 20, 3006, TARGET_ENE_0, 40, 0)
    return 
end

function Tadare525000_Act004(ai, goal)
    local fate2 = ai:GetRandam_Int(1, 100)
    if fate2 <= 40 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3003, TARGET_ENE_0, 43, 2.5, 5)
    elseif fate2 <= 90 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3007, TARGET_ENE_0, 43, 2.5, 5)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3010, TARGET_ENE_0, 43, 2.5, 5)
    end
    return 
end

function Tadare525000_Act005(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3004, TARGET_ENE_0, 45, 2.5, 5)
    return 
end

function Tadare525000_Act006(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3025, TARGET_ENE_0, DIST_None, 2.5, 5)
    return 
end

function Tadare525000_Act021(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3015, TARGET_ENE_0, 35, 2.5, 25)
    return 
end

function Tadare525000_Act022(ai, goal)
    local fate2 = ai:GetRandam_Int(1, 100)
    if fate2 <= 40 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3016, TARGET_ENE_0, 40, 2.5, 25)
    elseif fate2 <= 95 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 20, 3016, TARGET_ENE_0, 40, 2.5, 25)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 20, 3020, TARGET_ENE_0, 40, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 20, 3016, TARGET_ENE_0, 40, 2.5, 25)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 20, 3020, TARGET_ENE_0, 40, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 20, 3020, TARGET_ENE_0, 40, 0)
    end
    return 
end

function Tadare525000_Act023(ai, goal)
    local fate2 = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 20, 3017, TARGET_ENE_0, 40, 2.5, 45)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 20, 3021, TARGET_ENE_0, 40, 0)
    return 
end

function Tadare525000_Act024(ai, goal)
    local fate2 = ai:GetRandam_Int(1, 100)
    if fate2 <= 40 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3018, TARGET_ENE_0, 43, 2.5, 5)
    elseif fate2 <= 90 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3022, TARGET_ENE_0, 43, 2.5, 5)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3023, TARGET_ENE_0, 43, 2.5, 5)
    end
    return 
end

function Tadare525000_Act025(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3019, TARGET_ENE_0, 45, 2.5, 5)
    return 
end

function Tadare525000_Act026(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    ai:SetEventMoveTarget(1412720)
    local EventPointDist = ai:GetDistAtoB(POINT_EVENT, TARGET_SELF)
    if 2 <= EventPointDist then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, POINT_EVENT, 0.05, TARGET_SELF, false, -1)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3024, TARGET_ENE_0, DIST_None, 2.5, 5)
    end
    return 
end

function Tadare525000_Act027(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3024, TARGET_ENE_0, DIST_None, 2.5, 5)
    return 
end

function Tadare525000_Act041(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3000, TARGET_ENE_0, 35, 2.5, 25)
    return 
end

function Tadare525000_Act042(ai, goal)
    local fate2 = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 20, 3002, TARGET_ENE_0, 40, 2.5, 45)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 20, 3006, TARGET_ENE_0, 40, 0)
    return 
end

function Tadare525000_Act043(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3003, TARGET_ENE_0, 43, 2.5, 5)
    return 
end

function Tadare525000_Act044(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3004, TARGET_ENE_0, 45, 2.5, 5)
    return 
end

function Tadare525000_Act045(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3010, TARGET_ENE_0, 45, 2.5, 5)
    return 
end

function Tadare525000_Act046(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3011, TARGET_ENE_0, 45, 2.5, 10)
    return 
end

function Tadare525000_Act047(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3012, TARGET_ENE_0, 45, 2.5, 5)
    return 
end

function Tadare525000_Act048(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3013, TARGET_ENE_0, 35, 2.5, 5)
    return 
end

function Tadare525000_Act049(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3023, TARGET_ENE_0, DIST_None, 2.5, 5)
    return 
end

function Tadare525000_Act061(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3015, TARGET_ENE_0, 35, 2.5, 25)
    return 
end

function Tadare525000_Act062(ai, goal)
    local fate2 = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 20, 3017, TARGET_ENE_0, 40, 2.5, 45)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 20, 3021, TARGET_ENE_0, 40, 0)
    return 
end

function Tadare525000_Act063(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3018, TARGET_ENE_0, 43, 2.5, 5)
    return 
end

function Tadare525000_Act064(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3019, TARGET_ENE_0, 45, 2.5, 5)
    return 
end

function Tadare525000_Act065(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3025, TARGET_ENE_0, 45, 2.5, 5)
    return 
end

function Tadare525000_Act066(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3026, TARGET_ENE_0, 45, 2.5, 10)
    return 
end

function Tadare525000_Act067(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3027, TARGET_ENE_0, 45, 2.5, 5)
    return 
end

function Tadare525000_Act068(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3028, TARGET_ENE_0, 30, 2.5, 5)
    return 
end

function Tadare525000_Act069(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    ai:SetEventMoveTarget(1412720)
    local EventPointDist = ai:GetDistAtoB(POINT_EVENT, TARGET_SELF)
    if 2 <= EventPointDist then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, POINT_EVENT, 0.05, TARGET_SELF, false, -1)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3022, TARGET_ENE_0, DIST_None, 2.5, 5)
    end
    return 
end

function Tadare525000_Act070(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, 3022, TARGET_ENE_0, DIST_None, 2.5, 5)
    return 
end

function Tadare525000_Act101(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_SELF, 0, 0, 0)
    return 
end

function Tadare525000_Act102(ai, goal)
    local StateNo = ai:GetNumber(0)
    ai:SetNumber(0, StateNo + 1)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3009, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Tadare525000_Act103(ai, goal)
    local StateNo = ai:GetNumber(0)
    ai:SetNumber(0, StateNo + 1)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 20, 3008, TARGET_ENE_0, DIST_None, 0)
    return 
end

function Tadare525000_Act104(ai, goal)
    local EventPointDist = ai:GetDist_Point(POINT_EVENT)
    if 2 <= EventPointDist then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, POINT_EVENT, 0.05, TARGET_SELF, false, -1)
        goal:AddSubGoal(GOAL_COMMON_Turn, 5, TARGET_ENE_0, 30)
    else
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.01, TARGET_ENE_0, 0, 0, 0)
    end
    return 
end

function Tadare525000_Act111(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    ai:SetEventMoveTarget(1412713)
    local EventPointDist = ai:GetDistAtoB(POINT_EVENT, TARGET_SELF)
    if 2 <= EventPointDist then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, POINT_EVENT, 0.05, TARGET_SELF, false, -1)
    elseif ai:HasSpecialEffectId(TARGET_SELF, 5133) then
        if 34 <= targetDist then
            if fate <= 30 then
                Tadare525000_Act065(ai, goal)
            else
                Tadare525000_Act067(ai, goal)
            end
        else
            Tadare525000_Act068(ai, goal)
        end
    elseif 38 <= targetDist then
        Tadare525000_Act005(ai, goal)
    elseif 32 <= targetDist then
        Tadare525000_Act004(ai, goal)
    else
        Tadare525000_Act001(ai, goal)
    end
    return 
end

function Tadare525000_Act112(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    ai:SetEventMoveTarget(1412711)
    local EventPointDist = ai:GetDistAtoB(POINT_EVENT, TARGET_SELF)
    if 2 <= EventPointDist then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, POINT_EVENT, 0.05, TARGET_SELF, false, -1)
    else
        goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_ENE_0, 0, 0, 0)
    end
    return 
end

function Tadare525000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Tadare525000Battle_Terminate(ai, goal)
    return 
end

function Tadare525000Battle_Interupt(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    return false
end

return 
