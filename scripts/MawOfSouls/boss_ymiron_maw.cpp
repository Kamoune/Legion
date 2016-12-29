/*
* Copyright (C) 2016 FreedomCore <http://freedomcore.ru/>
*
* This program is free software; you can redistribute it and/or modify it
* under the terms of the GNU General Public License as published by the
* Free Software Foundation; either version 2 of the License, or (at your
* option) any later version.
*
* This program is distributed in the hope that it will be useful, but WITHOUT
* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
* more details.
*
* You should have received a copy of the GNU General Public License along
* with this program. If not, see <http://www.gnu.org/licenses/>.
*/

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "PassiveAI.h"
#include "Spell.h"
#include "SpellInfo.h"
#include "SpellScript.h"
#include "SpellAuraEffects.h"
#include "maw_of_souls.h"

enum Spells {
	SPELL_BANE = 193460,
	SPELL_SLASH = 193211,
	SPELL_SCREAMS = 193364,
	SPELL_SIPHON = 194665,
	SPELL_BLOOD = 213738,
	SPELL_WINDS = 193977,
	SPELL_FALLEN = 193566,
	SPELL_BANE_NOVA = 200194
};

enum Auras {
	AURA_BANE = 193510
};

enum Yells {
	YELL_PRE_ENCOUNTER = 0,
	YELL_ENTER_COMBAT = 1,
	YELL_BANE = 2,
	YELL_FALLEN = 3,
	YELL_SCREAMS = 4,
	YELL_WINDS = 5,
	YELL_KILL = 6,
	YELL_KILLED = 7
};


enum Phases {
	PHASE_ROLEPLAY = 1,
	PHASE_FIGHT = 2
};

enum Events {
	EVENT_SLASH = 1,
	EVENT_SCREAMS = 2,
	EVENT_WINDS = 3,
	EVENT_BANE = 4,
	EVENT_FALLEN = 5
};

enum Misc {
	DATA_VIGOR_STACK = 203816,
	DATA_INSTANT_KARMA = 10413,
	NPC_FALLEN_WARRIOR = 98246,
	NPC_BANE_SPHERE = 97099
};

class boss_ymiron_maw : public CreatureScript {
public:
	boss_ymiron_maw() : CreatureScript("boss_ymiron_maw") {}

	struct boss_ymiron_mawAI : public BossAI {

		bool isHeroic = false;
		bool isMythic = false;
		std::vector<TempSummon*> baneSpheres;
		std::vector<TempSummon*> risenWarriors;

		boss_ymiron_mawAI(Creature* creature) : BossAI(creature, DATA_YMIRON_MAW) {
			Initialize();
		}

		void DifficultyModifier() {
			Difficulty instanceDifficulty = instance->instance->GetDifficultyID();
			uint64 myHealth = me->GetHealth();
			double healthModifier;
			double damageModifier;

			if(instanceDifficulty == DIFFICULTY_NORMAL) {
				healthModifier = 1.0;
				damageModifier = 1.0;
			} else if(instanceDifficulty == DIFFICULTY_HEROIC) {
				healthModifier = 1.0571428043; // HealthModifier 36.99
				damageModifier = 1.39285714286;
				isHeroic = true;
			} else if(instanceDifficulty == DIFFICULTY_MYTHIC) {
				healthModifier = 1.32142855675; // HealthModifier 46.25
				damageModifier = 1.95;
				isMythic = true;
			} else {
				healthModifier = 20;
				damageModifier = 20;
			}
			uint64 difficultyAdjustedHealth = static_cast<unsigned long long>(myHealth * healthModifier);
			me->SetMaxHealth(difficultyAdjustedHealth);
			me->SetHealth(difficultyAdjustedHealth);
			me->SetModifierValue(UNIT_MOD_DAMAGE_MAINHAND, BASE_VALUE, static_cast<float>(damageModifier));
		}

