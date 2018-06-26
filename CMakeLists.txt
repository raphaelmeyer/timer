cmake_minimum_required(VERSION 3.10)
project(Timer)

find_package(Qt5 COMPONENTS Quick Widgets REQUIRED)
find_package(Qt5QuickCompiler)

set(SOURCES src/main.cc)
qtquick_compiler_add_resources(RESOURCES src/timer.qrc)

add_executable(timer ${SOURCES} ${RESOURCES})
target_link_libraries(timer
  PRIVATE
    Qt5::Quick
    Qt5::Widgets
)

