# ML Kit Text Recognition and Common Model
-keep class com.google.mlkit.vision.text.** { *; }
-keep class com.google.mlkit.common.model.** { *; }
-dontwarn com.google.mlkit.vision.text.**
-dontwarn com.google.mlkit.common.model.**

# Flutter Local Notifications
-keep class com.dexterous.flutterlocalnotifications.** { *; }
-keep class androidx.core.app.** { *; }
#-keepresources drawable/*