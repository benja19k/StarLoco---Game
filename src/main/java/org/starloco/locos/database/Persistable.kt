package org.starloco.locos.database

import kotlin.properties.ObservableProperty
import kotlin.properties.ReadWriteProperty
import kotlin.reflect.KProperty

/**
 * Created by guillaume on 3/11/17.
 */
open class Persistable {
    var dirty = false
        private set

    protected fun <T> monitored(initialValue: T):
            ReadWriteProperty<Any?, T> = object : ObservableProperty<T>(initialValue) {
        override fun afterChange(property: KProperty<*>, oldValue: T, newValue: T) {
            dirty = true
        }
    }

    protected fun onChange() {
        dirty = true
    }

    fun onSave() = {
        dirty = false
    }
}