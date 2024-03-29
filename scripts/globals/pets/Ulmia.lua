-------------------------------------------------
--  TRUST: Ulmia
--  Magic: None
--  JA: Sneak Attack, Trick Attack
--  WS: Wasp Sting, Shadow Stitch, Viper Bite,
--      Dancing Edge, Shark Bite, King Kobra Clamp
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/utils")
require("scripts/globals/trust_utils")

function onMobSpawn(mob)
    mob:setLocalVar("distanceTime",0)
    mob:setLocalVar("songTime",0)
    mob:setLocalVar("distanceRecast",0)
    mob:setLocalVar("songCheck",0)
    mob:setLocalVar("songCombo",0)
    mob:setLocalVar("singMage",0)
    mob:setLocalVar("finaleTime",0)
    mob:setLocalVar("elegyTime",0)
    mob:setLocalVar("elegyRecast",15)
    mob:setLocalVar("finaleRecast",90)
    mob:setLocalVar("requiemRecast",90)
    local angle = 100
    -- Add in ACC for acc check
    local addAcc = (mob:getMainLvl() / 4) * 3
    local addAtt = math.floor(mob:getMainLvl() * 1.25)
    mob:addMod(dsp.mod.ACC, addAcc)
    mob:addMod(dsp.mod.ATT, addAtt)

    printf("Ulmia Spawn!!!!")
    mob:SetAutoAttackEnabled(false)

    mob:addListener("COMBAT_TICK", "DISTANCE_TICK", function(mob, player, target)
        local singMage = mob:getLocalVar("singMage")
        if (singMage == 0) then
            trustMeleeMove(mob, player, target, angle)
        end
    end)

    mob:addListener("COMBAT_TICK", "SONG_CHECK", function(mob, player, target)
        local songTime = mob:getLocalVar("songTime")
        local songCheck = mob:getLocalVar("songCheck")
        local singMage = mob:getLocalVar("singMage")
        local distance = mob:checkDistance(target)
        local battletime = os.time()

        if (battletime > songTime + songCheck and singMage ~= 1) then
            trustMeleeMove(mob, player, target, angle)
            printf("Ulmia needs to move to front line")
            if (distance <= 3) then
                printf("Doing Song Check")
                doSongCheck(mob,player,target)
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "SONG_CAST", function(mob, player, target)
        local singTime = mob:getLocalVar("singTime")
        local singCheck = mob:getLocalVar("singCheck")
        local songCombo = mob:getLocalVar("songCombo")
        local distance = mob:checkDistance(target)
        local battletime = os.time()

        if (songCombo > 0 and (battletime > singTime + singCheck)) then
            printf("Cast the correct song combo")
            doSong(mob, player, target)
        end
    end)

    mob:addListener("COMBAT_TICK", "MAGE_CAST", function(mob, player, target)
        local singMage = mob:getLocalVar("singMage")
        local mageSongs = mob:getLocalVar("mageSongs")
        local distance = mob:checkDistance(target)
        local battletime = os.time()

        if (singMage == 1) then
            if (battletime > mageSongs) then
                trustBardMove(mob, player, target, angle)
                if (distance >= 16) then

                    doMageSongs(mob)
                end
            end
        elseif (singMage == 2) then
            doEnfeebs(mob, target)
        end

    end)

end

function doSongCheck(mob, player, target)
    -- printf("Song Check")
    local battletime = os.time()
    local party = player:getPartyWithTrusts()
    local eva = target:getEVA()
    local def = target:getStat(dsp.mod.DEF)
    local mlvl = mob:getMainLvl()
    local tlvl = target:getMainLvl()
    local count = 0
    local acc = 0
    local att = 0
    local dlvl = 0
    local pdif = 0
    if (mlvl > tlvl) then
        dlvl = 0
    else
        dlvl = tlvl - mlvl
    end



    -- Iterate through party and average out accuracy
    for i, member in ipairs(party) do
        acc = acc + member:getACC()
        count = count + 1
    end

    for i, member in ipairs(party) do
        att = att + member:getStat(dsp.mod.ATT)
    end

    local tacc = (acc / count)
    local thitrate = 75 + math.floor(((tacc - eva) / 2) - 2*(dlvl))
    thitrate = utils.clamp(thitrate, 20, 95)
    printf("The current party hitrate is %u \n",thitrate)

    local tatt = (att / count)
    pdif = (tatt / def)
    pdif = pdif - (dlvl * 0.025)
    pdif = utils.clamp(pdif, 0.5, 3.7)
    printf("The current party pdif is:")
    print(pdif)

    pickSongs(mob, player, target, thitrate, pdif)

    mob:setLocalVar("songTime",battletime)
