
cd \web\trepdev\trepidation\vms-source\code\game
rem make sure we have a safe environement
set LIBRARY=
set INCLUDE=

mkdir vm
cd vm
set cc=lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\ui %1

%cc%  ../g_main.c
@if errorlevel 1 goto quit

%cc%  ../g_syscalls.c
@if errorlevel 1 goto quit

%cc%  ../bg_misc.c
@if errorlevel 1 goto quit
%cc%  ../bg_lib.c
@if errorlevel 1 goto quit
%cc%  ../bg_pmove.c
@if errorlevel 1 goto quit
%cc%  ../bg_slidemove.c
@if errorlevel 1 goto quit
%cc%  ../q_math.c
@if errorlevel 1 goto quit
%cc%  ../q_shared.c
@if errorlevel 1 goto quit

%cc%  ../ai_dmnet.c
@if errorlevel 1 goto quit
%cc%  ../ai_dmq3.c
@if errorlevel 1 goto quit
%cc%  ../ai_main.c
@if errorlevel 1 goto quit
%cc%  ../ai_chat.c
@if errorlevel 1 goto quit
%cc%  ../ai_cmd.c
@if errorlevel 1 goto quit
%cc%  ../ai_team.c
@if errorlevel 1 goto quit

%cc%  ../g_active.c
@if errorlevel 1 goto quit
%cc%  ../g_arenas.c
@if errorlevel 1 goto quit
%cc%  ../g_bot.c
@if errorlevel 1 goto quit
%cc%  ../g_client.c
@if errorlevel 1 goto quit
%cc%  ../g_cmds.c
@if errorlevel 1 goto quit
%cc%  ../g_combat.c
@if errorlevel 1 goto quit
%cc%  ../g_items.c
@if errorlevel 1 goto quit
%cc%  ../g_mem.c
@if errorlevel 1 goto quit
%cc%  ../g_misc.c
@if errorlevel 1 goto quit
%cc%  ../g_missile.c
@if errorlevel 1 goto quit
%cc%  ../g_mover.c
@if errorlevel 1 goto quit
%cc%  ../g_session.c
@if errorlevel 1 goto quit
%cc%  ../g_spawn.c
@if errorlevel 1 goto quit
%cc%  ../g_svcmds.c
@if errorlevel 1 goto quit
%cc%  ../g_target.c
@if errorlevel 1 goto quit
%cc%  ../g_team.c
@if errorlevel 1 goto quit
%cc%  ../g_trigger.c
@if errorlevel 1 goto quit
%cc%  ../g_utils.c
@if errorlevel 1 goto quit
%cc%  ../g_weapon.c
@if errorlevel 1 goto quit
%cc%  ../ai_vcmd.c
@if errorlevel 1 goto quit
%cc%  ../g_unlagged.c
@if errorlevel 1 goto quit
%cc%  ../g_playerclass.c
@if errorlevel 1 goto quit
%cc%  ../g_buildables.c
@if errorlevel 1 goto quit



q3asm -f ../game
:quit

pause
cd ..
cd \web\trepdev\trepidation\vms-source\code\cgame
rem make sure we have a safe environement
set LIBRARY=
set INCLUDE=

mkdir vm
cd vm
set cc=lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\ui %1

%cc% ../../game/bg_misc.c
@if errorlevel 1 goto quit2
%cc% ../../game/bg_pmove.c
@if errorlevel 1 goto quit2
%cc% ../../game/bg_slidemove.c
@if errorlevel 1 goto quit2
%cc% ../../game/bg_lib.c
@if errorlevel 1 goto quit2
%cc% ../../game/q_math.c
@if errorlevel 1 goto quit2
%cc% ../../game/q_shared.c
@if errorlevel 1 goto quit2
%cc% ../cg_consolecmds.c
@if errorlevel 1 goto quit2
%cc% ../cg_draw.c
@if errorlevel 1 goto quit2
%cc% ../cg_drawtools.c
@if errorlevel 1 goto quit2
%cc% ../cg_effects.c
@if errorlevel 1 goto quit2
%cc% ../cg_ents.c
@if errorlevel 1 goto quit2
%cc% ../cg_event.c
@if errorlevel 1 goto quit2
%cc% ../cg_info.c
@if errorlevel 1 goto quit2
%cc% ../cg_localents.c
@if errorlevel 1 goto quit2
%cc% ../cg_main.c
@if errorlevel 1 goto quit2
%cc% ../cg_marks.c
@if errorlevel 1 goto quit2
%cc% ../cg_players.c
@if errorlevel 1 goto quit2
%cc% ../cg_playerstate.c
@if errorlevel 1 goto quit2
%cc% ../cg_predict.c
@if errorlevel 1 goto quit2
%cc% ../cg_scoreboard.c
@if errorlevel 1 goto quit2
%cc% ../cg_servercmds.c
@if errorlevel 1 goto quit2
%cc% ../cg_snapshot.c
@if errorlevel 1 goto quit2
%cc% ../cg_view.c
@if errorlevel 1 goto quit2
%cc% ../cg_weapons.c
@if errorlevel 1 goto quit2
%cc% ../cg_unlagged.c
@if errorlevel 1 goto quit2
%cc% ../cg_scanner.c
@if errorlevel 1 goto quit2




q3asm -f ../cgame
:quit2

pause
rem make sure we have a safe environement
set LIBRARY=
set INCLUDE=

mkdir vm
cd vm

set cc=lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui %1

lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_main.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_cdkey.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_ingame.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_serverinfo.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_confirm.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_setup.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_offline.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../../game/bg_misc.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../../game/bg_lib.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../../game/q_math.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../../game/q_shared.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_gameinfo.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_atoms.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_connect.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_controls2.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_demo2.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_mfield.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_credits.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_menu.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_options.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_display.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_sound.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_network.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_playermodel.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_players.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_playersettings.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_preferences.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_qmenu.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_servers2.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_sparena.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_specifyserver.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_splevel.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_sppostgame.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_startserver.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_team.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_video.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_cinematics.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_spskill.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_addbots.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_removebots.c
@if errorlevel 1 goto quit3
rem lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_loadconfig.c
rem @if errorlevel 1 goto quit3
rem lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_saveconfig.c
rem @if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_teamorders.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_mods.c
@if errorlevel 1 goto quit3
lcc -DQ3_VM -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\q3_ui ../ui_voip.c
@if errorlevel 1 goto quit3


q3asm -f ../q3_ui
:quit3
cd ..

pause
cd \web\trepdev\trepidation\vms-source\code\ui
rem ui.bat
cd \web\trepdev\trepidation\vms-source\code\q3_ui
rem q3_ui.bat


cd \web\trepdev\trepidation\game-media
copy \quake3\baseq3\vm\*.qvm \web\trepdev\trepidation\game-media\pak0-vms\vm
cd pak0-vms
zip -r \treptest\base\pak0-vms.pk3 *
