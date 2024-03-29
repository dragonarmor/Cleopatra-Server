---------------------------------------------------
-- Ranged Attack
-- Deals a ranged attack to a single target.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/trust_utils")

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
        local basemod = 1
        local numhits = 3
        local attmod = 1
        local accmod = 1
        local str_wsc = 0
        local dex_wsc = 0
        local agi_wsc = 1
        local vit_wsc = 0
        local mnd_wsc = 0

        local info = TrustPhysicalMove(mob,target,skill,basemod,numhits,attmod,accmod,str_wsc,dex_wsc,agi_wsc,vit_wsc,mnd_wsc,TP_DMG_VARIES,1.0,1.2,1.5);

        if (mob: getID() == 17097391) then
            basemod = 0.9
            info = TrustPhysicalMove(mob,target,skill,basemod,numhits,attmod,accmod,str_wsc,dex_wsc,agi_wsc,vit_wsc,mnd_wsc,TP_DMG_VARIES,1.3,1.3,1.3);
        end


        local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.SLASHING,info.hitslanded)

        target:delHP(dmg);
        return dmg;
end