		void Initialize() {
			DifficultyModifier();
			events.ScheduleEvent(EVENT_SLASH, 3.5 * IN_MILLISECONDS);
			events.ScheduleEvent(EVENT_SCREAMS, 5.9 * IN_MILLISECONDS);
			events.ScheduleEvent(EVENT_WINDS, 15 * IN_MILLISECONDS);
			events.ScheduleEvent(EVENT_BANE, 21 * IN_MILLISECONDS);
			if(isHeroic || isMythic) {
				events.ScheduleEvent(EVENT_FALLEN, 39 * IN_MILLISECONDS);
			}
		}

		void Reset() override {
			BossAI::Reset();
			instance->SetBossState(DATA_YMIRON_MAW, FAIL);
			DespawnCreatures();
			Initialize();
		}

		void DespawnCreatures() {
			for(int s = 0; s < baneSpheres.size(); s++) {
				if(baneSpheres.at(s)->IsAlive()) {
					baneSpheres.at(s)->DespawnOrUnsummon();
				}
			}
			for(int w = 0; w < risenWarriors.size(); w++) {
				if(risenWarriors.at(w)->IsAlive()) {
					risenWarriors.at(w)->DespawnOrUnsummon();
				}
			}
			baneSpheres.clear();
			risenWarriors.clear();
		}

		void EnterEvadeMode(EvadeReason /*why*/) override {
			instance->SetBossState(DATA_YMIRON_MAW, FAIL);
			DespawnCreatures();
			me->DespawnOrUnsummon();
			me->SetCorpseDelay(5);
			me->SetRespawnDelay(10);
			me->RemoveAllAuras();
			me->CombatStop();
			events.Reset();
			Initialize();
		}

		void JustDied(Unit* /* killer */) override {
			_JustDied();
			DespawnCreatures();
			instance->SetBossState(DATA_YMIRON_MAW, DONE);
			Talk(YELL_KILLED);
		}

		void KilledUnit(Unit* victim) override {
			if(victim->GetTypeId() == TYPEID_PLAYER)
				Talk(YELL_KILL);
		}

		void EnterCombat(Unit* victim) override {
			BossAI::EnterCombat(victim);
			instance->SetBossState(DATA_YMIRON_MAW, IN_PROGRESS);
			Talk(YELL_ENTER_COMBAT);
			DoZoneInCombat();
		}

		float RandomFloat(float a, float b) {
			float random = ((float) rand()) / (float) RAND_MAX;
			float diff = b - a;
			float r = random * diff;
			return a + r;
		}

		void MoveInLineOfSight(Unit* who) override {
			if(who->GetTypeId() == TYPEID_PLAYER && me->GetDistance2d(who) < 85.0f && !me->IsInCombat()) {
				//Talk(YELL_PRE_ENCOUNTER);
				// Should start the event here
			}
		}

		void UpdateAI(uint32 diff) override {

			if(!UpdateVictim())
				return;

			events.Update(diff);

			if(me->HasUnitState(UNIT_STATE_CASTING))
				return;

			while(uint32 eventID = events.ExecuteEvent()) {
				switch(eventID) {

				case EVENT_SLASH:
					DoCastVictim(SPELL_SLASH);
					events.ScheduleEvent(EVENT_SLASH, 14.6 * IN_MILLISECONDS);
					break;

				case EVENT_SCREAMS:
					DoCastVictim(SPELL_SCREAMS);
					Talk(YELL_SCREAMS);
					events.ScheduleEvent(EVENT_SCREAMS, 23 * IN_MILLISECONDS);
					break;

				case EVENT_WINDS:
					DoCastVictim(SPELL_WINDS);
					Talk(YELL_WINDS);
					events.ScheduleEvent(EVENT_WINDS, 24 * IN_MILLISECONDS);
					break;

				case EVENT_BANE:
					DoCastVictim(SPELL_BANE);
					Talk(YELL_BANE);
					events.ScheduleEvent(EVENT_BANE, 49.5 * IN_MILLISECONDS);
					for(int i = 0; i < 14; i++) {
						baneSpheres.push_back(me->SummonCreature(NPC_BANE_SPHERE, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 2.0f, TEMPSUMMON_DEAD_DESPAWN));
					}

					if(isHeroic || isMythic) {
						events.ScheduleEvent(EVENT_FALLEN, 67.4 * IN_MILLISECONDS);
					}
					break;

				case EVENT_FALLEN:
					DoCastVictim(SPELL_FALLEN);
					for(int i = 0; i != baneSpheres.size(); i++) {
						if(baneSpheres.at(i)->IsAlive()) {
							if(Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100.0f, true)) {
								Position playerPosition = target->GetPosition();
								risenWarriors.push_back(me->SummonCreature(NPC_FALLEN_WARRIOR, playerPosition.m_positionX + RandomFloat(-2.0f, 2.0f), playerPosition.m_positionY + RandomFloat(-2.0f, 2.0f), playerPosition.m_positionZ, 2.0f, TEMPSUMMON_DEAD_DESPAWN));
							}
							baneSpheres.at(i)->DespawnOrUnsummon();
						}
						baneSpheres.erase(baneSpheres.begin() + i);
					}
					baneSpheres.clear();
					Talk(YELL_FALLEN);
					break;

				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}
	};

private:
	CreatureAI* GetAI(Creature* creature) const override {
		return GetMawOfSoulsAI<boss_ymiron_mawAI>(creature);
	}
};

// TEMP NPC 97099
class npc_bane_sphere : public CreatureScript {
	public:
		npc_bane_sphere() : CreatureScript("npc_bane_sphere") { }
		
