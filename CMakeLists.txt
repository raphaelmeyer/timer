cmake_minimum_required(VERSION 3.10)
project(Timer)

find_package(Qt5 REQUIRED COMPONENTS Quick Widgets QuickTest)
find_package(Qt5QuickCompiler)

add_subdirectory(src)
add_subdirectory(tests)

add_custom_target(run-tests ALL DEPENDS run-timer-tests)
