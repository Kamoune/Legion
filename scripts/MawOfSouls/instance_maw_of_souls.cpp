/*
* Copyright (C) 2016 FreedomCore <https://freedomcore.ru/>
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
#include "InstanceScript.h"
#include "Player.h"
#include "maw_of_souls.h"

class instance_maw_of_souls : public InstanceMapScript {
	public:
		instance_maw_of_souls() : InstanceMapScript(MawOfSoulsScriptName, 1492) { }

		struct instance_maw_of_souls_InstanceScript : public InstanceScript {
			instance_maw_of_souls_InstanceScript(Map* map) : InstanceScript(map) {
				SetHeaders(DataHeader);
				SetBossNumber(EncounterCount);
				_teamInInstance = 0;
			}

			void OnPlayerEnter(Player* player) override {
				if(!_teamInInstance) {
					_teamInInstance = player->GetTeam();
				}
			}

			void OnCreatureCreate(Creature* creature) override {
				switch(creature->GetEntry()) {
					case NPC_YMIRON_MAW:
						YmironMawGUID = creature->GetGUID();
					break;

					case NPC_HARBARON_MAW:
						HarbaronMawGUID = creature->GetGUID();
					break;

					case NPC_HELYA_MAW:
						HelyaMawGUID = creature->GetGUID();
					break;

					default:
						break;
				}
			}

			void OnGameObjectCreate(GameObject* go) override {
				switch(go->GetEntry()) {

					default:
						break;
				}
			}

			bool SetBossState(uint32 type, EncounterState state) override {
				if(!InstanceScript::SetBossState(type, state)) {
					return false;
				}

				switch (type) {
					case DATA_YMIRON_MAW:
						if(state == DONE) {
							// Add code for horn GO
						}
					break;

					case DATA_HARBARON_MAW:
						if(state == IN_PROGRESS) {
							// Code to close doors
						} else if(state == DONE) {
							// Open doors and remove air walls
						}
					break;

					case DATA_HELYA_MAW:
						if(state == FAIL) {
							// Repair ship
						} else if(state == DONE) {
							// Spawn Loot Chest
						}
					break;
				}

				return true;
			}

			ObjectGuid GetGuidData(uint32 type) const override {
				switch(type) {
					case DATA_YMIRON_MAW:
						return YmironMawGUID;
					case DATA_HARBARON_MAW:
						return HarbaronMawGUID;
					case DATA_HELYA_MAW:
						return HelyaMawGUID;
					default:
						break;
				}
				return ObjectGuid::Empty;
			}

			private:
				uint32 _teamInInstance;
				ObjectGuid YmironMawGUID;
				ObjectGuid HarbaronMawGUID;
				ObjectGuid HelyaMawGUID;
		};

		InstanceScript* GetInstanceScript(InstanceMap* map) const override {
			return new instance_maw_of_souls_InstanceScript(map);
		}
};

void AddSC_instance_maw_of_souls() {
	new instance_maw_of_souls();
}
