package org.starloco.locos.database.dynamics.data;

import com.zaxxer.hikari.HikariDataSource;
import org.starloco.locos.game.area.map.GameMap;
import org.starloco.locos.database.dynamics.AbstractDAO;
import org.starloco.locos.game.entity.monster.Monster;
import org.starloco.locos.game.world.world.World;
import org.starloco.locos.game.object.GameObject;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

/**
 * Created by Locos on 15/08/2015.
 */
public class HeroicMobsGroups extends AbstractDAO<Object> {

    public HeroicMobsGroups(HikariDataSource dataSource) { super(dataSource); }

    @Override
    public void load(Object obj) {}

    @Override
    public boolean update(Object obj) { return false; }

    public void load() {
        Result result = null;
        try {
            result = getData("SELECT * FROM `heroic_mobs_groups`;");
            ResultSet RS = result.resultSet;
            while (RS.next()) {
                final Monster.MobGroup group = new Monster.MobGroup(RS.getInt("id"), RS.getInt("cell"), RS.getString("group"), RS.getString("objects"), RS.getShort("stars"));
                final GameMap map = World.world.getMap(RS.getShort("map"));
                if(map != null)
                    map.respawnGroup(group);
            }
        } catch (SQLException e) {
            super.sendError("HeroicMobsGroups load", e);
        } finally {
            close(result);
        }
    }

    public void insert(short map, Monster.MobGroup group, ArrayList<GameObject> array) {
        PreparedStatement prepare = null;
        try {
            final StringBuilder objects = new StringBuilder(), groups = new StringBuilder();

            if(array != null) {
                array.stream().filter(object -> object != null).forEach(object -> objects.append(objects.toString().isEmpty() ? "" : ",").append(object.getId()));
            }
            group.getMobs().values().stream().filter(monster -> monster != null).forEach(monster -> groups.append(groups.toString().isEmpty() ? "" : ";").append(monster.getTemplate().getId()).append(",").append(monster.getLevel()).append(",").append(monster.getLevel()));

            prepare = getPreparedStatement("INSERT INTO `heroic_mobs_groups` VALUES (?, ?, ?, ?, ?, ?);");
            prepare.setInt(1, group.getId());
            prepare.setInt(2, map);
            prepare.setInt(3, group.getCellId());
            prepare.setString(4, groups.toString());
            prepare.setString(5, objects.toString());
            prepare.setInt(6, group.getStarBonus());
            execute(prepare);
        } catch (SQLException e) {
            super.sendError("HeroicMobsGroups insert", e);
        } finally {
            close(prepare);
        }
    }

    public void update(short map, Monster.MobGroup group) {
        PreparedStatement prepare = null;
        try {
            final StringBuilder objects = new StringBuilder(), groups = new StringBuilder();
            group.getObjects().stream().filter(object -> object != null).forEach(object -> objects.append(objects.toString().isEmpty() ? "" : ",").append(object.getId()));
            group.getMobs().values().stream().filter(monster -> monster != null).forEach(monster -> groups.append(groups.toString().isEmpty() ? "" : ";").append(monster.getTemplate().getId()).append(",").append(monster.getLevel()).append(",").append(monster.getLevel()));

            prepare = getPreparedStatement("UPDATE `heroic_mobs_groups` SET `objects` = ? WHERE `id` = ? AND `map` = ? AND `group` = ?;");
            prepare.setString(1, objects.toString());
            prepare.setLong(2, group.getId());
            prepare.setInt(3, map);
            prepare.setString(4, groups.toString());
            execute(prepare);
        } catch (SQLException e) {
            super.sendError("HeroicMobsGroups update", e);
        } finally {
            close(prepare);
        }
    }

