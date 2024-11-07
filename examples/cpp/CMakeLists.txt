# Copyright (C) 2024 twyleg
cmake_minimum_required(VERSION 3.16.3)

project(example)

set(TARGET_NAME example)

find_package(Qt6 COMPONENTS REQUIRED Core Widgets Qml Quick QuickControls2)

add_subdirectory(external/common_qml/)

#
# add source files to target
#
add_executable(${TARGET_NAME}
    main.cc
    ui.qrc
)


#
# set target properties
#
set_target_properties(${TARGET_NAME}
    PROPERTIES
    CXX_STANDARD 17
    INCLUDE_CURRENT_DIR ON
        AUTOMOC ON
        AUTORCC ON
)


#
# link against libs
#
target_link_libraries(${TARGET_NAME}
    Qt::Core
    Qt::Widgets
    Qt::Qml
    Qt::Quick
    Qt::QuickControls2
)
