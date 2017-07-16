// 2017 Trepidation Licensed under the GPL2 - Team Trepidation / N5 Networks
//

/*****************************************************************************
 * name:		ai_team.h
 *
 * desc:		Quake3 bot AI
 *
 * $Archive: /source/code/botai/ai_chat.c $
 *
 *****************************************************************************/

void BotTeamAI(bot_state_t *bs);
int BotGetTeamMateTaskPreference(bot_state_t *bs, int teammate);
void BotSetTeamMateTaskPreference(bot_state_t *bs, int teammate, int preference);
void BotVoiceChat(bot_state_t *bs, int toclient, char *voicechat);
void BotVoiceChatOnly(bot_state_t *bs, int toclient, char *voicechat);


