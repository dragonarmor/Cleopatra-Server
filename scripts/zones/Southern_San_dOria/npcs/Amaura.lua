-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Amaura
-- Involved in Quest: The Medicine Woman, To Cure a Cough
-- !pos -85 -6 89 230
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
local ID = require("scripts/zones/Southern_San_dOria/IDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:hasKeyItem(dsp.ki.AMAURAS_FORMULA) == true) then
        if (trade:hasItemQty(920,1) == true and trade:hasItemQty(642,1) == true and trade:hasItemQty(846,1) == true and trade:getItemCount() == 3) then
            player:startEvent(637);
        end
    end

    if ((trade:hasItemQty(2728,1)) and player:getVar("DaughterOfaKnight") == 1) then
        player:startEvent(937)
    end

end;

function onTrigger(player,npc)

    medicineWoman = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.THE_MEDICINE_WOMAN);
    toCureaCough = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.TO_CURE_A_COUGH);
    if (player:getCurrentMission(WOTG) == dsp.mission.id.wotg.DAUGHTER_OF_A_KNIGHT) then
        if (player:getVar("DaughterOfaKnight") == 0) then
            player:startEvent(935)
        elseif (player:getVar("DaughterOfaKnight") == 1) then
            player:startEvent(936)
        elseif (player:getVar("DaughterOfaKnight") == 6) then
            player:startEvent(939)
            -- TODO Add Need to zone here?
        elseif (player:getVar("DaughterOfaKnight") == 7) then
            player:startEvent(941)
        end
    elseif (medicineWoman == QUEST_ACCEPTED) then
        amaurasFormulaKI = player:hasKeyItem(dsp.ki.AMAURAS_FORMULA);
        coldMedicine = player:hasKeyItem(dsp.ki.COLD_MEDICINE);

        if (amaurasFormulaKI == false and coldMedicine == false) then
            player:startEvent(636);
        else
            player:startEvent(642);
        end
    elseif (player:getVar("DiaryPage") == 3 or toCureaCough == QUEST_ACCEPTED) then
        if (player:hasKeyItem(dsp.ki.THYME_MOSS) == false and player:hasKeyItem(dsp.ki.COUGH_MEDICINE) == false) then
            player:startEvent(645); -- need thyme moss for cough med
        elseif (player:hasKeyItem(dsp.ki.THYME_MOSS) == true) then
            player:startEvent(646); -- receive cough med for Nenne
        end
    else
        player:startEvent(642);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 636 and option == 0) then
        player:addKeyItem(dsp.ki.AMAURAS_FORMULA);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.AMAURAS_FORMULA);
    elseif (csid == 637) then
        player:tradeComplete();
        player:delKeyItem(dsp.ki.AMAURAS_FORMULA);
        player:addKeyItem(dsp.ki.COLD_MEDICINE);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.COLD_MEDICINE);
    elseif (csid == 645) then
        player:addQuest(SANDORIA,dsp.quest.id.sandoria.TO_CURE_A_COUGH);
    elseif (csid == 646) then
        player:delKeyItem(dsp.ki.THYME_MOSS);
        player:addKeyItem(dsp.ki.COUGH_MEDICINE);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.COUGH_MEDICINE);
    elseif (csid == 935) then
        player:setVar("DaughterOfaKnight",1)
    elseif (csid == 937) then
        player:setVar("DaughterOfaKnight",2)
    elseif (csid == 939) then
        player:setVar("DaughterOfaKnight",7)
        player:delKeyItem(dsp.ki.CERNUNNOS_RESIN)
    elseif (csid == 941) then
        player:addKeyItem(dsp.ki.BOTTLE_OF_TREANT_TONIC)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.BOTTLE_OF_TREANT_TONIC);
        player:setVar("DaughterOfaKnight",0)
        player:completeMission(WOTG, dsp.mission.id.wotg.DAUGHTER_OF_A_KNIGHT)
        player:addMission(WOTG, dsp.mission.id.wotg.A_SPOONFUL_OF_SUGAR)
        player:addSpell(945);
	    player:PrintToPlayer("You are now able to summon the Lilisette as a Trust!", 0x15);
    end


end;