end



function pickSongs(mob, player, target, thitrate, pdif)

    -- {Hitrate, Attack, combo}
    -- 1) March March
    -- 2) March Minute
    -- 3) Minute Minute
    -- 4) Madrigal Minute
    -- 5) Madgrigal Madrigal
    -- 6) Madrigal March

    local battletime = os.time()
    local combo = 0

    local songCombo = {{85, 2, 1},{85, 1, 2},{85, 0, 3},{70,2,6},{70, 1, 4},{20, 0, 5}}

    for i=1, #songCombo do
        if (thitrate >= songCombo[i][1]) then
            if (pdif >= songCombo[i][2]) then
                combo = songCombo[i][3]
                break
            end
        end
    end

    pdif = utils.clamp(pdif, 0.5, 3.7)

    printf("Song Combo is %u \n",combo)
    mob:setLocalVar("songCombo",combo)
    mob:setLocalVar("songCheck",130)  -- Won't do another song check for 2 min
    mob:setLocalVar("songTime",battletime)
    mob:setLocalVar("singTime",battletime)
    mob:setLocalVar("singCheck",3) -- force songs to cast 3 seconds after songcheck determines combos

    local newdif = string.format("%.1f", pdif)
	if (player:getVar("TrustSilence") == 1) then
        printf("CHECK!!!!!!!!!!!!!!")
    if (combo == 1) then
        player:PrintToPlayer("(Ulmia) Party HitRate: "..thitrate.." Party pDif: "..newdif.." Song Combo: March x2",0xF)
    elseif (combo == 2) then
        player:PrintToPlayer("(Ulmia) Party HitRate: "..thitrate.." Party pDif: "..newdif.." Song Combo: March / Minuet",0xF)
    elseif (combo == 3) then
        player:PrintToPlayer("(Ulmia) Party HitRate: "..thitrate.." Party pDif: "..newdif.." Song Combo: Minuet x2",0xF)
    elseif (combo == 4) then
        player:PrintToPlayer("(Ulmia) Party HitRate: "..thitrate.." Party pDif: "..newdif.." Song Combo: Madrigal / Minuet",0xF)
    elseif (combo == 5) then
        player:PrintToPlayer("(Ulmia) Party HitRate: "..thitrate.." Party pDif: "..newdif.." Song Combo: Madrigal x2",0xF)
    elseif (combo == 6) then
        player:PrintToPlayer("(Ulmia) Party HitRate: "..thitrate.." Party pDif: "..newdif.." Song Combo: Madrigal / March",0xF)
    end
	end
end



