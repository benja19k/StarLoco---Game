package org.starloco.locos.game.inventory;

import org.starloco.locos.game.object.GameObject;
import org.starloco.locos.game.world.world.World.Couple;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Locos on 18/03/2017.
 */
public class Inventory implements IInventory {

    private List<Couple<GameObject, Integer>> inventory = new ArrayList<>();

    @Override
    public void addItem(GameObject item, int quantity) {
        int template = item.getTemplate().getId();
        List<Couple<GameObject, Integer>> list = this.getItems(template);

        for(Couple<GameObject, Integer> couple : list) {
            if (couple != null) {
                if (couple.getFirst().isSameStats(item)) {
                    couple.setSecond(couple.getSecond() + quantity);
                    return;
                }
            }
        }

        this.inventory.add(new Couple<>(item, quantity));
    }

    @Override
    public void removeItem(GameObject item, int quantity) {
        int template = item.getTemplate().getId();
        List<Couple<GameObject, Integer>> list = this.getItems(template);

        for(Couple<GameObject, Integer> couple : list) {
            if (couple != null && couple.getFirst().isSameStats(item)) {
                this.remove(couple, quantity);
                return;
            }
        }
    }

    @Override
    public void removeItem(int template, int quantity) {
        List<Couple<GameObject, Integer>> list = this.getItems(template);

        for(Couple<GameObject, Integer> couple : list) {
            if (couple != null) {
                this.remove(couple, quantity);
                return;
            }
        }
    }

    @Override
    public List<Couple<GameObject, Integer>> getItems(int template) {
        List<Couple<GameObject, Integer>> items = new ArrayList<>();

        for (Couple<GameObject, Integer> couple : this.inventory) {
            GameObject item = couple.getFirst();

            if (item != null && item.getTemplate() != null && item.getTemplate().getId() == template) {
                items.add(couple);
            }
        }
        return items;
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

    private void remove(Couple<GameObject, Integer> couple, int quantity) {
        if (quantity >= couple.getSecond()) {
            this.inventory.remove(couple);
        } else {
            couple.setSecond(couple.getSecond() - quantity);
        }
    }
}
