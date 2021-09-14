package com.lollipop.wan_android

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        CheckUpDatePGYPlugin.register(this.flutterEngine!!,this)
        InstallApkPlugin.register(this.flutterEngine!!,this)
    }
}
