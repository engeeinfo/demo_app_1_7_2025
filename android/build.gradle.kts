allprojects {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

allprojects {
    buildscript {
        repositories {
            maven {
                url = uri("https://rb-artifactory.bosch.com:443/artifactory/maven-central-remote/")
            }
            google()
            mavenCentral()
            gradlePluginPortal()
        }
    }

    repositories {
        maven {
            url = uri("https://rb-artifactory.bosch.com:443/artifactory/maven-central-remote/")
        }
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

rootProject.buildDir = File("..", "build")

subprojects {
    buildDir = File(rootProject.buildDir, name)
}

subprojects {
    evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.buildDir)
}
