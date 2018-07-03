qtquick_compiler_add_resources(RESOURCES qml/timer.qrc)

add_library(timer-lib SHARED ${RESOURCES})
add_library(timer::timer-lib ALIAS timer-lib)

target_link_libraries(timer-lib
  PRIVATE
    Qt5::Quick
  )

add_executable(timer main.cc)
add_executable(timer::timer ALIAS timer)

target_link_libraries(timer
  PRIVATE
    timer::timer-lib
    Qt5::Quick
    Qt5::Widgets
  )