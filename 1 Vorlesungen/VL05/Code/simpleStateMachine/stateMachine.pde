void stateMachine() {
  switch(state) {
    
    case RUHEZUSTAND:
      ruhezustand();
    break;

    case PULSIEREN:
      pulsieren();
    break;
    
    case WIGGLE:
      wiggle();
    break;

  } //<end= switch-block>
}
