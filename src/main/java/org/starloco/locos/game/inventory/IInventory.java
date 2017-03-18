package org.starloco.locos.game.inventory;

import org.starloco.locos.game.object.GameObject;
import org.starloco.locos.game.world.world.World.Couple;

/**
 * Created by Locos on 18/03/2017.
 */
interface IInventory {

    /**
     * Add item to inventory
     *
     * @param item to add
     * @param quantity of item to add
     */
    void addItem(GameObject item, int quantity);

    /**
     * Remove item of inventory
     *
     * @param template item to remove
     * @param quantity to remove
     */
    void removeItem(int template, int quantity);

    /**
     * Get item by template id
     *
     * @param template of item you want to get
     * @return couple with the item and the quantity
     */
    Couple<GameObject, Integer> getItem(int template);

    /**
     * @return totals pods of the inventory
     */
    int getTotalPods();
}
