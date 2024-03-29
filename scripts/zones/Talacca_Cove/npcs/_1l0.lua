-----------------------------------
-- Area: Talacca_Cove
-- NPC:  rock slab (corsair job flag quest)
-- !pos -99 -7 -91 57
-----------------------------------
local ID = require("scripts/zones/Talacca_Cove/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/status");
require("scripts/globals/bcnm");
-----------------------------------

function onTrade(player,npc,trade)
    printf("Trade")
	if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
        return;
    end
end;

function onTrigger(player,npc)

    local LuckOfTheDraw = player:getVar("LuckOfTheDraw");

    if (LuckOfTheDraw ==4) then
        player:startEvent(3);
    elseif (player:hasCompletedMission(TOAU,dsp.mission.id.toau.LEGACY_OF_THE_LOST)) then
        player:PrintToPlayer("You are now able to summon Gessho as a Trust!", 0x1C);
		player:addSpell(918);
    elseif (EventTriggerBCNM(player,npc)) then
        return;
    end

end;

function onEventUpdate(player,csid,option)
    if (EventUpdateBCNM(player,csid,option)) then
        return;
    end
end;

function onEventFinish(player,csid,option)
    if (csid == 3) then -- complete corsair job flag quest
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,5493);
        else
            player:setVar("LuckOfTheDraw",5); -- var will remain for af quests
            player:addItem(5493);
            player:messageSpecial(ID.text.ITEM_OBTAINED,5493);
            player:delKeyItem(dsp.ki.FORGOTTEN_HEXAGUN);
            player:unlockJob(dsp.job.COR);
            player:messageSpecial(ID.text.YOU_CAN_NOW_BECOME_A_CORSAIR);
            player:completeQuest(AHT_URHGAN,dsp.quest.id.ahtUrhgan.LUCK_OF_THE_DRAW);
        end
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end

end;