		struct npc_bane_sphereAI : public PassiveAI {
			npc_bane_sphereAI(Creature* creature) : PassiveAI(creature) { 
				Creature* boss = me->FindNearestCreature(NPC_YMIRON_MAW, 100.0f);
				me->setFaction(84);
				//me->AddAura(AURA_BANE, me);
				me->SetSpeed(MOVE_RUN, 15.0f);
				me->GetMotionMaster()->MoveCirclePath(boss->GetPositionX() + RandomFloat(-10.0f, 10.0f), boss->GetPositionY() + RandomFloat(-10.0f, 10.0f), boss->GetPositionZ(), RandomFloat(12.0f, 18.0f), true, 16);
			}

			void Reset() override { }

			void UpdateAI(uint32 /*diff*/) override { }

			void MoveInLineOfSight(Unit* who) override {
				if(who->GetTypeId() == TYPEID_PLAYER && me->GetDistance2d(who) < 2.3f) {
					DoCast(SPELL_BANE_NOVA);
					me->DespawnOrUnsummon();
				}
			}

			float RandomFloat(float a, float b) {
				float random = ((float) rand()) / (float) RAND_MAX;
				float diff = b - a;
				float r = random * diff;
				return a + r;
			}
		};


		CreatureAI* GetAI(Creature* creature) const override {
			return GetMawOfSoulsAI<npc_bane_sphereAI>(creature);
		}
};


// NPC 98246
class npc_bane_skeleton : public CreatureScript {

public:
	npc_bane_skeleton() : CreatureScript("npc_bane_skeleton") { }

	struct npc_bane_skeletonAI : public ScriptedAI {

		uint32 vigorTimer;

		npc_bane_skeletonAI(Creature* creature) : ScriptedAI(creature) {
			DoCast(me, DATA_VIGOR_STACK);
			vigorTimer = 6 * IN_MILLISECONDS; // Stack Every 6 Seconds
		}

		void UpdateAI(uint32 diff) override {
			if(!UpdateVictim())
				return;

			if(vigorTimer <= diff) {
				DoCast(me, DATA_VIGOR_STACK);
				vigorTimer = 6 * IN_MILLISECONDS;
			} else vigorTimer -= diff;


			DoMeleeAttackIfReady();
		}

	};

	CreatureAI* GetAI(Creature* creature) const override {
		return GetMawOfSoulsAI<npc_bane_skeletonAI>(creature);
	}
};


class achievement_instant_karma : public AchievementCriteriaScript {
public:
	achievement_instant_karma() : AchievementCriteriaScript("achievement_instant_karma") {}

};

void AddSC_boss_ymiron_maw() {
	new boss_ymiron_maw();
	new npc_bane_skeleton();
	new npc_bane_sphere();
	//new achievement_instant_karma();
}