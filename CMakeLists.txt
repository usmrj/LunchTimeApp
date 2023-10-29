cmake_minimum_required(VERSION 3.16)

project(HackHeroesProject VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

find_package(Qt6 6.4 REQUIRED COMPONENTS
    Quick
    ShaderTools
    Sql
    Concurrent
)

qt_standard_project_setup()

qt_add_executable(appHackHeroesProject
    main.cpp
)

qt_add_qml_module(appHackHeroesProject
    URI HackHeroesProject
    VERSION 1.0
    QML_FILES

    Main.qml

    Source/Qml/Screens/MainScreen/MainScreen.qml
    Source/Qml/Screens/FoodMenuScreen/FoodMenuScreen.qml
    Source/Qml/Screens/ProfileScreen/ProfileScreen.qml
    Source/Qml/Screens/QRscreen/ScanScreen.qml
    Source/Qml/Screens/SurveyScreen/SurveyScreen.qml
    Source/Qml/Screens/MainScreen/ScreenBackground.qml

    Source/Qml/StaticComponents/TopBar.qml
    Source/Qml/StaticComponents/StaticScreenContent.qml
    Source/Qml/StaticComponents/NavBar.qml
    Source/Qml/Screens/FoodMenuScreen/DayTile.qml
    Source/Qml/Screens/SurveyScreen/SurveyInfo.qml
    Source/Qml/Screens/SurveyScreen/OptionHighlight.qml
    Source/Qml/StaticComponents/LoadingScreen.qml


    #    Assets/Fonts/Roboto-Light.ttf

    RESOURCES
    Assets/Fonts/Roboto-Thin.ttf

    # Style
    SOURCES
    Source/Cpp/Style/Style.h Source/Cpp/Style/Style.cpp

    # Data
    Source/Cpp/Data/Data.h Source/Cpp/Data/Data.cpp
    Source/Cpp/Data/Database/Database.h Source/Cpp/Data/Database/Database.cpp
    Source/Cpp/Data/Time/DateTime.h Source/Cpp/Data/Time/DateTime.cpp
)

qt6_add_shaders(appHackHeroesProject
    "LunchLink_Shaders"

    FILES
    Assets/Shaders/radial_gradient.frag
)

target_include_directories(appHackHeroesProject
    PUBLIC
        Source
    PRIVATE
        Source/Cpp/Style
        Source/Cpp/Data/Time
        Source/Cpp/Data

)


# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appHackHeroesProject PROPERTIES
    #    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appHackHeroesProject
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appHackHeroesProject
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Sql
    PRIVATE Qt6::Concurrent
)

include(GNUInstallDirs)
install(TARGETS appHackHeroesProject
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