function doSong(mob, player, target)
    local distance = mob:checkDistance(target)
    print(distance)
    local songCombo = mob:getLocalVar("songCombo")
    local firstSong = mob:getLocalVar("firstSong")
    local secondSong = mob:getLocalVar("secondSong")
    local battletime = os.time()
    local lvl = mob:getMainLvl()
    local song = 0

    -- {Combo, Level, SpellID}
    local first = {{1,60,420},{1,29,419},{2,60,420},{2,29,419},{3,63,397},{3,43,396},{3,23,395},{3,3,394},{4,51,400},{4,11,399},{5,51,400},{5,11,399},{6,51,400},{6,11,399}}

    local second = {{1,60,419},{2,63,397},{2,43,396},{2,23,395},{2,3,394},{3,63,396},{3,43,395},{3,23,394},{4,63,397},{4,43,396},{4,23,395},{4,3,394},{5,51,399},{6,60,420},{6,29,419}}

    -- printf("Looking thru list for SongCombo %u \n",songCombo)
    if (firstSong == 0) then
        printf("CASTING FIRST MELEE SONG!!!!!!")

        for i = 1, #first do
            if (songCombo == first[i][1] and lvl >= first[i][2]) then
                song = first[i][3]
                break
            end
        end


        mob:castSpell(song, mob)
        mob:setLocalVar("firstSong",1)
        mob:setLocalVar("singTime",battletime)
        mob:setLocalVar("singCheck",10)
    elseif (secondSong == 0) then
        printf("CASTING SECOND MELEE SONG!!!!")

        for i = 1, #second do
            if (songCombo == second[i][1] and lvl >= second[i][2]) then
                song = second[i][3]
                break
            end
        end
        mob:castSpell(song, mob)
        mob:setLocalVar("secondSong",0)
        mob:setLocalVar("firstSong",0)
        mob:setLocalVar("singTime",battletime)
        mob:setLocalVar("singCheck",60)
        mob:setLocalVar("singMage",1)
        mob:setLocalVar("mageSongs",battletime)
    end

end

function doMageSongs(mob)
    local firstSong = mob:getLocalVar("firstSong")
    local secondSong = mob:getLocalVar("secondSong")
    local battletime = os.time()
    local lvl = mob:getMainLvl()
    local song = 0

    -- {Combo, Level, SpellID}
    local first = {{55, 387},{25,386}}

    local second = {{55,386}}


    if (firstSong == 0) then
        printf("CASTING FIRST MAGE SONG!!!!!!")

        for i = 1, #first do
            if (lvl >= first[i][1]) then
                printf("Found Ballad")
                song = first[i][2]
                break
            end
        end


        mob:castSpell(song, mob)
        mob:setLocalVar("firstSong",1)
        mob:setLocalVar("songCombo",0)
        mob:setLocalVar("singTime",battletime)
        mob:setLocalVar("mageSongs",battletime)
    elseif (secondSong == 0) then
        printf("CASTING SECOND MAGE SONG!!!!")

        for i = 1, #second do
            if (lvl >= second[i][1]) then
                song = second[i][2]
                break
            end
        end
        mob:castSpell(song, mob)
        mob:setLocalVar("secondSong",0)
        mob:setLocalVar("firstSong",0)
        mob:setLocalVar("singTime",battletime)
        mob:setLocalVar("singCheck",660)
        -- mob:setLocalVar("singMage",1)
        mob:setLocalVar("mageSongs",battletime)
        mob:setLocalVar("songCombo",0)
        mob:setLocalVar("singMage",2)
        mob:setLocalVar("songCheck",110)
    end

end

function doEnfeebs(mob,target)
    local battletime = os.time()
    local lvl = mob:getMainLvl()

    local requiem = {{67,373},{57,372},{47,371},{37,370},{27,369},{17,368},{7,367}}
    local elegy = {{59,422},{39,421}}
    local enemyBuffs = {80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99}
    local finaleTime = mob:getLocalVar("finaleTime")
    local finaleRecast = mob:getLocalVar("finaleRecast")
    local requiemTime = mob:getLocalVar("requiemTime")
    local requiemRecast = mob:getLocalVar("requiemRecast")
    local song = 0

    if (battletime > requiemTime + requiemRecast) then
            printf("Try Enfeebs")
        for i = 1, #requiem do
            if (lvl >= requiem[i][1]) then
                song = requiem[i][2]
                print(song)
                break
            end
        end
        mob:castSpell(song, target)
        mob:setLocalVar("requiemTime",battletime)
    end



    if ((battletime > finaleTime + finaleRecast) and lvl >= 33) then
        for i = 1, #enemyBuffs do
            if (target:hasStatusEffect(enemyBuffs[i])) then
                song = 462
                break
            end
        end
        mob:castSpell(song, target)
        mob:setLocalVar("finaleTime",battletime)
    end







end