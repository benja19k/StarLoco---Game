package org.starloco.locos.game.fight.ia;

import org.starloco.locos.game.fight.Fight;
import org.starloco.locos.game.fight.Fighter;

/**
 * Created by Locos on 18/09/2015.
 */
public interface IA {

    Fight getFight();
    Fighter getFighter();
    boolean isStop();
    void setStop(boolean stop);
    void addNext(Runnable runnable, Integer time);

    void apply();
    void endTurn();
}
