.model small
.stack
.data
     
    line1_game db "MAHARLIKA", "$"
    line2_game db "ASCENDANCE", "$"
    line5_game db "Score:" ,"$"
    blank_game db "   " ,"$"
     
    line1_over db "Game Over...", "$"
    line2_over db "Score: ", "$"
    line3_over db "Press 'R' to return to menu", "$"
    line4_over db "High Score: ", "$"
    .highscore  dw 0
     
    line1_menu db "MAHARLIKA ASCENDANCE", "$"    
    line3_menu db "[s] Start playing", "$"
    line4_menu db "[t] Tutorial", "$"
    tempscore db 0, 0, 0
     
    line1_pg1 db "Use 'wasd' to move", "$"       
    line2_pg1 db "your character!", "$"          
    line1_pg2 db "Gain score", "$"               
    line2_pg2 db "by staying alive!", "$"        
    line1_pg3 db "Watch out for obstacles", "$"  
    line2_pg3 db "and falling icicles!", "$"     
    line1_pg4 db "Obstacles increase", "$"       
    line2_pg4 db "as you score!", "$"            
    line1_pg5 db "1 points", "$"  
    line2_pg5 db "2 points", "$"  
    line3_pg5 db "5 points", "$"  
    line4_pg5 db "Keep an eye for coins", "$"  
    line5_pg5 db "to gain more points!", "$"  
    line3_tutorial db "[e] menu", "$"            

     
    current_tick db 00h
    y_toplimit dw 18h
    y_bottomlimit dw 0098h
    y_velocity dw 8              
    game_state dw 0          
    randomNum db 01h
    rngseed dw 00h
    score_ones db 0
    score_tens db 0
    score_hund db 0
    score_rate db 1
    score_overallhex dw 0
    rendercoordX dw 0
    rendercoordY dw 0
    _rendersizeX dw 0
    _rendersizeY dw 0
    prevtime db 0
    allowscore db 0              
    delaytime db 0
    tempmsecond db 0
    _stringx db 0
    _stringy db 0
    _stringcolor db 0
    _stringlength dw 0
    tutorial_page db 1
    current_seconds db 0
    menu_page db 1 

    last_roll1 db 0
    last_roll2 db 0
     
    char_size dw 0fh
    char_x dw 0087h
    char_y dw 0098h
    char_velocity dw 0008h
    char_xfixedpos dw 1        

     
    enemy_x dw 202
    enemy_y dw 9
    enemy_state db 0            
    enemy_interval db 10
    icicle_state db 0           
    iciclex dw ?
    icicley dw 8
    icicle_velocity dw 4

     
    coinx dw 0
    coiny dw 0
    coinsize dw 8
    tempcoinx dw 0
    coin_state dw 0                  
    coin_value dw 1
    coin_interval db 0

     
    menutowerx dw 215
    menutowery_seg1 dw 103, 135, 167
    menutowery_seg2 dw 119, 151, 183
    menutowerchesty dw 79
    towery dw 17, 33, 49, 65, 81, 97, 113, 129, 145, 162, 178
    towerx dw 151

     
    obs_xpos dw 183, 183, 183, 183, 183                  
    obs_ypos dw 23, 55, 87, 119, 151                     
    obsfixedxpos_state dw 0                              
    obs_isactive dw 1, 0, 0, 0, 0                        
    .obs_activetemp dw 0, 0, 0, 0, 0

     

    coin db 00h, 00h, 0Eh, 0Eh, 0Eh, 0Eh, 00h, 00h, 00h      ; coin drawing
         db 00h, 0Eh, 0Eh, 2Ah, 2Ah, 0Eh, 0Eh, 00h, 00h
         db 0Eh, 0Eh, 2Ah, 0Eh, 0Eh, 2Ah, 0Eh, 0Eh, 00h
         db 0Eh, 2Ah, 0Eh, 0Eh, 0Eh, 0Eh, 2Ah, 0Eh, 00h
         db 0Eh, 2Ah, 0Eh, 0Eh, 0Eh, 0Eh, 2Ah, 0Eh, 00h
         db 0Eh, 0Eh, 2Ah, 0Eh, 0Eh, 2Ah, 0Eh, 0Eh, 00h
         db 00h, 0Eh, 0Eh, 2Ah, 2Ah, 0Eh, 0Eh, 00h, 00h
         db 00h, 00h, 0Eh, 0Eh, 0Eh, 0Eh, 00h, 00h, 00h
         db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

    coinsilver  db 00h, 00h, 1Ah, 1Ah, 1Ah, 1Ah, 00h, 00h, 00h   ; silver coin drawing
                db 00h, 1Ah, 1Ah, 17h, 17h, 1Ah, 1Ah, 00h, 00h
                db 1Ah, 1Ah, 17h, 1Ah, 1Ah, 17h, 1Ah, 1Ah, 00h
                db 1Ah, 17h, 1Ah, 1Ah, 1Ah, 1Ah, 17h, 1Ah, 00h
                db 1Ah, 17h, 1Ah, 1Ah, 1Ah, 1Ah, 17h, 1Ah, 00h
                db 1Ah, 1Ah, 17h, 1Ah, 1Ah, 17h, 1Ah, 1Ah, 00h
                db 00h, 1Ah, 1Ah, 17h, 17h, 1Ah, 1Ah, 00h, 00h
                db 00h, 00h, 1Ah, 1Ah, 1Ah, 1Ah, 00h, 00h, 00h
                db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

    coinruby db 00h, 00h, 28h, 28h, 28h, 28h, 00h, 00h, 00h  ; ruby coin drawing
             db 00h, 28h, 28h, 04h, 04h, 28h, 28h, 00h, 00h
             db 28h, 28h, 04h, 28h, 28h, 04h, 28h, 28h, 00h
             db 28h, 04h, 28h, 28h, 28h, 28h, 04h, 28h, 00h
             db 28h, 04h, 28h, 28h, 28h, 28h, 04h, 28h, 00h
             db 28h, 28h, 04h, 28h, 28h, 04h, 28h, 28h, 00h
             db 00h, 28h, 28h, 04h, 04h, 28h, 28h, 00h, 00h
             db 00h, 00h, 28h, 28h, 28h, 28h, 00h, 00h, 00h
             db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

    icicle  db 36h, 36h, 36h, 36h, 36h, 36h, 36h, 36h, 36h, 00h     ; icicle drawing
            db 36h, 36h, 36h, 36h, 36h, 36h, 36h, 36h, 36h, 00h
            db 00h, 36h, 36h, 36h, 36h, 36h, 36h, 36h, 00h, 00h
            db 00h, 36h, 36h, 36h, 36h, 36h, 36h, 36h, 00h, 00h
            db 00h, 00h, 36h, 36h, 36h, 36h, 36h, 00h, 00h, 00h
            db 00h, 00h, 36h, 36h, 36h, 36h, 36h, 00h, 00h, 00h
            db 00h, 00h, 36h, 36h, 36h, 36h, 36h, 00h, 00h, 00h
            db 00h, 00h, 36h, 36h, 36h, 36h, 00h, 00h, 00h, 00h
            db 00h, 00h, 00h, 36h, 36h, 36h, 00h, 00h, 00h, 00h
            db 00h, 00h, 00h, 36h, 36h, 36h, 00h, 00h, 00h, 00h
            db 00h, 00h, 00h, 36h, 36h, 00h, 00h, 00h, 00h, 00h
            db 00h, 00h, 00h, 00h, 36h, 00h, 00h, 00h, 00h, 00h
            db 00h, 00h, 00h, 00h, 36h, 00h, 00h, 00h, 00h, 00h
            db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
            db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    
    Player_up  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h       
               db 00h, 00h, 00h, 2Fh, 00h, 2Fh, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 00h, 00h, 2Fh, 00h
               db 00h, 00h, 2Fh, 2Fh, 00h, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 00h, 2Fh, 00h
               db 00h, 00h, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 00h, 00h
               db 00h, 00h, 2Fh, 2Fh, 00h, 00h, 00h, 00h, 2Fh, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 00h, 00h
               db 00h, 00h, 2Fh, 2Fh, 00h, 00h, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 00h, 00h, 00h
               db 00h, 00h, 2Fh, 2Fh, 00h, 00h, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 00h
               db 00h, 00h, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 00h, 00h, 00h, 00h, 00h
               db 00h, 00h, 2Fh, 2Fh, 00h, 00h, 00h, 00h, 00h, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 00h
               db 00h, 00h, 2Fh, 2Fh, 00h, 00h, 2Fh, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 00h
               db 00h, 2Fh, 00h, 00h, 2Fh, 00h, 2Fh, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 00h, 00h, 2Fh, 00h
               db 00h, 00h, 2Fh, 2Fh, 00h, 00h, 00h, 00h, 00h, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 00h
               db 00h, 00h, 00h, 00h, 2Fh, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 2Fh, 00h, 00h
               db 00h, 00h, 2Fh, 2Fh, 00h, 00h, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 00h, 00h, 00h, 00h
               db 00h, 00h, 00h, 00h, 00h, 2Fh, 2Fh, 00h, 00h, 00h, 00h, 2Fh, 2Fh, 2Fh, 00h, 00h
               db 00h, 00h, 00h, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 00h, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 00h
    
    Player_left     db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h    
                    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 2Fh, 00h, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 2Fh, 00h, 2Fh, 00h, 00h, 00h
                    db 00h, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 2Fh, 00h, 2Fh, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 2Fh, 00h, 2Fh, 00h, 00h, 2Fh, 00h
                    db 00h, 2Fh, 00h, 2Fh, 00h, 00h, 00h, 2Fh, 00h, 00h, 00h, 00h, 00h, 00h, 2Fh, 2Fh, 00h
                    db 00h, 00h, 2Fh, 2Fh, 00h, 00h, 00h, 2Fh, 00h, 2Fh, 2Fh, 00h, 2Fh, 00h, 2Fh, 2Fh, 00h
                    db 00h, 2Fh, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 00h, 2Fh, 00h
                    db 00h, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 00h, 00h, 00h
                    db 00h, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 00h, 00h, 00h, 2Fh, 2Fh, 00h, 00h, 00h
                    db 00h, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 2Fh, 00h, 00h, 00h
                    db 00h, 00h, 2Fh, 00h, 00h, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 00h
                    db 00h, 00h, 00h, 2Fh, 2Fh, 00h, 00h, 00h, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 00h
                    db 00h, 00h, 00h, 2Fh, 2Fh, 00h, 2Fh, 00h, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 00h
                    db 00h, 2Fh, 2Fh, 00h, 00h, 00h, 2Fh, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 00h, 00h, 2Fh, 00h
                    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h


    Player_right    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h    
                    db 00h, 00h, 00h, 00h, 00h, 2Fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 2Fh, 00h, 2Fh, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 00h, 00h
                    db 00h, 00h, 2Fh, 00h, 2Fh, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 00h
                    db 2Fh, 00h, 00h, 2Fh, 00h, 2Fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    db 2Fh, 2Fh, 00h, 00h, 00h, 00h, 00h, 00h, 2Fh, 00h, 00h, 00h, 2Fh, 00h, 2Fh, 00h, 00h
                    db 2Fh, 2Fh, 00h, 2Fh, 00h, 2Fh, 2Fh, 00h, 2Fh, 00h, 00h, 00h, 2Fh, 2Fh, 00h, 00h, 00h
                    db 2Fh, 00h, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 2Fh, 00h, 00h
                    db 00h, 00h, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 00h
                    db 00h, 00h, 2Fh, 2Fh, 00h, 00h, 00h, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 00h
                    db 00h, 00h, 2Fh, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 00h
                    db 2Fh, 2Fh, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 00h, 00h, 2Fh, 00h, 00h, 00h
                    db 2Fh, 2Fh, 00h, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 00h, 00h, 00h, 2Fh, 2Fh, 00h, 00h, 00h, 00h
                    db 2Fh, 2Fh, 00h, 2Fh, 2Fh, 00h, 2Fh, 2Fh, 00h, 2Fh, 00h, 2Fh, 2Fh, 00h, 00h, 00h, 00h
                    db 2Fh, 00h, 00h, 00h, 2Fh, 2Fh, 2Fh, 2Fh, 00h, 2Fh, 00h, 00h, 00h, 2Fh, 2Fh, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

                         
    menutower_topchest  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h       
                        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 2ah, 2ah, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 2ah, 2ah, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 2ah, 2ah, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 2ah, 2ah, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 2ah, 2ah, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 2ah, 2ah, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 2ah, 2ah, 06h, 06h, 0bah, 0bah, 0bah, 0bah, 06h, 06h, 2ah, 2ah, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 2ah, 2ah, 0bah, 0bah, 2ah, 2ah, 2ah, 2ah, 0bah, 0bah, 2ah, 2ah, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                        db 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh , 0fh, 5ch, 5ch, 5ch, 2ah, 0bah, 0bah, 2ah, 5ch, 5ch, 5ch, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h
                        db 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh , 0fh, 2ah, 06h, 06h, 2ah, 0bah, 0bah, 2ah, 06h, 06h, 2ah, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh , 0fh, 0fh, 06h, 06h, 2ah, 2ah, 2ah, 2ah, 06h, 06h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh , 0fh, 0fh, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh , 0fh, 0fh, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh , 0fh, 0fh, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h,  00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh , 0fh, 0fh, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 06h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh , 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh , 0fh, 0fh, 0fh, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh , 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh , 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh , 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh , 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh , 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh , 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh , 0fh, 0fh, 0fh, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h
                        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

                         
    menutower_seg1      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h      
                        db 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h      
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h      
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h      
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h      
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h      
                        db 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h      
                        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                        db 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h      
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h      
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h      
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h      
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h      
                        db 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h
                        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

                         
    menutower_seg2      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h      
                        db 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h
                        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                        db 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h
                        db 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h, 00h, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 0fh, 00h, 00h
                        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

    enemy   db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 20h, 20h, 20h, 20h, 20h, 20h, 00h, 00h, 00h, 00h   
            db 00h, 20h, 00h, 00h, 00h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 00h, 00h 
            db 20h, 20h, 20h, 00h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 00h, 00h, 00h, 00h, 00h, 00h 
            db 00h, 00h, 20h, 00h, 20h, 00h, 00h, 00h, 20h, 20h, 20h, 20h, 00h, 00h, 00h, 00h, 00h 
            db 00h, 20h, 00h, 20h, 00h, 00h, 00h, 00h, 00h, 20h, 20h, 20h, 20h, 00h, 00h, 00h, 00h 
            db 00h, 20h, 00h, 20h, 20h, 00h, 20h, 00h, 00h, 00h, 20h, 20h, 20h, 00h, 00h, 00h, 00h 
            db 00h, 20h, 00h, 20h, 20h, 00h, 20h, 00h, 00h, 00h, 20h, 20h, 20h, 00h, 00h, 00h, 00h 
            db 00h, 00h, 00h, 20h, 00h, 00h, 00h, 00h, 00h, 00h, 20h, 20h, 20h, 00h, 00h, 00h, 00h 
            db 00h, 00h, 00h, 20h, 20h, 00h, 00h, 00h, 00h, 20h, 20h, 20h, 00h, 00h, 00h, 00h, 00h 
            db 00h, 20h, 00h, 00h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 00h, 00h, 00h, 00h, 00h, 00h 
            db 00h, 20h, 00h, 20h, 00h, 20h, 20h, 20h, 20h, 00h, 20h, 20h, 20h, 00h, 00h, 00h, 00h 
            db 00h, 20h, 00h, 20h, 00h, 00h, 00h, 00h, 00h, 20h, 00h, 20h, 20h, 00h, 00h, 00h, 00h 
            db 00h, 20h, 00h, 20h, 00h, 20h, 20h, 20h, 20h, 20h, 00h, 20h, 20h, 20h, 00h, 00h, 00h 
            db 00h, 20h, 00h, 20h, 00h, 00h, 20h, 00h, 20h, 00h, 00h, 00h, 20h, 20h, 20h, 00h, 00h 
            db 00h, 20h, 00h, 20h, 00h, 00h, 20h, 20h, 20h, 20h, 20h, 20h, 00h, 20h, 20h, 20h, 00h 
            db 00h, 00h, 20h, 00h, 20h, 20h, 00h, 20h, 20h, 20h, 20h, 20h, 20h, 00h, 20h, 20h, 00h
            db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
            
    ingame_towerseg1    dB 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h   
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h
                        DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                        DB 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h
                        DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                        DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

    ingame_towerseg2    DB 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 00h, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h
                        DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                        DB 00h, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 00h, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h
                        DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                        DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

    ingame_towerseg3    DB 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h
                        DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                        DB 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                        DB 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h
                        DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                        DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    
    obstacle_left   DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h      
                    DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                    DB 00h, 00h, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                    DB 00h, 00h, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                    DB 00h, 00h, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                    DB 00h, 00h, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                    DB 00h, 00h, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                    DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                    DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    DB 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                    DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                    DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                    DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                    DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                    DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                    DB 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                    DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

    obstacle_right  DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h      
                    DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                    DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h
                    DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                    DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                    DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                    DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                    DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h
                    DB 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h
                    DB 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

    Player_leftdark     db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h    
                        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 14h, 00h, 00h, 00h, 00h, 00h, 00h
                        db 00h, 00h, 14h, 14h, 14h, 14h, 14h, 14h, 14h, 14h, 00h, 14h, 00h, 14h, 00h, 00h, 00h
                        db 00h, 14h, 14h, 14h, 14h, 14h, 14h, 14h, 14h, 14h, 00h, 14h, 00h, 14h, 00h, 00h, 00h
                        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 14h, 00h, 14h, 00h, 00h, 14h, 00h
                        db 00h, 14h, 00h, 14h, 00h, 00h, 00h, 14h, 00h, 00h, 00h, 00h, 00h, 00h, 14h, 14h, 00h
                        db 00h, 00h, 14h, 14h, 00h, 00h, 00h, 14h, 00h, 14h, 14h, 00h, 14h, 00h, 14h, 14h, 00h
                        db 00h, 14h, 14h, 14h, 00h, 14h, 14h, 14h, 00h, 14h, 14h, 00h, 14h, 14h, 00h, 14h, 00h
                        db 00h, 14h, 14h, 14h, 14h, 14h, 14h, 14h, 00h, 14h, 14h, 00h, 14h, 14h, 00h, 00h, 00h
                        db 00h, 14h, 14h, 14h, 14h, 14h, 14h, 14h, 00h, 00h, 00h, 00h, 14h, 14h, 00h, 00h, 00h
                        db 00h, 14h, 14h, 14h, 14h, 14h, 14h, 00h, 14h, 14h, 14h, 14h, 00h, 14h, 00h, 00h, 00h
                        db 00h, 00h, 14h, 00h, 00h, 14h, 14h, 00h, 14h, 14h, 14h, 14h, 14h, 00h, 14h, 14h, 00h
                        db 00h, 00h, 00h, 14h, 14h, 00h, 00h, 00h, 14h, 14h, 00h, 14h, 14h, 00h, 14h, 14h, 00h
                        db 00h, 00h, 00h, 14h, 14h, 00h, 14h, 00h, 14h, 14h, 00h, 14h, 14h, 00h, 14h, 14h, 00h
                        db 00h, 14h, 14h, 00h, 00h, 00h, 14h, 00h, 14h, 14h, 14h, 14h, 00h, 00h, 00h, 14h, 00h
                        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

    Player_rightdark    db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h    
                        db 00h, 00h, 00h, 00h, 00h, 14h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                        db 00h, 00h, 14h, 00h, 14h, 00h, 14h, 14h, 14h, 14h, 14h, 14h, 14h, 14h, 00h, 00h, 00h
                        db 00h, 00h, 14h, 00h, 14h, 00h, 14h, 14h, 14h, 14h, 14h, 14h, 14h, 14h, 14h, 00h, 00h
                        db 14h, 00h, 00h, 14h, 00h, 14h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                        db 14h, 14h, 00h, 00h, 00h, 00h, 00h, 00h, 14h, 00h, 00h, 00h, 14h, 00h, 14h, 00h, 00h
                        db 14h, 14h, 00h, 14h, 00h, 14h, 14h, 00h, 14h, 00h, 00h, 00h, 14h, 14h, 00h, 00h, 00h
                        db 14h, 00h, 14h, 14h, 00h, 14h, 14h, 00h, 14h, 14h, 14h, 00h, 14h, 14h, 14h, 00h, 00h
                        db 00h, 00h, 14h, 14h, 00h, 14h, 14h, 00h, 14h, 14h, 14h, 14h, 14h, 14h, 14h, 00h, 00h
                        db 00h, 00h, 14h, 14h, 00h, 00h, 00h, 00h, 14h, 14h, 14h, 14h, 14h, 14h, 14h, 00h, 00h
                        db 00h, 00h, 14h, 00h, 14h, 14h, 14h, 14h, 00h, 14h, 14h, 14h, 14h, 14h, 14h, 00h, 00h
                        db 14h, 14h, 00h, 14h, 14h, 14h, 14h, 14h, 00h, 14h, 14h, 00h, 00h, 14h, 00h, 00h, 00h
                        db 14h, 14h, 00h, 14h, 14h, 00h, 14h, 14h, 00h, 00h, 00h, 14h, 14h, 00h, 00h, 00h, 00h
                        db 14h, 14h, 00h, 14h, 14h, 00h, 14h, 14h, 00h, 14h, 00h, 14h, 14h, 00h, 00h, 00h, 00h
                        db 14h, 00h, 00h, 00h, 14h, 14h, 14h, 14h, 00h, 14h, 00h, 00h, 00h, 14h, 14h, 00h, 00h
                        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
                        db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    
    RightsideBox        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh
                        db 0fh, 0fh, 00h, 00h,0fh,0fh,0fh

    LeftsideBox         db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh
                        db 0fh,0fh,00h,00h,0fh,0fh,0fh

