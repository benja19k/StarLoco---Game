package org.starloco.locos.core.config

import com.natpryce.konfig.*
import java.io.File
import java.util.*

/**
 * Created by flore on 26/02/2017.
 */
object ConfigReader {
    lateinit var data: Configuration

    init {
        this.createNewConfigurationFileIfNotExists();
        this.reload()
    }

    fun reload() {
        this.data = EnvironmentVariables() overriding ConfigurationProperties.fromFile(File("config.properties"))
    }

    private fun createNewConfigurationFileIfNotExists() {
         if(!File("config.properties").exists()) {
             val content = String(Base64.getDecoder().decode("IyBDb25maWd1cmF0aW9uIGZpbGUgb2YgU3RhckxvY28NCg0KIyBSYXRlIHNlcnZlcg0KcmF0ZS54cCA9IDEuMA0KcmF0ZS5qb2IgPSAxDQpyYXRlLmZhcm0gPSAxDQpyYXRlLmhvbm9yID0gMQ0KcmF0ZS5rYW1hcyA9IDENCg0KDQojIFRDUCBDb25uZWN0aW9uDQpzZXJ2ZXIuaWQgPSAxDQpzZXJ2ZXIua2V5ID0gaml2YWENCnNlcnZlci5ob3N0ID0gMTI3LjAuMC4xDQpzZXJ2ZXIucG9ydCA9IDU1NTUNCg0KZXhjaGFuZ2UuaG9zdCA9IDEyNy4wLjAuMQ0KZXhjaGFuZ2UucG9ydCA9IDM1MzUNCg0KDQojIERhdGFiYXNlIGNvbm5lY3Rpb24NCmRhdGFiYXNlLmxvZ2luLmhvc3QgPSAxMjcuMC4wLjENCmRhdGFiYXNlLmxvZ2luLnBvcnQgPSAzMzA2DQpkYXRhYmFzZS5sb2dpbi51c2VyID0gcm9vdA0KZGF0YWJhc2UubG9naW4ucGFzcyA9DQpkYXRhYmFzZS5sb2dpbi5uYW1lID0gc3RhcmxvY29fbG9naW4NCg0KZGF0YWJhc2UuZ2FtZS5ob3N0ID0gMTI3LjAuMC4xDQpkYXRhYmFzZS5nYW1lLnBvcnQgPSAzMzA2DQpkYXRhYmFzZS5nYW1lLnVzZXIgPSByb290DQpkYXRhYmFzZS5nYW1lLnBhc3MgPQ0KZGF0YWJhc2UuZ2FtZS5uYW1lID0gc3RhcmxvY29fZ2FtZQ0KDQoNCiMgRXh0cmEgb3B0aW9ucw0KbW9kZS5oYWxsb3dlZW4gPSBmYWxzZQ0KbW9kZS5jaHJpc3RtYXMgPSBmYWxzZQ0KbW9kZS5oZXJvaWMgPSBmYWxzZQ0KDQpvcHRpb25zLnN0YXJ0Lm1lc3NhZ2UgPSAiQmllbnZlbnVlIHN1ciBTdGFyTG9jbyAhIg0Kb3B0aW9ucy5zdGFydC5tYXAgPSAwDQpvcHRpb25zLnN0YXJ0LmNlbGwgPSAwDQpvcHRpb25zLnN0YXJ0LmthbWFzID0gMA0Kb3B0aW9ucy5zdGFydC5sZXZlbCA9IDENCg0Kb3B0aW9ucy5ldmVudC5hY3RpdmUgPSBmYWxzZQ0Kb3B0aW9ucy5ldmVudC50aW1lUGVyRXZlbnQgPSAwDQoNCm9wdGlvbnMuYXV0b1JlYm9vdCA9IHRydWUNCm9wdGlvbnMuZW5jcnlwdFBhY2tldCA9IHRydWUNCm9wdGlvbnMuZGVhdGhNYXRjaCA9IGZhbHNlDQpvcHRpb25zLnRlYW1NYXRjaCA9IGZhbHNlDQpvcHRpb25zLmFsbFphYXAgPSBmYWxzZQ0Kb3B0aW9ucy5hbGxFbW90ZSA9IGZhbHNlDQpvcHRpb25zLnN1YnNjcmlwdGlvbiA9IGZhbHNlDQojIEVuZCBvZiBjb25maWd1cmF0aW9u"))
             File("config.properties").printWriter().use { out -> out.write(content) }
        }
    }

    object server : PropertyGroup() {
        val id by intType
        val key by stringType
        val host by stringType
        val port by intType
    }

    object exchange : PropertyGroup() {
        val host by stringType
        val port by intType
    }

    object database : PropertyGroup() {
        object login : PropertyGroup() {
            val host by stringType
            val port by intType
            val user by stringType
            val pass by stringType
            val name by stringType
        }

        object game : PropertyGroup() {
            val host by stringType
            val port by intType
            val user by stringType
            val pass by stringType
            val name by stringType
        }
    }

    object rate : PropertyGroup() {
        val xp by doubleType
        val job by intType
        val farm by intType
        val honor by intType
        val kamas by intType
    }

    object mode : PropertyGroup() {
        val halloween by booleanType
        val christmas by booleanType
        val heroic by booleanType
    }

    object options : PropertyGroup() {
        object start : PropertyGroup() {
            val message by stringType
            val map by intType
            val cell by intType
            val kamas by longType
            val level by intType
        }
        object event : PropertyGroup() {
            val active by booleanType
            val timePerEvent by intType
        }

        val autoReboot by booleanType
        val encryptPacket by booleanType
        val deathMatch by booleanType
        val teamMatch by booleanType
        val allZaap by booleanType
        val allEmote by booleanType
        val subscription by booleanType
    }
}