pluginManagement {
    repositories {
        mavenLocal()
        google {
            content {
                includeGroupByRegex("com\\.android.*")
                includeGroupByRegex("com\\.google.*")
                includeGroupByRegex("androidx.*")
            }
        }
        mavenCentral()
        gradlePluginPortal()
    }
}
plugins {
    id("org.gradle.toolchains.foojay-resolver-convention") version "1.0.0"
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        mavenLocal()
        google()
        mavenCentral()
    }
}

rootProject.name = "Swift Android Examples"

// swift-java examples
include(":swift-java-weather-app-weather-lib")
project(":swift-java-weather-app-weather-lib").projectDir = file("swift-java-weather-app/weather-lib")
include(":swift-java-weather-app-weather-app")
project(":swift-java-weather-app-weather-app").projectDir = file("swift-java-weather-app/weather-app")
