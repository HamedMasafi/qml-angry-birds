cmake_minimum_required(VERSION 3.16)

project(QML-AngryBirds VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appQML-AngryBirds
    main.cpp

    levelfactory.cpp levelfactory.h

    # qml/qml.qrc
)

qt_add_qml_module(appQML-AngryBirds
    URI AngryBirds
    VERSION 1.0
    RESOURCE_PREFIX /

    QML_FILES
        qml/Archery.qml
        qml/BoxEntity.qml
        qml/Column.qml
        qml/Entity.qml
        qml/LevelChoose.qml
        qml/Main.qml
        qml/Pig.qml
        qml/Timber.qml
        qml/WoodBox.qml
        qml/Bird.qml
        qml/CircleEntity.qml
        qml/CreateLevel.qml
        qml/ItemEditor.qml
        qml/Line.qml
        qml/Nut.qml
        qml/Play.qml
        qml/Wall.qml

    RESOURCES
        "qml/img/archery-displace.png"
        "qml/img/glass-circle (2).png"
        "qml/img/glass-rectangle (6).png"
        "qml/img/stone-circle (1).png"
        "qml/img/stone-rectangle (5).png"
        "qml/img/stone-triangle (2).png"
        "qml/img/wood-rectangle (2).png"
        "qml/img/wood-rectangle (9).png"
        "qml/img/archery.png"
        "qml/img/glass-rectangle (1).png"
        "qml/img/glass-slice.png"
        "qml/img/stone-circle (2).png"
        "qml/img/stone-rectangle (6).png"
        "qml/img/wood-circle (1).png"
        "qml/img/wood-rectangle (3).png"
        "qml/img/wood-slice.png"
        "qml/img/bg.png"
        "qml/img/glass-rectangle (2).png"
        "qml/img/glass-triangle (1).png"
        "qml/img/stone-rectangle (1).png"
        "qml/img/stone-rectangle (7).png"
        "qml/img/wood-circle (2).png"
        "qml/img/wood-rectangle (4).png"
        "qml/img/wood-triangle (1).png"
        "qml/img/bird.png"
        "qml/img/glass-rectangle (3).png"
        "qml/img/glass-triangle (2).png"
        "qml/img/stone-rectangle (2).png"
        "qml/img/stone-rectangle (8).png"
        "qml/img/wood-rectangle (10).png"
        "qml/img/wood-rectangle (5).png"
        "qml/img/wood-triangle (2).png"
        "qml/img/bird-slice.png"
        "qml/img/glass-rectangle (4).png"
        "qml/img/pig.png"
        "qml/img/stone-rectangle (3).png"
        "qml/img/stone-slice.png"
        "qml/img/wood-rectangle (11).png"
        "qml/img/wood-rectangle (6).png"
        "qml/img/glass-circle (1).png"
        "qml/img/glass-rectangle (5).png"
        "qml/img/pig-slice.png"
        "qml/img/stone-rectangle (4).png"
        "qml/img/stone-triangle (1).png"
        "qml/img/wood-rectangle (1).png"
        "qml/img/wood-rectangle (7).png"

        qml/levels/Car.level
        qml/levels/Medium.level
        qml/levels/Simple.level

        qml/data.js
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQML-AngryBirds PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQML-AngryBirds
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

add_subdirectory(3rdparty/qml-box2d)

message(BOX2D name = ${QML_BOX2D_LIBRARY_NAME})
target_link_libraries(appQML-AngryBirds
    PRIVATE
        Qt6::Quick
        qmlbox2d
)

include(GNUInstallDirs)
install(TARGETS appQML-AngryBirds
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
