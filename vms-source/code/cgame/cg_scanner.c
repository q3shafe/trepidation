#include "cg_local.h"

#define kSCANNER_UNIT 24
#define kSCANNER_RANGE 100
    
/*
=================
CG_DrawScanner
=================
*/
void CG_DrawScanner( void ) 
{
        int x,y;
        int w,h;
        int sx,sy;
        vec3_t v, norm, dp;
        float len;
        float height;
        playerpos_t *player;
        centity_t *scanner;

        //dont draw anything if the scanner is off
        if(cg.scanner == 0)
            return;

        w = 100; //width of scanner on screen
        h = w; //height of scanner on screen
        x = 5; //(SCREEN_WIDTH - w) - 48; //offset from left of screen
        y = (SCREEN_HEIGHT - h) - 80; //offset from top of scren


        //draw the scanner
        CG_DrawPic( x, y, w, h, cgs.media.scannerShader);

        //get info about the scanner positon
        scanner = &cg_entities[cg.snap->ps.clientNum];

        //check the stored player positions
        player = cg_playerOrigins;
        while(player->valid != kENTRY_EOL)
        {
            //get a vector from the scanner position to the current player
            VectorSubtract (scanner->lerpOrigin, player->pos, v);

            //store the height component
            height = v[2];

            //remove the height component from the vector
            v[2] = 0;

            //calc the distance to the player and scale it to the scanner scale
            len = VectorLength( v ) / kSCANNER_UNIT;

            //is the player within range?
            if(len < kSCANNER_RANGE)
            {
                //create a vector pointing stright down
                norm[0] = 0;
                norm[1] = 0;
                norm[2] = -1;

                //normalise the vector to the player
                VectorNormalize( v );

                //rotate the player about the scanners view angle
                RotatePointAroundVector( dp, norm, v, scanner->lerpAngles[1]);

                //scale to fit current size of scanner
                VectorScale(dp,len*(w/2)/kSCANNER_RANGE,dp);

                // calc screen (x,y) (-4 = half dot width, so we can centre the graphic)
                sx = (x + (w/2) + dp[1]) - 4;
                sy = (y + (h/2) + dp[0]) - 4;

                //draw the dot
                if (height < -32) //player is above scanner
                    CG_DrawPic( sx, sy, 8, 8, cgs.media.scannerBlipUpShader);
                else if (height > 32) //player is below scanner
                    CG_DrawPic( sx, sy, 8, 8, cgs.media.scannerBlipDownShader);
                else
                    CG_DrawPic( sx, sy, 8, 8, cgs.media.scannerBlipShader);
            }
            
            //move on to next entry in the array
            player++;
        }
   
}


