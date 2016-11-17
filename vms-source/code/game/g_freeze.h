

qboolean is_spectator( gclient_t *client );
qboolean Set_spectator( gentity_t *ent );
qboolean Set_Client( gentity_t *ent );
void respawnSpectator( gentity_t *ent );
void Persistant_spectator( gentity_t *ent, gclient_t *cl );
void Body_free( gentity_t *self );
qboolean DamageBody( gentity_t *targ, gentity_t *attacker, vec3_t dir, int mod, int knockback );
qboolean is_body( gentity_t *ent );
qboolean is_body_freeze( gentity_t *ent );
void player_freeze( gentity_t *self, gentity_t *attacker, int mod );
qboolean readyCheck( void );
void team_wins( int team );
void CheckDelay( void );
void locationSpawn( gentity_t *ent, gitem_t *item );
void Hook_Fire( gentity_t *ent );
void Cmd_Drop_f( gentity_t *ent );
void Cmd_Ready_f( gentity_t *ent );
void voteInvalid( gentity_t *ent );
qboolean voteCheck( void );
qboolean WeaponDisabled( gitem_t *item );
void RegisterWeapon( void );
void SpawnWeapon( gclient_t *client );
int InvulnerabilityEffect( gentity_t *targ, vec3_t dir, vec3_t point, vec3_t impactpoint, vec3_t bouncedir );
