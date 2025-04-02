// Top-level build file (niveau projet)
buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        // Version compatible avec Flutter 3.29
        classpath("com.android.tools.build:gradle:8.1.0")
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.9.23")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Configuration personnalisée du répertoire build
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.set(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.set(newSubprojectBuildDir)

    afterEvaluate {
        // Configuration commune à tous les sous-projets
        dependencies {
            // Ajouter ici les dépendances communes si nécessaire
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