    public void delete(short map, Monster.MobGroup group) {
        PreparedStatement prepare = null;
        try {
            final StringBuilder groups = new StringBuilder();
            group.getMobs().values().stream().filter(monster -> monster != null).forEach(monster -> groups.append(groups.toString().isEmpty() ? "" : ";").append(monster.getTemplate().getId()).append(",").append(monster.getLevel()).append(",").append(monster.getLevel()));

            prepare = getPreparedStatement("DELETE FROM `heroic_mobs_groups` WHERE `id` = ? AND `map` = ? AND `group` = ?;");
            prepare.setLong(1, group.getId());
            prepare.setInt(2, map);
            prepare.setString(3, groups.toString());
            execute(prepare);
        } catch (SQLException e) {
            super.sendError("HeroicMobsGroups delete", e);
        } finally {
            close(prepare);
        }
    }

    public void deleteAll() {
        PreparedStatement prepare = null;
        try {
            prepare = getPreparedStatement("DELETE FROM `heroic_mobs_groups`;");
            execute(prepare);
        } catch (SQLException e) {
            super.sendError("HeroicMobsGroups deleteAll", e);
        } finally {
            close(prepare);
        }
    }

    public void loadFix() {
        Result result = null;
        try {
            result = getData("SELECT * FROM `heroic_mobs_groups_fix`;");
            ResultSet RS = result.resultSet;
            while (RS.next()) {
                ArrayList<GameObject> objects = new ArrayList<>();
                for(String value : RS.getString("objects").split(",")) {
                    final GameObject object = World.world.getGameObject(Integer.parseInt(value));
                    if(object != null)
                        objects.add(object);
                }
                GameMap.fixMobGroupObjects.put(RS.getInt("map") + "," + RS.getInt("cell"), objects);
            }
        } catch (SQLException e) {
            super.sendError("HeroicMobsGroups loadFix", e);
        } finally {
            close(result);
        }
    }

    public void insertFix(short map, Monster.MobGroup group, ArrayList<GameObject> array) {
        PreparedStatement prepare = null;
        try {
            final StringBuilder objects = new StringBuilder();
            array.stream().filter(object -> object != null).forEach(object -> objects.append(objects.toString().isEmpty() ? "" : ",").append(object.getId()));

            prepare = getPreparedStatement("INSERT INTO `heroic_mobs_groups_fix` VALUES (?, ?, ?, ?)");
            prepare.setInt(1, map);
            prepare.setInt(2, group.getCellId());
            prepare.setString(3, World.world.getGroupFix(map, group.getCellId()).get("groupData"));
            prepare.setString(4, objects.toString());
            execute(prepare);
        } catch (SQLException e) {
            super.sendError("HeroicMobsGroups insertFix", e);
        } finally {
            close(prepare);
        }
    }

    public void updateFix() {
        PreparedStatement prepare = null;
        try {
            for(Map.Entry<String, ArrayList<GameObject>> entry : GameMap.fixMobGroupObjects.entrySet()) {
                String[] split = entry.getKey().split(",");
                final StringBuilder objects = new StringBuilder();
                entry.getValue().stream().filter(object -> object != null).forEach(object -> objects.append(objects.toString().isEmpty() ? "" : ",").append(object.getId()));

                prepare = getPreparedStatement("UPDATE `heroic_mobs_groups_fix` SET `objects` = ? WHERE `map` = ? AND `cell` = ? AND `group` = ?;");
                prepare.setString(1, objects.toString());
                prepare.setLong(2, Integer.parseInt(split[0]));
                prepare.setInt(3, Integer.parseInt(split[1]));
                prepare.setString(4, World.world.getGroupFix(Integer.parseInt(split[0]), Integer.parseInt(split[1])).get("groupData"));
                execute(prepare);
            }
        } catch (SQLException e) {
            super.sendError("HeroicMobsGroups updateFix", e);
        } finally {
            close(prepare);
        }
    }

    public void deleteAllFix() {
        PreparedStatement prepare = null;
        try {
            prepare = getPreparedStatement("DELETE FROM `heroic_mobs_groups_fix`;");
            execute(prepare);
        } catch (SQLException e) {
            super.sendError("HeroicMobsGroups deleteAllFix", e);
        } finally {
            close(prepare);
        }
    }
}
