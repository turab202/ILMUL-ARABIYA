package com.example.ilmul_arabiya.ilmularabiya

import io.flutter.embedding.android.FlutterActivity
import android.content.Context
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.plugins.GeneratedPluginRegistrant
import com.ryanheise.audioservice.AudioServicePlugin

class MainActivity : FlutterActivity() {
	override fun provideFlutterEngine(context: Context): FlutterEngine? {
		return FlutterEngineCache.getInstance().get(AudioServicePlugin.getFlutterEngineId())
	}
	override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
		GeneratedPluginRegistrant.registerWith(flutterEngine)
		// Ensure audio_service uses the same FlutterEngine as the Activity
		FlutterEngineCache.getInstance().put(AudioServicePlugin.getFlutterEngineId(), flutterEngine)
	}
}
