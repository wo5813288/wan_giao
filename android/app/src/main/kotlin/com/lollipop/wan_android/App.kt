package com.lollipop.wan_android

import android.app.Application
import com.pgyer.pgyersdk.PgyerSDKManager
import io.flutter.app.FlutterApplication

/**
 * created by Lollipop
 * on 2021/9/14
 */
class App:FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        PgyerSDKManager.Init().setContext(this).start()
    }
}