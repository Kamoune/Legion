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
#include "maw_of_souls.h"

enum Spells {

};

enum Yells {
	YELL_ENTER_COMBAT = 1
};

enum Events {

};


class boss_harbaron_maw : public CreatureScript {
public:
	boss_harbaron_maw() : CreatureScript("boss_harbaron_maw") {}

	struct boss_harbaron_mawAI : public BossAI {
		boss_harbaron_mawAI(Creature* creature) : BossAI(creature, DATA_HARBARON_MAW) {
			Initialize();
		}

		void Initialize() {

		}

		void Reset() override {
			Initialize();
			_Reset();
		}

		void EnterCombat(Unit* /*who*/) override {
			_EnterCombat();
			Talk(YELL_ENTER_COMBAT);
		}


		void JustDied(Unit* /*killer*/) override {
			_JustDied();
		}

		void UpdateAI(uint32 diff) override {

			if(!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}
	};

private:
	CreatureAI* GetAI(Creature* creature) const override {
		return GetMawOfSoulsAI<boss_harbaron_mawAI>(creature);
	}
};

void AddSC_boss_harbaron_maw() {
	new boss_harbaron_maw();
}