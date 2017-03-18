package org.starloco.locos.game.inventory;

import org.starloco.locos.game.object.GameObject;
import org.starloco.locos.game.world.world.World.Couple;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by flore on 18/03/2017.
 */
public class Inventory implements IInventory {

    private List<Couple<GameObject, Integer>> inventory = new ArrayList<>();

    @Override
    public void addItem(GameObject item, int quantity) {
        int template = item.getTemplate().getId();
        Couple<GameObject, Integer> couple = this.getItem(template);

        if(couple != null) {
            if(couple.getFirst().isSameStats(item)) {
                couple.setSecond(couple.getSecond() + quantity);
                return;
            }
        }

        this.inventory.add(new Couple<>(item, quantity));
    }

    @Override
    public void removeItem(int template, int quantity) {
        Couple<GameObject, Integer> couple = this.getItem(template);

        if(couple != null) {
            if (quantity > couple.getSecond()) {
                this.inventory.remove(couple);
            } else {
                couple.setSecond(couple.getSecond() - quantity);
            }
        }
    }

    @Override
    public Couple<GameObject, Integer> getItem(int template) {
        for (Couple<GameObject, Integer> pair : this.inventory) {
            GameObject item = pair.getFirst();

            if (item !=null && item.getTemplate() != null && item.getTemplate().getId() == template) {
                return pair;
            }
        }
        return null;
    }

    @Override
    public int getTotalPods() {
        int pods = 0;
        for (Couple<GameObject, Integer> pair : this.inventory) {
            GameObject item = pair.getFirst();

            if (item != null && item.getTemplate() != null) {
                pods += item.getTemplate().getPod() * pair.getSecond();
            }
        }
        return pods;
    }
}
