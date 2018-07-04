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

set(TESTS
  "tst_timer.qml"
  "tst_ArcProgress.qml"
  )

foreach(TEST IN ITEMS ${TESTS})
  add_custom_command(
    COMMAND ${CMAKE_COMMAND} -E copy "${CMAKE_CURRENT_SOURCE_DIR}/${TEST}" "${TEST}"
    OUTPUT "${TEST}"
    DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/${TEST}"
  )
endforeach()

add_custom_target(run-timer-tests ALL
  COMMAND test::timer
  DEPENDS ${TESTS}
  )
