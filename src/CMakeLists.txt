set(SOURCES
  main.cc
  )

qtquick_compiler_add_resources(RESOURCES
  src/qml/timer.qrc
  )

add_executable(timer ${SOURCES} ${RESOURCES})
target_link_libraries(timer
  PRIVATE
  Qt5::Quick
  Qt5::Widgets
  )