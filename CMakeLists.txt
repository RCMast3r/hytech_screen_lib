cmake_minimum_required(VERSION 3.2)
project(hytech_screen_lib LANGUAGES CXX)

find_package(hytech_hal REQUIRED)

add_library(hytech_screen_lib STATIC src/screen.cpp)

target_link_libraries(hytech_screen_lib PUBLIC hytech_hal::hytech_hal)

target_include_directories(hytech_screen_lib
  PUBLIC
  $<INSTALL_INTERFACE:include/hytech_dash_screen_lib>
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/hytech_dash_screen_lib>
  )

