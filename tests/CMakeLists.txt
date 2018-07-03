add_executable(timer-tests
  main.cc
  )
add_executable(test::timer ALIAS timer-tests)

target_link_libraries(timer-tests
  PRIVATE
    Qt5::QuickTest
    Qt5::Quick
    timer::timer-lib
  )

target_compile_definitions(timer-tests
  PRIVATE
    "QUICK_TEST_SOURCE_DIR=\"${CMAKE_CURRENT_BINARY_DIR}\""
  )

add_custom_command(
  COMMAND ${CMAKE_COMMAND} -E copy "${CMAKE_CURRENT_SOURCE_DIR}/tst_timer.qml" "tst_timer.qml"
  OUTPUT "tst_timer.qml"
  DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/tst_timer.qml"
)

add_custom_target(run-timer-tests ALL
  COMMAND test::timer
  DEPENDS "tst_timer.qml"
  )
