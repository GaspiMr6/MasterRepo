contLobos = 0
intro_hecha = false
mission_hecha = false

marin frances?

onMeetAlcalde(){
    if (mision_hecha == false){ // mision no hecha
        if (cont == 3) { //lobos muertos
            if(intro_hecha) {
                rework();
                mision_hecha = true;
            }
            else{
                rework_no_mission();
            }
        }
        else {
            reminder();
        }
    }
    else {
        post_rework();
    }
}

onBegin(){
    state = 0
    LM = 0                  // lobos muertos
}

onMeetAlc(){
    if (state == 5) {
        post_rework
    }
    if (state = 4)
        st = 5

    if(st = 3)
        st = 5

        diagrama ... 
}



onKillLobo(){
    LM++;
    if(LM > 3) 
        if (state == 0) state = 3
        else            state = 4
}