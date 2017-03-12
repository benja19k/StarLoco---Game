package org.starloco.locos.game.fight.ia.type;

import org.starloco.locos.game.fight.Fight;
import org.starloco.locos.game.fight.Fighter;
import org.starloco.locos.game.fight.ia.AbstractIA;

/**
 * Created by Locos on 18/09/2015.
 */
public class Blank extends AbstractIA {

    public Blank(Fight fight, Fighter fighter) {
        super(fight, fighter, (byte) 1);
    }

    @Override
    public void apply() {
        this.stop = true;
    }
}
