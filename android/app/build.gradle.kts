import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("com.google.gms.google-services") // Firebase
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

// Load keystore properties
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
    println("Loaded properties: ${keystoreProperties.getProperty("storeFile")}")
}

android {
    namespace = "com.simulation.smile"
    compileSdk = 35
    ndkVersion = "27.0.12077973"

    signingConfigs {
        if (keystoreProperties.isNotEmpty()) {
            create("release") {
                keyAlias = keystoreProperties.getProperty("keyAlias")
                keyPassword = keystoreProperties.getProperty("keyPassword")
                storeFile = rootProject.file(keystoreProperties.getProperty("storeFile"))
                storePassword = keystoreProperties.getProperty("storePassword")
            }
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true // Supports local notifications
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.simulation.smile"
        minSdkVersion(23)
        targetSdkVersion(35) // Android 13
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
    }

    buildTypes {
    getByName("release") {
        if (signingConfigs.findByName("release") != null) {
            signingConfig = signingConfigs.getByName("release")
        }
        isMinifyEnabled = true
        isShrinkResources = true
        proguardFiles(
            getDefaultProguardFile("proguard-android-optimize.txt"),
            "proguard-rules.pro"
        )
    }

    getByName("debug") {
        // Optional: you can also set applicationIdSuffix here for clarity
        // applicationIdSuffix = ".debug"
    }
}

}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
    implementation("androidx.window:window:1.0.0")
    implementation("androidx.window:window-java:1.0.0")
    // Add ML Kit Text Recognition if using native integration
    implementation("com.google.mlkit:text-recognition:16.0.0")
}