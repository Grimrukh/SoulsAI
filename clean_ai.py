from pathlib import Path

from soulstruct import DSR_PATH
from soulstruct.ai.core import decompile_lua
from soulstruct.bnd import BND

AI_COMMON_PATH = DSR_PATH + "/script/aiCommon.luabnd.dcx"

AI_COMMON_LIST = [
    "ai_define.lua",
    "combo_attack_success_angle180",
    "combo_repeat_success_angle180",
    "common_battle_func",
    "common_func",
    "common_func2",
    "common_logic_func",
    "event_list",
    "gaurd_break_attack",
    "gaurd_break_tunable",
    "goal_list",
    "goal_list_dlc",
    "keep_dist_yaxis",
    "logic_list",
    "nonspinning_attack",
    "npc_subgoals",
    "obj_act",
    "specialTurn",
    "top_goal",  # known decompile error
    "turnaround",
]


if __name__ == '__main__':
    aiCommon = BND(AI_COMMON_PATH)
    for entry in AI_COMMON_LIST:
        try:
            compiled_lua = aiCommon.entries_by_basename[entry + '.lua']
        except KeyError:
            print(f"Could not find {entry} in aiCommon.luabnd.dcx")
            continue
        try:
            output_path = Path(f"ai_scripts/aiCommon_Funcs/{entry}.lua").resolve()
            decompile_lua(compiled_lua.data, script_name=entry + ".lua", output_path=output_path)
        except Exception as e:
            import traceback
            traceback.print_exc()
            continue
