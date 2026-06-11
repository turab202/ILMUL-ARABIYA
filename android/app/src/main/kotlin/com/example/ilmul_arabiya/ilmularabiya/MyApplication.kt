package com.example.ilmul_arabiya.ilmularabiya

import android.app.Application
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import com.ryanheise.audioservice.AudioServicePlugin

class MyApplication : Application() {
    override fun onCreate() {
        super.onCreate()
        // Pre-warm and cache a FlutterEngine for audio_service to use
        val flutterEngine = FlutterEngine(this)
        flutterEngine.dartExecutor.executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault())
        FlutterEngineCache.getInstance().put(AudioServicePlugin.getFlutterEngineId(), flutterEngine)
    }
}