.code

org 0100h
    main proc far
        mov ax, @data
        mov ds, ax

        call generateseed               ; Initializes rng
        call default_gamevalue          ; Resets every state
        call clear_screen               ; Clears screen

        mov ah, 2ch                     ; DOS function to get system time
        int 21h                         
        mov prevtime, dh                ; Stores current seconds to prevtime 

        check_state:                    ; Checks status to direct to a corresponding screen handler
            cmp game_state, 0           ; 0 - menu, 1 - playing, 2 - game over, 3 - tutorial
            je menu_screen               
            cmp game_state, 1            
            je playing_game              
            cmp game_state, 2            
            je game_over                 
            cmp game_state, 3            
            je tutorial_screen           

        menu_screen:                    ; Main menu screen
            call clear_screen
            call menuscreen_printtext
            call render_menutower
            call render_sideboxmenu
            call menu_input
            
            call check_state
        playing_game:                   ; Core game logic loop
            call check_tick
            call update_difficulty
            call clear_screen
            call playinggame_input          
            call move_tower
            call move_obstacle
            call move_enemy
            call move_icicle
            call move_coin
            call update_coinvalue
            call update_coinactive
            call coin_collission
            call playinggame_printtext
            call render_gametower
            call render_char
            call render_obstacle
            call render_icicle
            call render_enemy
            call render_coin
            call check_collission
            call update_enemydifficulty
            
            call check_state
        game_over:                      ; Shows the game over screen
            call render_chardeathanimation
            call clear_screen
            call gameover_rendersprite
            call render_sideboxover
            call printhigh
            call gameover_printtext
            call generateseed
            call gameover_input          

            call check_state
        tutorial_screen:                ; Shows tutorial screen
            call clear_screen
            call tutorial_printscreen          
            call tutorial_input                
            call check_state
    main endp

    coin_collission proc                ; Procedure that checks if the player has collected a coin
        cmp coin_state, 0               ; If coin_state == 0 (inactive), exit
        je exit_coincollission2
        jmp check_coincollission        ; Else, handle coin collission

        exit_coincollission2: ret

        check_coincollission:
        
        mov ax, char_x                  ; Checks if the RIGHT side of the character is to the LEFT of the coin
        add ax, char_size               ; If yes, they cannot overlap horizontally, jump to exit
        cmp ax, coinx
        jng exit_coincollission2

        mov ax, coinx                   ; Checks if the LEFT side of the character is to the RIGHT of the coin
        add ax, char_size               ; If yes, they cannot overlap horizontally, jump to exit
        cmp char_x, ax
        jnl exit_coin_collission

        mov ax, char_y                  ; Checks if the BOTTOM of the character is to the TOP of the coin
        add ax, char_size               ; If yes, they cannot overlap vertcially, jump to exit
        cmp ax, coiny
        jng exit_coin_collission

        mov ax, coiny                   ; Checks if the TOP of the character is to the BOTTOM of the coin
        add ax, char_size               ; If yes, they cannot overlap vertcially, jump to exit
        cmp char_y, ax
        jnl exit_coin_collission

         
        cmp coin_state, 2               ; If coin_state != 2 (collected), exit
        jne exit_coin_collission

        call increment_score            ; Handles score incrementation

        cmp coin_value, 1               ; Checks the collected coin's value and adds to the score
        je add_1points

        cmp coin_value, 2               ; Checks the collected coin's value and adds to the score
        je add_2points

        cmp coin_value, 5               ; Checks the collected coin's value and adds to the score
        je add_5points

        add_1points:                    ; Adds 1 to the ones digit of score, and sets coin_state to 3
            add score_ones, 1
            mov coin_state, 3
            jmp exit_coin_collission
        add_2points:                    ; Adds 3 to the ones digit of score, and sets coin_state to 3
            add score_ones, 2
            mov coin_state, 3
            jmp exit_coin_collission
        add_5points:                    ; Adds 5 to the ones digit of score, and sets coin_state to 3
            add score_ones, 5
            mov coin_state, 3
            jmp exit_coin_collission

        exit_coin_collission:   
            call calculate_overallscore
            ret
    coin_collission endp

    update_coinvalue proc near          ; Procedure that updates the coin value
        call calculate_overallscore     ; Updates or recalculates the overall score
        cmp score_overallhex, 100       ; If overall score < 100, silver coin will appear
        jl set_coinsilver

        cmp score_overallhex, 200       ; If overall score < 200, gold coin will appear
        jl set_coingold

        cmp score_overallhex, 999       ; If overall score < 999, ruby coin will appear
        jl set_coinruby

        set_coinsilver:                 ; Sets the coin to silver with corresponding values and interval
            mov coin_value, 1
            mov coin_interval, 1
            ret

        set_coingold:                   ; Sets the coin to gold with corresponding values and interval
            mov coin_value, 2
            mov coin_interval, 2
            ret 

        set_coinruby:                   ; Sets the coin to ruby with corresponding values and interval
            mov coin_value, 5
            mov coin_interval, 4
            ret

        exit_update_coinvalue:  ret
    update_coinvalue endp

    update_coinactive proc near         
        cmp coin_state, 0               ; If coin_state == 0 (inactive), exit
        jne exit_update_coinactive      
        
        mov ah, 2ch                     ; DOS interrupt to get system time
        int 21h
        xor ax, ax                      ; Clears AX register
        mov al, dh                      ; Loads current second to AL
        mov bl, coin_interval           ; Loads coin interval to BL (frequency of coin appearance)
        div bl                          ; AX (current second) / BL (coin interval), remainder goes to AH
        cmp ah, 0                       ; If AH == 0 (no remainder), exit, else the coin is allowed to be active
        jne exit_update_coinactive
        mov coin_state, 1               ; Activates the coin by setting coin_state = 1

        exit_update_coinactive: ret
    update_coinactive endp

    render_coin proc near               ; Procedure to render coins
        cmp coin_state, 2               ; if coin_state != 2 (not active), exit
        jne exit_rendercoin
        
        cmp coin_value, 1               ; If coin_value == 1, draw a silver coin
        je render_silvercoin

        cmp coin_value, 2               ; If coin_value == 2, draw a gold coin
        je render_goldcoin

        cmp coin_value, 5               ; If coin_value == 5, draw a ruby coin
        je render_rubycoin

        jmp exit_rendercoin             ; exit

        exit_rendercoin:    ret
        render_silvercoin:              
            mov si, offset coinsilver            
            mov ax, coinx
            add ax, 4
            mov rendercoordX, ax              
            mov ax, coiny
            add ax, 4
            mov rendercoordY, ax             
            mov _rendersizeX, 9             
            mov _rendersizeY, 9             
            call _rendersprite
            ret
            
        render_goldcoin:
            mov si, offset coin            
            mov ax, coinx
            add ax, 4
            mov rendercoordX, ax              
            mov ax, coiny
            add ax, 4
            mov rendercoordY, ax             
            mov _rendersizeX, 9             
            mov _rendersizeY, 9             
            call _rendersprite
            ret

        render_rubycoin:
            mov si, offset coinruby            
            mov ax, coinx
            add ax, 4
            mov rendercoordX, ax              
            mov ax, coiny
            add ax, 4
            mov rendercoordY, ax             
            mov _rendersizeX, 9             
            mov _rendersizeY, 9             
            call _rendersprite
            ret
    render_coin endp

    move_coin proc near
        cmp coin_state, 1                    
        jne move_coincondition2
        jmp coin_activating

        move_coincondition2:
        cmp coin_state, 2                    
        jne move_coincondition3
        jmp coin_descending

        move_coincondition3:
        cmp coin_state, 3                    
        jne exit_movecoin                    
        jmp coin_descending

        exit_movecoin:  ret

        coin_activating:
            mov si, 0
            mov ax, obs_ypos[si+0]
            cmp ax, 23
            jl check_nextcoinassign
            ret

            check_nextcoinassign:
                mov ax, obs_ypos[si]         
                mov coiny, ax
                mov ax, obs_xpos[si]         
                mov coinx, ax

            assign_coinx:
                call nurng                   
                cmp randomNum, 1
                je coin_position1
                cmp randomNum, 2
                je coin_position2
                cmp randomNum, 3
                je coin_position3
                cmp randomNum, 4
                je coin_position4
                jmp assign_coinx             

                coin_position1:
                    mov coinx, 135
                    mov ax, obs_xpos[si]
                    cmp coinx, ax
                    je coin_position2
                    jmp check_tempcoinx
                coin_position2:
                    mov coinx, 182
                    mov ax, obs_xpos[si]
                    cmp coinx, ax
                    je coin_position3
                    jmp check_tempcoinx
                coin_position3:
                    mov coinx, 223
                    mov ax, obs_xpos[si]
                    cmp coinx, ax
                    je coin_position4
                    jmp check_tempcoinx
                coin_position4:
                    mov coinx, 270
                    mov ax, obs_xpos[si]
                    cmp coinx, ax
                    je coin_position1
                    jmp check_tempcoinx

                check_tempcoinx:                         
                    mov coin_state, 2

        coin_descending:
            mov si, 0
            mov ax, obs_ypos[si]
            mov coiny, ax
            mov ax, y_bottomlimit
            cmp coiny, ax
            jng exit_coindescending
            mov coin_state, 0
            mov coiny, 0
            mov coinx, 0

            exit_coindescending:
            mov si, 0
            ret
    move_coin endp

    render_chardeathanimation proc near
        mov ah, 2ch              
        int 21h

        mov tempmsecond, dh
        add tempmsecond, 4       
        cmp tempmsecond, 59
        jng loop_renderdeath
        sub tempmsecond, 60

        loop_renderdeath:
            cmp char_xfixedpos, 1
            je render_leftchardeath

            cmp char_xfixedpos, 3
            je render_leftchardeath

            cmp char_xfixedpos, 2
            je render_rightchardeath

            cmp char_xfixedpos, 4
            je render_rightchardeath

        render_leftchardeath:
            mov ah, 2ch              
            int 21h
            xor ax, ax
            mov al, dh       
            mov bl, 2        
            div bl           
            cmp ah, 0        
            je _renderleftdark
            jmp _renderleft

            _renderleft:
                mov si, offset Player_left       
                mov ax, char_x
                mov rendercoordX, ax                 
                mov ax, char_y
                mov rendercoordY, ax                 
                mov _rendersizeX, 17                 
                mov _rendersizeY, 17                 
                call _rendersprite     
                jmp check_renderdeathtime

            _renderleftdark:
                mov si, offset Player_leftdark       
                mov ax, char_x
                mov rendercoordX, ax                 
                mov ax, char_y
                mov rendercoordY, ax                 
                mov _rendersizeX, 17                 
                mov _rendersizeY, 17                 
                call _rendersprite
                jmp check_renderdeathtime

        render_rightchardeath:
            mov ah, 2ch              
            int 21h
            xor ax, ax
            mov al, dh       
            mov bl, 2        
            div bl           
            cmp ah, 0        
            je _renderrightdark
            jmp _renderright

            _renderright:
                mov si, offset Player_right       
                mov ax, char_x
                mov rendercoordX, ax                 
                mov ax, char_y
                mov rendercoordY, ax                 
                mov _rendersizeX, 17                 
                mov _rendersizeY, 17                 
                call _rendersprite     
                jmp check_renderdeathtime

            _renderrightdark:
                mov si, offset Player_rightdark       
                mov ax, char_x
                mov rendercoordX, ax                 
                mov ax, char_y
                mov rendercoordY, ax                 
                mov _rendersizeX, 17                 
                mov _rendersizeY, 17                 
                call _rendersprite
                jmp check_renderdeathtime

        check_renderdeathtime:
            mov ah, 2ch              
            int 21h
            cmp tempmsecond, dh              
            je exit_renderdeath
            jmp loop_renderdeath

        exit_renderdeath:   ret
    render_chardeathanimation endp

    tutorial_printscreen proc near               
        cmp tutorial_page, 1
        jne checkpage2
        jmp page1

        checkpage2:
        cmp tutorial_page, 2
        jne checkpage3
        jmp page2

        checkpage3:
        cmp tutorial_page, 3
        jne checkpage4
        jmp page3

        checkpage4:
        cmp tutorial_page, 4
        jne checkpage5
        jmp page4

        checkpage5:
        cmp tutorial_page, 5
        jne exit_tutprintscreen
        jmp page5

        exit_tutprintscreen:    ret
        page1:
            mov si, offset Player_left
            mov rendercoordX, 128
            mov rendercoordY, 79
            mov _rendersizeX, 17
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset ingame_towerseg3
            mov rendercoordX, 144
            mov rendercoordY, 48
            mov _rendersizeX, 33
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset ingame_towerseg1
            mov rendercoordX, 144
            mov rendercoordY, 64
            mov _rendersizeX, 33
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset ingame_towerseg2
            mov rendercoordX, 144
            mov rendercoordY, 80
            mov _rendersizeX, 33
            mov _rendersizeY, 17
            call _rendersprite
        
            mov si, offset ingame_towerseg3
            mov rendercoordX, 144
            mov rendercoordY, 96
            mov _rendersizeX, 33
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset ingame_towerseg1
            mov rendercoordX, 144
            mov rendercoordY, 112
            mov _rendersizeX, 33
            mov _rendersizeY, 17
            call _rendersprite

            mov bp, offset line1_menu        
            mov _stringx, 10
            mov _stringy, 2
            mov _stringcolor, 0fh
            mov _stringlength, 20
            call _printtext

            mov bp, offset line1_pg1        
            mov _stringx, 11
            mov _stringy, 18
            mov _stringcolor, 0fh
            mov _stringlength, 18
            call _printtext

            mov bp, offset line2_pg1         
            mov _stringx, 13
            mov _stringy, 19
            mov _stringcolor, 0fh
            mov _stringlength, 15
            call _printtext

            mov bp, offset line3_tutorial         
            mov _stringx, 16
            mov _stringy, 23
            mov _stringcolor, 0eh
            mov _stringlength, 8
            call _printtext

             
            mov ah, 02h     
            mov bh, 00h     
            mov dh, 21   
            mov dl, 17     
            int 10h
            mov ah, 09h              
            mov al, 07h               
            mov bh, 0          
            mov bl, 0ah              
            mov cx, 5
            int 10h

            mov ah, 02h     
            mov bh, 00h     
            mov dh, 21    
            mov dl, 17     
            int 10h
            mov ah, 09h              
            mov al, 09h               
            mov bh, 0          
            mov bl, 0ah              
            mov cx, 1
            int 10h

            mov ah, 02h     
            mov bh, 00h     
            mov dh, 21    
            mov dl, 23     
            int 10h
            mov ah, 09h              
            mov al, 1ah               
            mov bh, 0          
            mov bl, 0ah              
            mov cx, 1
            int 10h
            ret
            
        page2:
            mov si, offset Player_right
            mov rendercoordX, 176
            mov rendercoordY, 95
            mov _rendersizeX, 17
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset ingame_towerseg3
            mov rendercoordX, 144
            mov rendercoordY, 48
            mov _rendersizeX, 33
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset ingame_towerseg1
            mov rendercoordX, 144
            mov rendercoordY, 64
            mov _rendersizeX, 33
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset ingame_towerseg2
            mov rendercoordX, 144
            mov rendercoordY, 80
            mov _rendersizeX, 33
            mov _rendersizeY, 17
            call _rendersprite
        
            mov si, offset ingame_towerseg3
            mov rendercoordX, 144
            mov rendercoordY, 96
            mov _rendersizeX, 33
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset ingame_towerseg1
            mov rendercoordX, 144
            mov rendercoordY, 112
            mov _rendersizeX, 33
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset obstacle_left
            mov rendercoordX, 128
            mov rendercoordY, 87
            mov _rendersizeX, 18
            mov _rendersizeY, 17
            call _rendersprite

            mov bp, offset line1_menu        
            mov _stringx, 10
            mov _stringy, 2
            mov _stringcolor, 0fh
            mov _stringlength, 20
            call _printtext

            mov bp, offset line1_pg2        
            mov _stringx, 15
            mov _stringy, 18
            mov _stringcolor, 0fh
            mov _stringlength, 10
            call _printtext


            mov bp, offset line2_pg2        
            mov _stringx, 12
            mov _stringy, 19
            mov _stringcolor, 0fh
            mov _stringlength, 17
            call _printtext

            mov bp, offset line3_tutorial         
            mov _stringx, 16
            mov _stringy, 23
            mov _stringcolor, 0eh
            mov _stringlength, 8
            call _printtext

             
            mov ah, 02h     
            mov bh, 00h     
            mov dh, 21    
            mov dl, 15     
            int 10h
            mov ah, 09h              
            mov al, 1bh               
            mov bh, 0          
            mov bl, 0ah              
            mov cx, 1
            int 10h

            mov ah, 02h     
            mov bh, 00h     
            mov dh, 21   
            mov dl, 17     
            int 10h
            mov ah, 09h              
            mov al, 07h               
            mov bh, 0          
            mov bl, 0ah              
            mov cx, 5
            int 10h

            mov ah, 02h     
            mov bh, 00h     
            mov dh, 21    
            mov dl, 18     
            int 10h
            mov ah, 09h              
            mov al, 09h               
            mov bh, 0          
            mov bl, 0ah              
            mov cx, 1
            int 10h

            mov ah, 02h     
            mov bh, 00h     
            mov dh, 21    
            mov dl, 23     
            int 10h
            mov ah, 09h              
            mov al, 1ah               
            mov bh, 0          
            mov bl, 0ah              
            mov cx, 1
            int 10h
            ret

        page3:
            mov si, offset Player_left
            mov rendercoordX, 128
            mov rendercoordY, 95
            mov _rendersizeX, 17
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset enemy
            mov rendercoordX, 195
            mov rendercoordY, 52
            mov _rendersizeX, 17
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset ingame_towerseg3
            mov rendercoordX, 144
            mov rendercoordY, 48
            mov _rendersizeX, 33
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset ingame_towerseg1
            mov rendercoordX, 144
            mov rendercoordY, 64
            mov _rendersizeX, 33
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset ingame_towerseg2
            mov rendercoordX, 144
            mov rendercoordY, 80
            mov _rendersizeX, 33
            mov _rendersizeY, 17
            call _rendersprite
        
            mov si, offset ingame_towerseg3
            mov rendercoordX, 144
            mov rendercoordY, 96
            mov _rendersizeX, 33
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset ingame_towerseg1
            mov rendercoordX, 144
            mov rendercoordY, 112
            mov _rendersizeX, 33
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset obstacle_right
            mov rendercoordX, 175
            mov rendercoordY, 71
            mov _rendersizeX, 18
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset icicle
            mov rendercoordX, 132
            mov rendercoordY, 40
            mov _rendersizeX, 10
            mov _rendersizeY, 15
            call _rendersprite

            mov bp, offset line1_menu        
            mov _stringx, 10
            mov _stringy, 2
            mov _stringcolor, 0fh
            mov _stringlength, 20
            call _printtext

             
            mov ah, 02h     
            mov bh, 0     
            mov dh, 5              
            mov dl, 25          
            int 10h 

            mov ah, 0Eh            
            mov al, '!'
            mov bh, 0
            mov bl, 20h            
            int 10h

            mov bp, offset line1_menu        
            mov _stringx, 10
            mov _stringy, 2
            mov _stringcolor, 0fh
            mov _stringlength, 20
            call _printtext

            mov bp, offset line1_pg3         
            mov _stringx, 9
            mov _stringy, 18
            mov _stringcolor, 0fh
            mov _stringlength, 23
            call _printtext

            mov bp, offset line2_pg3         
            mov _stringx, 11
            mov _stringy, 19
            mov _stringcolor, 0fh
            mov _stringlength, 20
            call _printtext

            mov bp, offset line3_tutorial         
            mov _stringx, 16
            mov _stringy, 23
            mov _stringcolor, 0eh
            mov _stringlength, 8
            call _printtext

             
            mov ah, 02h     
            mov bh, 00h     
            mov dh, 21    
            mov dl, 15     
            int 10h
            mov ah, 09h              
            mov al, 1bh               
            mov bh, 0          
            mov bl, 0ah              
            mov cx, 1
            int 10h

            mov ah, 02h     
            mov bh, 00h     
            mov dh, 21    
            mov dl, 17     
            int 10h
            mov ah, 09h              
            mov al, 07h               
            mov bh, 0          
            mov bl, 0ah              
            mov cx, 5
            int 10h

            mov ah, 02h     
            mov bh, 00h     
            mov dh, 21    
            mov dl, 19     
            int 10h
            mov ah, 09h              
            mov al, 09h               
            mov bh, 0          
            mov bl, 0ah              
            mov cx, 1
            int 10h

            mov ah, 02h     
            mov bh, 00h     
            mov dh, 21    
            mov dl, 23     
            int 10h
            mov ah, 09h              
            mov al, 1ah               
            mov bh, 0          
            mov bl, 0ah              
            mov cx, 1
            int 10h
            ret

        page4:
            mov si, offset Player_right
            mov rendercoordX, 176
            mov rendercoordY, 79
            mov _rendersizeX, 17
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset ingame_towerseg3
            mov rendercoordX, 144
            mov rendercoordY, 48
            mov _rendersizeX, 33
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset ingame_towerseg1
            mov rendercoordX, 144
            mov rendercoordY, 64
            mov _rendersizeX, 33
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset ingame_towerseg2
            mov rendercoordX, 144
            mov rendercoordY, 80
            mov _rendersizeX, 33
            mov _rendersizeY, 17
            call _rendersprite
        
            mov si, offset ingame_towerseg3
            mov rendercoordX, 144
            mov rendercoordY, 96
            mov _rendersizeX, 33
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset ingame_towerseg1
            mov rendercoordX, 144
            mov rendercoordY, 112
            mov _rendersizeX, 33
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset obstacle_right
            mov rendercoordX, 175
            mov rendercoordY, 55
            mov _rendersizeX, 18
            mov _rendersizeY, 17
            call _rendersprite

            mov si, offset obstacle_right
            mov rendercoordX, 175
            mov rendercoordY, 103
            mov _rendersizeX, 18
            mov _rendersizeY, 17
            call _rendersprite
        
            mov si, offset obstacle_left
            mov rendercoordX, 128
            mov rendercoordY, 79
            mov _rendersizeX, 18
            mov _rendersizeY, 17
            call _rendersprite

            mov bp, offset line1_menu        
            mov _stringx, 10
            mov _stringy, 2
            mov _stringcolor, 0fh
            mov _stringlength, 20
            call _printtext

            mov bp, offset line1_pg4         
            mov _stringx, 11
            mov _stringy, 18
            mov _stringcolor, 0fh
            mov _stringlength, 18
            call _printtext

            mov bp, offset line2_pg4         
            mov _stringx, 14
            mov _stringy, 19
            mov _stringcolor, 0fh
            mov _stringlength, 13
            call _printtext

            mov bp, offset line3_tutorial         
            mov _stringx, 16
            mov _stringy, 23
            mov _stringcolor, 0eh
            mov _stringlength, 8
            call _printtext

             
            mov ah, 02h     
            mov bh, 00h     
            mov dh, 21    
            mov dl, 15     
            int 10h
            mov ah, 09h              
            mov al, 1bh               
            mov bh, 0          
            mov bl, 0ah              
            mov cx, 1
            int 10h

            mov ah, 02h     
            mov bh, 00h     
            mov dh, 21    
            mov dl, 17     
            int 10h
            mov ah, 09h              
            mov al, 07h               
            mov bh, 0          
            mov bl, 0ah              
            mov cx, 5
            int 10h

            mov ah, 02h     
            mov bh, 00h     
            mov dh, 21    
            mov dl, 20     
            int 10h
            mov ah, 09h              
            mov al, 09h               
            mov bh, 0          
            mov bl, 0ah              
            mov cx, 1
            int 10h

            mov ah, 02h     
            mov bh, 00h     
            mov dh, 21    
            mov dl, 23     
            int 10h
            mov ah, 09h              
            mov al, 1ah               
            mov bh, 0          
            mov bl, 0ah              
            mov cx, 1
            int 10h
            ret

        page5:
            mov si, offset coinsilver        
            mov rendercoordX, 119
            mov rendercoordY, 63
            mov _rendersizeX, 9
            mov _rendersizeY, 9
            call _rendersprite

            mov si, offset coin        
            mov rendercoordX, 119
            mov rendercoordY, 79
            mov _rendersizeX, 9
            mov _rendersizeY, 9
            call _rendersprite

            mov si, offset coinruby        
            mov rendercoordX, 119
            mov rendercoordY, 95
            mov _rendersizeX, 9
            mov _rendersizeY, 9
            call _rendersprite

            mov bp, offset line1_menu        
            mov _stringx, 10
            mov _stringy, 2
            mov _stringcolor, 0fh
            mov _stringlength, 20
            call _printtext

            mov bp, offset line1_pg5        
            mov _stringx, 17
            mov _stringy, 8
            mov _stringcolor, 0fh
            mov _stringlength, 7
            call _printtext

            mov bp, offset line2_pg5        
            mov _stringx, 17
            mov _stringy, 10
            mov _stringcolor, 0fh
            mov _stringlength, 8
            call _printtext

            mov bp, offset line3_pg5        
            mov _stringx, 17
            mov _stringy, 12
            mov _stringcolor, 0fh
            mov _stringlength, 8
            call _printtext

            mov bp, offset line4_pg5         
            mov _stringx, 10
            mov _stringy, 18
            mov _stringcolor, 0fh
            mov _stringlength, 21
            call _printtext

            mov bp, offset line5_pg5         
            mov _stringx, 10
            mov _stringy, 19
            mov _stringcolor, 0fh
            mov _stringlength, 20
            call _printtext

            mov bp, offset line3_tutorial         
            mov _stringx, 16
            mov _stringy, 23
            mov _stringcolor, 0eh
            mov _stringlength, 8
            call _printtext

             
            mov ah, 02h     
            mov bh, 00h     
            mov dh, 21    
            mov dl, 15     
            int 10h
            mov ah, 09h              
            mov al, 1bh               
            mov bh, 0          
            mov bl, 0ah              
            mov cx, 1
            int 10h

            mov ah, 02h     
            mov bh, 00h     
            mov dh, 21  
            mov dl, 17     
            int 10h
            mov ah, 09h              
            mov al, 07h               
            mov bh, 0          
            mov bl, 0ah              
            mov cx, 5
            int 10h

            mov ah, 02h     
            mov bh, 00h     
            mov dh, 21    
            mov dl, 21     
            int 10h
            mov ah, 09h              
            mov al, 09h               
            mov bh, 0          
            mov bl, 0ah              
            mov cx, 1
            int 10h
            ret
    tutorial_printscreen endp

    tutorial_input proc near        ; Procedure to track input in tutorial                   
        mov ah, 00h                 ; DOS interrupt to wait for a keypress and stores it in AL
        int 16h                  

        cmp al, 'a'                 ; if input is a/A
        je a_keyinput            
        cmp al, 'A'              
        je a_keyinput            

        cmp al, 'd'                 ; if input is d/D
        je d_keyinput
        cmp al, 'D'
        je d_keyinput

        cmp al, 'e'                 ; if input is e/E
        je e_keyinput
        cmp al, 'E'
        je e_keyinput

        jmp tutorial_input          ; if none of the choices is pressed, loop

        a_keyinput:                 
            cmp tutorial_page, 1    ; if current page == 1 (first page)
            je tutorial_input       ; take keypress
            dec tutorial_page       ; decrement page value (go back)
            ret
        d_keyinput:
            cmp tutorial_page, 5    ; if current page == 5 (last page)
            je tutorial_input       ; take keypress
            inc tutorial_page       ; increment page value (go next)
            ret
        e_keyinput:
            mov game_state, 0       ; set game_state to 0 (menu screen)
            mov tutorial_page, 1    ; set tutorial_page to 0 (first page)
            ret
    tutorial_input endp

    menu_input proc near            ; Procedure to track input in menu
        mov ah, 00h                 ; DOS interrup to accept keypress, stores input in AL
        int 16h                  
        cmp al, 's'                 ; if input == s/S
        je menu_skeyinput     
        cmp al, 'S'              
        je menu_skeyinput     

        cmp al, 't'                 ; if input == t/T
        je menu_tkeyinput
        cmp al, 'T'
        je menu_tkeyinput

        cmp al, 'h'                 ; if input == h/H
        je menu_hkeyinput
        cmp al, 'H'
        je menu_hkeyinput
        
        jmp menu_input              ; if none of the choices is pressed, loop

        menu_skeyinput:             ; if s is pressed, set game_state to 1 (playing game)
            mov game_state, 1        
            ret

        menu_tkeyinput:             ; if t is pressed, set game_state to 3 (tutorial)
            mov game_state, 3        
        
        menu_hkeyinput:             ; if h is pressed, set menu_page to 1 (main menu)
            mov menu_page, 1
            ret
    menu_input endp
  
    menuscreen_printtext proc near  ; Procedure that prints text in the menu
  
        mov bp, offset line1_menu         
        mov _stringx, 10
        mov _stringy, 04
        mov _stringcolor, 0fh
        mov _stringlength, 20
        call _printtext

        mov bp, offset line3_menu         
        mov _stringx, 04
        mov _stringy, 13
        mov _stringcolor, 0eh
        mov _stringlength, 17
        call _printtext         

         
        mov bp, offset line4_menu         
        mov _stringx, 04
        mov _stringy, 15
        mov _stringcolor, 0eh
        mov _stringlength, 12
        call _printtext   


         
            mov ah, 02h     
            mov bh, 00h     
            mov dh, 02    
            mov dl, 08     
            int 10h
            mov ah, 09h              
            mov al, 05fh           
            mov bh, 0          
            mov bl, 0fh              
            mov cx, 24
            int 10h

            mov ah, 02h     
            mov bh, 00h     
            mov dh, 05    
            mov dl, 08     
            int 10h
            mov ah, 09h              
            mov al, 05fh           
            mov bh, 0          
            mov bl, 0fh              
            mov cx, 24
            int 10h  
            
        ret
    menuscreen_printtext endp

    render_menutower proc near
        mov si, offset menutower_topchest
        mov ax, menutowerx
        mov rendercoordX, ax
        mov ax, menutowerchesty
        mov rendercoordY, ax
        mov _rendersizeX, 57
        mov _rendersizeY, 24
        call _rendersprite

        mov si, offset menutower_seg1
        mov ax, menutowerx
        mov rendercoordX, ax
        mov rendercoordY, 103
        mov _rendersizeX, 57
        mov _rendersizeY, 17
        call _rendersprite

        mov si, offset menutower_seg2
        mov ax, menutowerx
        mov rendercoordX, ax
        mov rendercoordY, 119
        mov _rendersizeX, 57
        mov _rendersizeY, 17
        call _rendersprite

        mov si, offset menutower_seg1
        mov ax, menutowerx
        mov rendercoordX, ax
        mov rendercoordY, 135
        mov _rendersizeX, 57
        mov _rendersizeY, 17
        call _rendersprite

        mov si, offset menutower_seg2
        mov ax, menutowerx
        mov rendercoordX, ax
        mov rendercoordY, 151
        mov _rendersizeX, 57
        mov _rendersizeY, 17
        call _rendersprite

        mov si, offset menutower_seg1
        mov ax, menutowerx
        mov rendercoordX, ax
        mov rendercoordY, 167
        mov _rendersizeX, 57
        mov _rendersizeY, 17
        call _rendersprite

        mov si, offset menutower_seg2
        mov ax, menutowerx
        mov rendercoordX, ax
        mov rendercoordY, 183
        mov _rendersizeX, 57
        mov _rendersizeY, 17
        call _rendersprite
        xor si, si
        ret
    render_menutower endp

    render_sideboxmenu proc near
            mov si, offset RightsideBox       
            mov rendercoordX, 64
            mov rendercoordY, 25
            mov _rendersizeX, 07
            mov _rendersizeY, 23
            call _rendersprite

            mov si, offset LeftsideBox      
            mov rendercoordX, 250
            mov rendercoordY, 25
            mov _rendersizeX, 07
            mov _rendersizeY, 23
            call _rendersprite

     render_sideboxmenu endp

    render_icicle proc near
         
        cmp icicle_state, 1          
        je icicle_trackingrender

        cmp icicle_state, 2          
        je icicle_activerender

        jmp exit_rendericicle
        icicle_trackingrender:
            mov ah, 2ch                      
            int 21h                          

            xor ax, ax                       
            mov al, dl                       
            mov bl, 2                        
            div bl                           

            cmp ah, 0                        
            jne icicle_activerender          
            ret                              

        icicle_activerender:
            push si                          
            mov si, offset icicle            
            mov ax, iciclex
            mov rendercoordX, ax             
            mov ax, icicley
            mov rendercoordY, ax             
            mov _rendersizeX, 10             
            mov _rendersizeY, 15             
            call _rendersprite
            pop si                           
            jmp exit_rendericicle

        exit_rendericicle:  ret
    render_icicle endp

    move_icicle proc near    
        cmp icicle_state, 1              
        je icicle_tracking

        cmp icicle_state, 2              
        je icicle_active                 

        jmp exit_moveicicle              

        icicle_tracking:                 
            mov ax, char_x
            add ax, 4                    
            mov iciclex, ax         

            cmp enemy_state, 2
            je exit_moveicicle           

             
            mov icicle_state, 2          
            jmp exit_moveicicle
            
        icicle_active:
            mov ax, icicle_velocity
            add icicley, ax              

            mov ax, y_bottomlimit        
            add ax, 16
            cmp icicley, ax
            jle exit_moveicicle          

            mov icicle_state, 0          
            mov icicley, 8
            jmp exit_moveicicle
        exit_moveicicle:    ret
    move_icicle endp

    move_tower proc 
        push si                         ; saves SI pointer to stack              
        mov si, offset towery           ; points SI to towery
                                             
        mov cx, 11                      ; sets counter (there are 11 elements/towerblocks)   

        loop_movetower:                 ; FUNCTION THAT MOVES THE TOWER
            mov ax, y_velocity          ; sets ax to velocity
            add [si], ax                ; adds velocity to the towery pointed by pointer

            mov ax, y_bottomlimit       ; sets ax to bottomlimit
            add ax, 32                  ; add bottomlimit to 32 (defines the threshold when a tower block has reached the bottom)
            cmp [si], ax                ; compares towery to the threshold
            jng loopcheck_movetower     ; if <=, jump to loopcheck_movetower

             
            mov ax, 9                   ; sets ax to 9
            mov [si], ax                ; Resets towery position to 9 top create continuous loop

        loopcheck_movetower:
            add si, 2                   ; increment si to 2 to move to next y position of tower 
            loop loop_movetower         ; loop back to loop_movetower for 11 times     
            pop si                      ; restore original value of si
            ret                              
    move_tower endp

    render_gametower proc near
        mov cx, 1                              
        mov towerx, 151                 ; sets towerx to 151     

        tower_segment1:                 ; DRAW 4 SEGMENTS (BRICKS) AT DIFFERENT Y POSITIONS  
            mov si, offset towery       ; si points to towery
            mov ax, towerx              ; sets ax to 151
            mov rendercoordX, ax        ; sets x position for rendering
            mov ax, [si+0]              ; get y from towery
            mov rendercoordY, ax        ; set y position for rendering
            mov _rendersizeX, 33        
            mov _rendersizeY, 16             
            mov si, offset ingame_towerseg1
            call _rendersprite          ; draw segment

            mov si, offset towery
            mov ax, towerx
            mov rendercoordX, ax            
            mov ax, [si+6]
            mov rendercoordY, ax             
            mov _rendersizeX, 33             
            mov _rendersizeY, 16             
            mov si, offset ingame_towerseg1
            call _rendersprite

            mov si, offset towery
            mov ax, towerx
            mov rendercoordX, ax            
            mov ax, [si+12]
            mov rendercoordY, ax             
            mov _rendersizeX, 33             
            mov _rendersizeY, 16             
            mov si, offset ingame_towerseg1
            call _rendersprite

            mov si, offset towery
            mov ax, towerx
            mov rendercoordX, ax            
            mov ax, [si+18]
            mov rendercoordY, ax             
            mov _rendersizeX, 33             
            mov _rendersizeY, 16             
            mov si, offset ingame_towerseg1
            call _rendersprite

        tower_segment2:
            mov si, offset towery
            mov ax, towerx
            mov rendercoordX, ax            
            mov ax, [si+2]
            mov rendercoordY, ax             
            mov _rendersizeX, 33             
            mov _rendersizeY, 16             
            mov si, offset ingame_towerseg2
            call _rendersprite

            mov si, offset towery
            mov ax, towerx
            mov rendercoordX, ax            
            mov ax, [si+8]
            mov rendercoordY, ax             
            mov _rendersizeX, 33             
            mov _rendersizeY, 16             
            mov si, offset ingame_towerseg2
            call _rendersprite

            mov si, offset towery
            mov ax, towerx
            mov rendercoordX, ax            
            mov ax, [si+14]
            mov rendercoordY, ax             
            mov _rendersizeX, 33             
            mov _rendersizeY, 16             
            mov si, offset ingame_towerseg2
            call _rendersprite

            mov si, offset towery
            mov ax, towerx
            mov rendercoordX, ax            
            mov ax, [si+20]
            mov rendercoordY, ax             
            mov _rendersizeX, 33             
            mov _rendersizeY, 16             
            mov si, offset ingame_towerseg2
            call _rendersprite

        tower_segment3:
            mov si, offset towery
            mov ax, towerx
            mov rendercoordX, ax            
            mov ax, [si+4]
            mov rendercoordY, ax             
            mov _rendersizeX, 33             
            mov _rendersizeY, 16             
            mov si, offset ingame_towerseg3
            call _rendersprite

            mov si, offset towery
            mov ax, towerx
            mov rendercoordX, ax            
            mov ax, [si+10]
            mov rendercoordY, ax             
            mov _rendersizeX, 33             
            mov _rendersizeY, 16             
            mov si, offset ingame_towerseg3
            call _rendersprite

            mov si, offset towery
            mov ax, towerx
            mov rendercoordX, ax            
            mov ax, [si+16]
            mov rendercoordY, ax             
            mov _rendersizeX, 33             
            mov _rendersizeY, 16             
            mov si, offset ingame_towerseg3
            call _rendersprite

            cmp towerx, 239
            je exit_rendertower
            mov towerx, 239
            jmp tower_segment1

        exit_rendertower:
            mov si, 0
            ret
    render_gametower endp

    check_tick proc near
        mov ah, 2ch                     ; DOS function to get system time (CH: hour; CL: minutes; DH: seconds; DL: hundredths of seconds)  
        int 21h                  

        cmp dl, current_tick            ; compares dl to current_tick
        jne changetick                  ; changetick if dl and current_tick is not equa
        jmp check_state                 ; jump to check state

        changetick:
            mov current_tick, dl        ; stores current_tick to dl
            cmp prevtime, dh            ; compares previous time to dh (seconds)
            je exit_checktick           ; if prevTime is equal to seconds, exit

            mov prevtime, dh            ; stores new seconds and updates scores once per
            mov current_seconds, dh
            call increment_score

        exit_checktick:
            ret
    check_tick endp

    render_enemy proc near
        cmp enemy_state, 0               
        je exit_drawenemy

        mov si, offset enemy             
        mov ax, enemy_x
        mov rendercoordX, ax             
        mov ax, enemy_y
        mov rendercoordY, ax             
        mov _rendersizeX, 17             
        mov _rendersizeY, 17             
        call _rendersprite

        cmp enemy_state, 2              
        jne exit_drawenemy               
                                               
        mov ah, 2ch                      
        int 21h
        cmp tempmsecond, dh              
        jne exclamation                 

         
        mov enemy_state, 3

        exclamation:
            mov ah, 02h                  
            mov bh, 0     
            mov dh, 2                
            mov dl, 26               
            int 10h 

            mov ah, 0Eh              
            mov al, '!'
            mov bh, 0
            mov bl, 20h              
            int 10h

            mov ah, 2ch              
            int 21h

            xor ax, ax
            mov al, dl       
            mov bl, 2        
            div bl           

            cmp ah, 0        
            je draw_exclamation     
            ret

            draw_exclamation:
                mov ah, 02h              
                mov bh, 0     
                mov dh, 2               
                mov dl, 26              
                int 10h 

                mov ah, 0Eh              
                mov al, ' '
                mov bh, 0
                mov bl, 20h              
                int 10h
                jmp exit_drawenemy


        exit_drawenemy:
            ret
    render_enemy endp

    move_enemy proc near
        cmp enemy_state, 1           
        je descending
          
        cmp enemy_state, 3           
        je ascending

        ret

        ascending:
            cmp enemy_y, 8
            jle exit_ascending
            dec enemy_y
            ret

        exit_ascending:
            mov enemy_state, 0       
            ret

        descending:
            cmp enemy_y, 31
            jge exit_descending
            inc enemy_y
            ret

        exit_descending:
            mov enemy_state, 2       
            mov icicle_state, 1      
            mov ah, 2ch              
            int 21h

            mov tempmsecond, dh
            add tempmsecond, 2       
            cmp tempmsecond, 59
            jg adjust_tempmsecond
            ret

            adjust_tempmsecond:
                sub tempmsecond, 60
                ret
    move_enemy endp

    update_difficulty proc near          
        call calculate_overallscore
        mov si, 0 
         
        cmp score_overallhex, 20         
        jl lowdiff
        cmp score_overallhex, 60         
        jl mediumdiff
        cmp score_overallhex, 100
        jl intermediatediff
        cmp score_overallhex, 300
        jl harddiff
        jmp extremediff
        exit_updatediff:    ret
        lowdiff:
            mov .obs_activetemp[si+0], 1         
            mov .obs_activetemp[si+2], 0         
            mov .obs_activetemp[si+4], 0
            mov .obs_activetemp[si+6], 0
            mov .obs_activetemp[si+8], 0
            jmp beginupdate
        mediumdiff:
            mov .obs_activetemp[si+0], 1
            mov .obs_activetemp[si+2], 0
            mov .obs_activetemp[si+4], 0
            mov .obs_activetemp[si+6], 1
            mov .obs_activetemp[si+8], 0
            jmp beginupdate
        intermediatediff:
            mov .obs_activetemp[si+0], 1
            mov .obs_activetemp[si+2], 0
            mov .obs_activetemp[si+4], 1
            mov .obs_activetemp[si+6], 0
            mov .obs_activetemp[si+8], 1
            jmp beginupdate
        harddiff:
            mov .obs_activetemp[si+0], 1
            mov .obs_activetemp[si+2], 1
            mov .obs_activetemp[si+4], 0
            mov .obs_activetemp[si+6], 1
            mov .obs_activetemp[si+8], 1
            jmp beginupdate
        extremediff:
            mov .obs_activetemp[si+0], 1
            mov .obs_activetemp[si+2], 1
            mov .obs_activetemp[si+4], 1
            mov .obs_activetemp[si+6], 1
            mov .obs_activetemp[si+8], 1
            jmp beginupdate

        beginupdate:
            mov cx, 5                    
            
        updateactive:
            cmp obs_ypos[si], 7          
            jne skip_update
            mov ax, .obs_activetemp[si]
            mov obs_isactive[si], ax     

        skip_update:
            add si, 2                     
            loop updateactive             
            ret
    update_difficulty endp

    calculate_overallscore proc near
    	cmp score_ones, 10
   	    jl check_tens
    	sub score_ones, 10
    	inc score_tens
        check_tens:
    	cmp score_tens, 10
    	jl check_hund
    	sub score_tens, 10
    	inc score_hund
        check_hund:
    	cmp score_hund, 10
    	jl exit_adjust
        
        exit_adjust:
        xor ax, ax           
        mov score_overallhex, ax
        mov al, score_ones
        add score_overallhex, ax
        xor ax, ax           
        mov al, score_tens
        mov bl, 10
        mul bl
        add score_overallhex, ax
        xor ax, ax           
        mov al, score_hund
        mov bl, 100
        mul bl
        add score_overallhex, ax
        ret
    calculate_overallscore endp

    update_enemydifficulty proc
        cmp enemy_state, 0
        jne exit_updatteenemy
        cmp icicle_state, 0
        jne exit_updatteenemy  
        

        cmp score_overallhex, 50
        jl set_intervaleasy

        cmp score_overallhex, 100
        jl set_intervalmedium

        cmp score_overallhex, 150
        jl set_intervalintermediate

        cmp score_overallhex, 200
        jl set_intervalhard

        cmp score_overallhex, 250
        jl set_intervalextreme

        exit_updatteenemy:  ret

        set_intervaleasy:
            mov icicle_velocity, 4
            mov enemy_interval, 10
            jmp check_interval

        set_intervalmedium:
            mov icicle_velocity, 8
            mov enemy_interval, 8

            jmp check_interval

        set_intervalintermediate:
            mov icicle_velocity, 12
            mov enemy_interval, 7

            jmp check_interval

        set_intervalhard:
            mov icicle_velocity, 14
            mov enemy_interval, 4

            jmp check_interval

        set_intervalextreme:
            mov icicle_velocity, 16
            mov enemy_interval, 2
            jmp check_interval

        check_interval:
            
            mov ah, 2ch              
            int 21h
            xor ax, ax
            mov al, dh                   
            inc al
            mov bl, enemy_interval       
            div bl                       
            cmp ah, 0                    
            jne exit_updatteenemy             

        update_enemy:                    
            mov enemy_state, 1
            ret
    update_enemydifficulty endp

     
    _update_obsXpos proc near
        mov al, randomNum            

         
        cmp al, 01
        je obs1_position1
        
         
        cmp al, 02
        je obs1_position2

         
        cmp al, 03
        je obs1_position3

         
        cmp al, 04
        je obs1_position4

        ret                  

        obs1_position1:
            mov obs_xpos[si], 135
            ret

        obs1_position2:
            mov obs_xpos[si], 182
            ret

        obs1_position3:
            mov obs_xpos[si], 223
            ret

        obs1_position4:
            mov obs_xpos[si], 270
            ret

        obs1_exit_xupdate:
            ret
    _update_obsXpos endp

    nurng proc                      ; Core RNG procedure
        reroll:
            mov ax, rngseed         ; Loads current seed into AX
            mov bx, 0A9h            ; Uses a multiplier (169)
            mul bx                  ; Multiply AX by BX
            add ax, 1               ; Add 1 to AX
            mov rngseed, ax         ; Stores new seed back
        
            xor dx, dx              ; Clears DX
            mov bx, 5               ; Modulo 5
            div bx                  ; AX / BX - quotient in AL, remainder in DL
            inc dl                  ; Increments DL, making result range to 1-5, instead of 0-4

            ; Check if the last two results has appeared before, reroll if yes
            cmp dl, last_roll1
            je reroll

            cmp dl, last_roll2
            je reroll

            mov randomNum, dl       ; Stores random result in randomNum
            mov dh, last_roll1      ; Stores last rolled seed to DH
            mov last_roll2, dh      ; Stores DH to last_roll2
            mov last_roll1, dl      ; Stores value of DL in last_roll1
        ret
    nurng endp

    generateseed proc near
        mov ah, 00h                  
        int 1ah
        mov rngseed, dx
        ret
    generateseed endp

    default_gamevalue proc near
        mov enemy_state, 1
        mov coin_state, 1
        mov icicley, 8
        mov icicle_state, 0
        mov si, 0
         
        mov towery[si+0], 17
        mov towery[si+2], 33
        mov towery[si+4], 49
        mov towery[si+6], 65
        mov towery[si+8], 81
        mov towery[si+10], 97
        mov towery[si+12], 113
        mov towery[si+14], 129
        mov towery[si+16], 145
        mov towery[si+18], 162
        mov towery[si+20], 178

         
        mov enemy_state, 0
        mov enemy_y, 8

        mov si, 0
         
        mov obs_ypos[si+0], 23
        mov obs_ypos[si+2], 55
        mov obs_ypos[si+4], 87
        mov obs_ypos[si+6], 119
        mov obs_ypos[si+8], 151
        mov obs_isactive[si+0], 1
        mov obs_isactive[si+2], 0
        mov obs_isactive[si+4], 0
        mov obs_isactive[si+6], 0
        mov obs_isactive[si+8], 0

        mov randomNum, 2              
        call _update_obsXpos
        mov char_xfixedpos, 1
        mov char_y, 0098h
        mov score_ones, 0
        mov score_hund, 0
        mov score_tens, 0
        mov allowscore, 0
        ret
    default_gamevalue endp 

    gameover_input proc near
        mov ah, 00h              
        int 16h                  
        cmp al, 'r'              
        je gameover_keypress        
        cmp al, 'R'              
        je gameover_keypress        

        jmp gameover_input           

        gameover_keypress:
            mov game_state, 0
            call default_gamevalue
            call generateseed
            call _update_obsXpos
            ret
    gameover_input endp

    gameover_rendersprite proc near
            mov si, offset coin
            mov rendercoordX, 136
            mov rendercoordY, 80
            mov _rendersizeX, 9
            mov _rendersizeY, 9
            call _rendersprite

            mov si, offset coin
            mov rendercoordX, 148
            mov rendercoordY, 80
            mov _rendersizeX, 9
            mov _rendersizeY, 9
            call _rendersprite

            mov si, offset coin
            mov rendercoordX, 160
            mov rendercoordY, 80
            mov _rendersizeX, 9
            mov _rendersizeY, 9
            call _rendersprite

            mov si, offset Player_up
            mov rendercoordX, 144
            mov rendercoordY, 96
            mov _rendersizeX, 16
            mov _rendersizeY, 16
            call _rendersprite
    gameover_rendersprite endp

    render_sideboxover proc near
            mov si, offset RightsideBox       
            mov rendercoordX, 93
            mov rendercoordY, 25
            mov _rendersizeX, 07
            mov _rendersizeY, 23
            call _rendersprite

            mov si, offset LeftsideBox      
            mov rendercoordX, 220
            mov rendercoordY, 25
            mov _rendersizeX, 07
            mov _rendersizeY, 23
            call _rendersprite
        
    render_sideboxover endp

    gameover_printtext proc near        
             
            mov ah, 02h              
            mov bh, 00h     
            mov dh, 02    
            mov dl, 12     
            int 10h
            mov ah, 09h              
            mov al, 05fh           
            mov bh, 0          
            mov bl, 0fh              
            mov cx, 16
            int 10h

            mov ah, 02h              
            mov bh, 00h     
            mov dh, 05    
            mov dl, 12     
            int 10h
            mov ah, 09h              
            mov al, 05fh           
            mov bh, 0          
            mov bl, 0fh              
            mov cx, 16
            int 10h 

            mov bp, offset line1_over         
            mov _stringx, 14
            mov _stringy, 4
            mov _stringcolor, 04h
            mov _stringlength, 12
            call _printtext

            mov bp, offset line2_over         
            mov _stringx, 15
            mov _stringy, 16
            mov _stringcolor, 0fh
            mov _stringlength, 6
            call _printtext

            mov bp, offset line3_over        
            mov _stringx, 7
            mov _stringy, 21
            mov _stringcolor, 0fh
            mov _stringlength, 27
            call _printtext

            mov ah, 02h
            mov dh, 10h
            mov dl, 0Eh
            call .printscore

            call Highscore
            mov bp, offset line4_over         
            mov _stringx, 10
            mov _stringy, 18
            mov _stringcolor, 0fh
            mov _stringlength, 11
            call _printtext

            call printhigh


        
        ret
    gameover_printtext endp
    
    playinggame_printtext proc near
        mov ah, 02h          
        mov bh, 00h          
        mov dh, 04h          
        mov dl, 02h          
        int 10h
        mov ah, 09h
        mov dx, offset line1_game        
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 05h
        mov dl, 02h
        int 10h
        mov ah, 09h
        mov dx, offset line2_game        
        int 21h

        mov ah, 02h
        mov bh, 00h
        mov dh, 0eh
        mov dl, 02h
        int 10h
        mov ah, 09h
        mov dx, offset line5_game        
        int 21h

        call calculate_overallscore
        mov ah, 02h
        mov dh, 0eh
        mov dl, 02h
        call .printscore
        ret
    playinggame_printtext endp

    playinggame_input proc near
        mov ah, 01h             ; setup a call to check if a key is pressed 
        int 16h                
        jz exit_input           ; if no key is pressed, exit

        mov ah, 00h             ; return the ascii value of the of the key pressed
        int 16h

         
        cmp al, 57h             ; compares key presssed (stored in al) to ascii of 'w'
        je w_pressed            ; jumps to function where w is pressed
        cmp al, 77h             ; compares key presssed (stored in al) to ascii of 'W'
        je w_pressed            ; jumps to function where W is pressed
        
         
        cmp al, 41h             ; compares key presssed (stored in al) to ascii of 'a'
        je a_pressed            ; jumps to function where a is pressed
        cmp al, 61h             ; compares key presssed (stored in al) to ascii of 'A'
        je a_pressed            ; jumps to function where A is pressed
        
         
        cmp al, 44h             ; compares key presssed (stored in al) to ascii of 'd'
        je d_pressed            ; jumps to function where d is pressed
        cmp al, 64h             ; compares key presssed (stored in al) to ascii of 'D'
        je d_pressed            ; jumps to function where D is pressed

         
        cmp al, 53h             ; compares key presssed (stored in al) to ascii of 's'
        je s_pressed            ; jumps to function where s is pressed
        cmp al, 73h             ; compares key presssed (stored in al) to ascii of 'S'
        je s_pressed            ; jumps to function where S is pressed

         
        jmp exit_input          ; exit function

        w_pressed:                      ; WHEN W IS PRESSSED (ACCELERATE)
            mov ax, y_toplimit          ; sets ax to top height
            cmp char_y, ax              ; compares char_y to top height
            je exit_input               ; if top height and char_y is equal, exit

             
            mov ax, char_velocity       ; sets ax to velocity
            sub char_y, ax              ; subtracts char_y with velocity to add velocity
            jmp exit_input              ; exit if the player is already at the top

        a_pressed:                      ; WHEN A IS PRESSED (MOVE LEFT)
            mov ax, char_xfixedpos      ; sets ax to xfixedpos (player position)
            cmp ax, 01h                 ; compare xfixedpos to the boundary on the left
            je exit_input               ; exit if position is at the boundary

             
            dec char_xfixedpos          ; move the character to the left by decreasing position
            jmp exit_input              ; exit

        s_pressed:                      ; WHEN S IS PRESSED (MOVE DOWN)
            mov ax, y_bottomlimit       ; sets ax to bottomlimit
            cmp char_y, ax              ; compares char_y to bottomlimit
            je exit_input               ; exit if the player is already at the bottom

             
            mov ax, char_velocity       ; sets ax to velocity
            add char_y, ax              ; adds char to velocity to decrease velocity
            jmp exit_input              ; exit

        d_pressed:                      ; WHEN D IS PRESSED (MOVE RIGHT)
            mov ax, char_xfixedpos      ; sets ax to xfixedpos (player position)
            cmp ax, 04h                 ; compare xfixedpos to the boundary 
            je exit_input               ; exit if the player is already at the boundary
        
             
            inc char_xfixedpos          ; move the character to the right by increasing position
            jmp exit_input              ; exit
        exit_input:

            mov ax, char_xfixedpos      ; sets ax to xfixedpos

             
            cmp ax, 01h                 ; compares fixedpos to the boundary on the left
            je position1                ; if player is at the left boundary, jump to pos1
            
             
            cmp ax, 02h                 ; compares fixedpos to the second x position
            je position2                ; if player is at the second x position, jump to pos2

             
            cmp ax, 03h                 ; compares fixedpos to the third x position
            je position3                ; if the player is at the third x position, jump to pos 3

             
            cmp ax, 04h                 ; compares fixedpos to the boundary on the right
            je position4                ; if the player is at the right boundary, jump to pos4

            position1:                  ; POS1
                mov char_x, 0087h       
                jmp exit_update

            position2:                  ; POS2
                mov char_x, 00b7h
                jmp exit_update

            position3:                  ; POS3
                mov char_x, 00dfh
                jmp exit_update

            position4:                  ; POS4
                mov char_x, 010fh
                jmp exit_update

            exit_update:
                ret
    playinggame_input endp

    check_collission proc near
         
         
         
        mov cx, 5
        push si
        mov si, 0

        collission_obstacle:
            cmp obs_isactive[si], 0          
            je exit_collissionobstacle
            
            mov ax, char_x
            add ax, char_size
            cmp ax, obs_xpos[si]
            jng exit_collissionobstacle

            mov ax, obs_xpos[si]
            add ax, char_size
            cmp char_x, ax
            jnl exit_collissionobstacle

            mov ax, char_y
            add ax, char_size
            cmp ax, obs_ypos[si]
            jng exit_collissionobstacle

            mov ax, obs_ypos[si]
            add ax, char_size
            cmp char_y, ax
            jnl exit_collissionobstacle

             
            mov game_state, 2          
            jmp check_state

         
        exit_collissionobstacle:
            add si, 2
            loop collission_obstacle
            pop si
        
         
         
         
        collission_icicle:
            cmp icicle_state, 0
            je exit_collission
            
            mov ax, char_x
            add ax, char_size
            cmp ax, iciclex
            jng exit_collission

            mov ax, iciclex
            add ax, char_size
            cmp char_x, ax
            jnl exit_collission

            mov ax, char_y
            sub ax, 2
            add ax, char_size
            cmp ax, icicley
            jng exit_collission

            mov ax, icicley
            add ax, char_size
            sub ax, 2
            cmp char_y, ax
            jnl exit_collission

             
            mov game_state, 2          
            jmp check_state
        exit_collission:    ret
    check_collission endp

    move_obstacle proc near        
         
        push si
        mov si, 0
        mov cx, 5                                    

        loophere:
            mov ax, y_velocity
            add obs_ypos[si], ax                     

            mov ax, y_bottomlimit
            add ax, 12
            cmp obs_ypos[si], ax                     
            jg returntop_obstacle                    

            add si, 2
            loop loophere                            
            pop si
            ret

        returntop_obstacle:
            mov allowscore, 1                        
            
            mov ax, 7
            mov obs_ypos[si], ax                     

            call nurng                               
            call _update_obsXpos
            add si, 2
            loop loophere                            
            pop si

            ret
    move_obstacle endp

    render_obstacle proc 
         
        render_obstacle1:
            mov _rendersizeX, 18             
            mov _rendersizeY, 17             
            mov si, offset obs_isactive
            mov ax, [si+0]
            cmp ax, 0
            je render_obstacle2
            mov si, offset obs_xpos
            mov ax, [si+0]
            mov rendercoordX, ax              
            mov si, offset obs_ypos
            mov ax, [si+0]
            inc ax
            mov rendercoordY, ax              
            mov si, 0
            call check_leftright
            call _rendersprite
            jmp render_obstacle2

         
        render_obstacle2:
            mov _rendersizeX, 18             
            mov _rendersizeY, 17             
            mov si, offset obs_isactive
            mov ax, [si+2]
            cmp ax, 0
            je render_obstacle3
            mov si, offset obs_xpos
            mov ax, [si+2]
            mov rendercoordX, ax              
            mov si, offset obs_ypos
            mov ax, [si+2]
            inc ax
            mov rendercoordY, ax              
            mov si, 2
            call check_leftright
            call _rendersprite
            jmp render_obstacle3

         
        render_obstacle3:
            mov _rendersizeX, 18             
            mov _rendersizeY, 17             
            mov si, offset obs_isactive
            mov ax, [si+4]
            cmp ax, 0
            je render_obstacle4
            mov si, offset obs_xpos
            mov ax, [si+4]
            mov rendercoordX, ax              
            mov si, offset obs_ypos
            mov ax, [si+4]
            inc ax
            mov rendercoordY, ax              
            mov si, 4
            call check_leftright
            call _rendersprite
            jmp render_obstacle4

         
        render_obstacle4:
            mov _rendersizeX, 18             
            mov _rendersizeY, 17             
            mov si, offset obs_isactive
            mov ax, [si+6]
            cmp ax, 0
            je render_obstacle5
            mov si, offset obs_xpos
            mov ax, [si+6]
            mov rendercoordX, ax              
            mov si, offset obs_ypos
            mov ax, [si+6]
            inc ax
            mov rendercoordY, ax              
            mov si, 6
            call check_leftright
            call _rendersprite
            jmp render_obstacle5

         
        render_obstacle5:
            mov _rendersizeX, 18             
            mov _rendersizeY, 17             
            mov si, offset obs_isactive
            mov ax, [si+8]
            cmp ax, 0
            je exit_renderobstacle
            mov si, offset obs_xpos
            mov ax, [si+8]
            mov rendercoordX, ax              
            mov si, offset obs_ypos
            mov ax, [si+8]
            inc ax
            mov rendercoordY, ax              
            mov si, 8
            call check_leftright
            call _rendersprite
            jmp exit_renderobstacle

        check_leftright:
            cmp obs_xpos[si], 135
            je render_obsleft

            cmp obs_xpos[si], 223
            je render_obsleft

            cmp obs_xpos[si], 182
            je render_obsright

            cmp obs_xpos[si], 270
            je render_obsright

        render_obsleft:
            mov si, offset obstacle_left             
            ret

        render_obsright:
            mov si, offset obstacle_right            
            ret

        exit_renderobstacle:    ret
    render_obstacle endp
   
         
         
         
         
         
         
         
         
         

    _rendersprite proc near          
        push ax
        push bx
        push cx
        push dx
        sub _rendersizeX, 2
        sub _rendersizeY, 2
        mov cx, rendercoordX
        mov dx, rendercoordY
        dec dx
        render_horizontal:
             
            mov ah, 0ch                  
            mov al, [si]                 
            mov bh, 00h                  
            int 10h                      

            inc cx
            inc si                           
            mov ax, cx
            sub ax, rendercoordX
            cmp ax, _rendersizeX
            jng render_horizontal        
                                         
             
            mov cx, rendercoordX
            inc dx
            inc si
            mov ax, dx 
            sub ax, rendercoordY
            cmp ax, _rendersizeY
            jng render_horizontal        
                                         
            pop ax
            pop bx
            pop cx
            pop dx
            ret
    _rendersprite endp

         
         
         
         
         
         
         

    _printtext proc
        mov  ax, ds
        mov  es, ax
        mov dh, _stringy
        mov dl, _stringx
        mov bl, _stringcolor
        mov cx, _stringlength
        mov ax, 1301h   
        mov bh, 00h    
        int 10h
        mov bp, 0
        ret 
    _printtext endp

    render_char proc near
        cmp char_xfixedpos, 1
        je render_leftchar
        cmp char_xfixedpos, 3
        je render_leftchar

        cmp char_xfixedpos, 2
        je render_rightchar
        cmp char_xfixedpos, 4
        je render_rightchar

        render_leftchar:
            mov si, offset Player_left        
            mov ax, char_x
            mov rendercoordX, ax              
            mov ax, char_y
            inc ax
            mov rendercoordY, ax              
            mov _rendersizeX, 17              
            mov _rendersizeY, 17              
            call _rendersprite
            ret

        render_rightchar:
            mov si, offset Player_right        
            mov ax, char_x
            mov rendercoordX, ax              
            mov ax, char_y
            mov rendercoordY, ax              
            mov _rendersizeX, 17              
            mov _rendersizeY, 17
            call _rendersprite
            ret
    render_char endp

    increment_score proc near
        cmp allowscore, 0
        je exit_increment

        mov al, score_rate
        add score_ones, al
    	cmp score_ones, 10
   	    jl exit_increment

    	sub score_ones, 10
    	inc score_tens
    	cmp score_tens, 10
    	jl exit_increment

    	sub score_tens, 10
    	inc score_hund
    	cmp score_hund, 10
    	jl exit_increment
    
    	exit_increment: ret
    increment_score endp

    Highscore proc 
        xor ax, ax           
        mov .highscore, ax
        mov al, tempscore[si+0]
        add .highscore, ax
        xor ax, ax           
        mov al, tempscore[si+1]
        mov bl, 10
        mul bl
        add .highscore, ax
        xor ax, ax           
        mov al, tempscore[si+2]
        mov bl, 100
        mul bl
        add .highscore, ax

        mov ax, score_overallhex
        cmp .highscore, ax
        jnl exit_high
        jmp set_high

        set_high:
            mov al, score_ones
            mov tempscore[si], al    
            mov al, score_tens
            mov tempscore[si+1], al  
            mov al, score_hund
            mov tempscore[si+2], al  
            jmp exit_high
            

        exit_high:  ret
    Highscore endp

    printhigh proc
        mov si, 0
        mov ah, 02h
        mov dh, 18      
        mov dl, 21      
        int 10h

         
    	push dx
        mov dl, tempscore[si+2]
    	add dl, '0'
    	int 21h
        pop dx

    	inc dl               
   	    int 10h
        
         
    	push dx
        mov dl, tempscore[si+1]
    	add dl, '0'
    	int 21h
        pop dx

    	inc dl               
    	int 10h

         

    	push dx
        mov dl, tempscore[si+0]
    	add dl, '0'
    	int 21h
        pop dx

        ret

        printhigh endp

    .printscore proc near     
         
        add dl, 7        
        int 10h

         
    	push dx
        mov dl, score_hund
    	add dl, '0'
    	int 21h
        pop dx

    	inc dl               
   	    int 10h
        
         
    	push dx
        mov dl, score_tens
    	add dl, '0'
    	int 21h
        pop dx

    	inc dl               
    	int 10h

         
    	push dx
        mov dl, score_ones
    	add dl, '0'
    	int 21h
        pop dx

        ret
    .printscore endp

    clear_screen proc near
        mov ah, 00h          
        mov al, 13h          
        int 10h              

        mov ah, 0bh
        mov bh, 00h
        mov bl, 00h
        int 10h
        ret
    clear_screen endp
end main