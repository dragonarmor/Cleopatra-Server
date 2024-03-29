/*
===========================================================================

Copyright (c) 2010-2015 Darkstar Dev Teams

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see http://www.gnu.org/licenses/

This file is part of DarkStar-server source code.

===========================================================================
*/

#include "mobskill_state.h"
#include "../ai_container.h"
#include "../../entities/mobentity.h"
#include "../../packets/action.h"
#include "../../utils/battleutils.h"
#include "../../mobskill.h"
#include "../../status_effect_container.h"

CMobSkillState::CMobSkillState(CMobEntity* PEntity, uint16 targid, uint16 wsid) :
    CState(PEntity, targid),
    m_PEntity(PEntity)
{
    auto skill = battleutils::GetMobSkill(wsid);
    if (!skill)
    {
        throw CStateInitException(nullptr);
    }

    if (m_PEntity->StatusEffectContainer->HasStatusEffect({EFFECT_AMNESIA, EFFECT_IMPAIRMENT}))
    {
        throw CStateInitException(nullptr);
    }

    auto PTarget = m_PEntity->IsValidTarget(m_targid, skill->getValidTargets(), m_errorMsg);

    if (!PTarget || m_errorMsg)
    {
        throw CStateInitException(std::move(m_errorMsg));
    }

    m_PSkill = std::make_unique<CMobSkill>(*skill);

    m_castTime = std::chrono::milliseconds(m_PSkill->getActivationTime());

    if (m_castTime > 0s)
    {
        action_t action;
        action.id = m_PEntity->id;
        action.actiontype = ACTION_MOBABILITY_START;

        actionList_t& actionList = action.getNewActionList();
        actionList.ActionTargetID = PTarget->id;

        actionTarget_t& actionTarget = actionList.getNewActionTarget();

        actionTarget.reaction = REACTION_NONE;
        actionTarget.speceffect = SPECEFFECT_NONE;
        actionTarget.animation = 0;
        actionTarget.param = m_PSkill->getID();
        actionTarget.messageID = 43;
        m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE, new CActionPacket(action));
    }
    m_PEntity->PAI->EventHandler.triggerListener("WEAPONSKILL_STATE_ENTER", m_PEntity, m_PSkill->getID());
    SpendCost();
}

CMobSkill* CMobSkillState::GetSkill()
{
    return m_PSkill.get();
}

void CMobSkillState::SpendCost()
{
    if (m_PSkill->isTpSkill())
    {
        if (m_PEntity->objtype == TYPE_TRUST)
        {
            if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_SEKKANOKI))
            {
                m_PEntity->addTP(-1000);
                m_PEntity->StatusEffectContainer->DelStatusEffect(EFFECT_SEKKANOKI);
            }
            else
            {

                int16 delay = m_PEntity->GetWeaponDelay(false) / 10;
                delay = delay - 160;
                int16 baseTP = 0;
                int16 x = 1;
                //ShowWarning("Base Delay is %u \n",delay);
                if (delay <= 180) {
                    x = (int16)(61 + ((delay - 180) * 63.f) / 360);
                    ShowWarning("This is tp 180 %u \n",x);
                }
                    else if (delay <= 540) {
                    x = (int16)(61 + ((delay - 180) * 88.f) / 360);
                    //ShowWarning("This is tp 540 %u \n",x);
                }
                else if (delay <= 630) {
                    x = (int16)(149 + ((delay - 540) * 20.f) / 360);
                    //ShowWarning("This is tp 630 %u \n",x);
                }
                else if (delay <= 720) {
                    x = (int16)(154 + ((delay - 630) * 28.f) / 360);
                    //ShowWarning("This is tp 720 %u \n",x);
                }
                else if (delay <= 900) {
                    x = (int16)(161 + ((delay - 720) * 24.f) / 360);
                    //ShowWarning("This is tp 900 %u \n",x);
                }
                else {
                    x = (int16)(173 + ((delay - 900) * 28.f) / 360);
                    //ShowWarning("This is tp other %u \n",x);
                }

                float ratio = 1.0f;
                //TODO add MNK calc
                //baseTP = x * ((int16)(delay * 60.0f / 1000.0f / ratio));
                m_spentTP = m_PEntity->health.tp;


                m_PEntity->health.tp = x;
                m_PEntity->UpdateHealth();
            }
        }
        else
        {
            m_spentTP = m_PEntity->health.tp;
            m_PEntity->health.tp = 0;
        }
    }
}

bool CMobSkillState::Update(time_point tick)
{
    if (tick > GetEntryTime() + m_castTime && !IsCompleted())
    {
        action_t action;
        m_PEntity->OnMobSkillFinished(*this, action);
        m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CActionPacket(action));
        auto delay = std::chrono::milliseconds(m_PSkill->getAnimationTime());
        m_finishTime = tick + delay;
        Complete();
    }
    if (IsCompleted() && tick > m_finishTime)
    {
        m_PEntity->PAI->EventHandler.triggerListener("WEAPONSKILL_STATE_EXIT", m_PEntity, m_PSkill->getID());
        return true;
    }
    return false;
}

void CMobSkillState::Cleanup(time_point tick)
{
    if (!IsCompleted())
    {
        action_t action;
        action.id = m_PEntity->id;
        action.actiontype = ACTION_MOBABILITY_INTERRUPT;

        actionList_t& actionList = action.getNewActionList();
        actionList.ActionTargetID = m_PEntity->id;

        actionTarget_t& actionTarget = actionList.getNewActionTarget();
        actionTarget.animation = m_PSkill->getID();

        m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE, new CActionPacket(action));
    }
}
