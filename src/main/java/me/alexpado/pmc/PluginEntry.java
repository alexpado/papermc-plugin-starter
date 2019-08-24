package me.alexpado.pmc;

import org.bukkit.plugin.java.JavaPlugin;

/**
 * Entry point for the template plugin. You should edit
 * this comment by explaining the main purpose of your
 * plugin
 *
 * You should also edit these tags below.
 *
 * @author alexpado
 * @version 1.0-SNAPSHOT
 * @since 1.0-SNAPSHOT
 */
public class PluginEntry extends JavaPlugin {

    @Override
    public void onEnable() {
        // Copy the config.yml in the plugin configuration folder if it doesn't exists.
        this.saveDefaultConfig();
        // TODO : Do something if your plugin needs it (registering commands / listeners)
    }

    @Override
    public void onDisable() {
        // TODO : Do something if your plugin needs it (saving custom configs, clearing cache, closing connections...)
    }

}
