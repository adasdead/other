cmake_minimum_required(VERSION 3.22)
project(clua VERSION 1.0)

find_package(Lua 5.0)

set(BINARY_DIR "${CMAKE_BINARY_DIR}/bin")

configure_file(
    resources/script.lua
    ${BINARY_DIR}/script.lua
    COPYONLY
)

add_executable(clua src/main.c)

set_target_properties(clua
    PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY ${BINARY_DIR}
)

target_include_directories(clua
    PRIVATE
        ${LUA_INCLUDE_DIRECTORIES}
)

target_link_libraries(clua
    PRIVATE
        ${LUA_LIBRARIES}
)