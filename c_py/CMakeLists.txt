cmake_minimum_required(VERSION 3.22)
project(cpy VERSION 1.0)

find_package(Python3 COMPONENTS Interpreter Development)

set(BINARY_DIR "${CMAKE_BINARY_DIR}/bin")

configure_file(
    resources/script.py
    ${BINARY_DIR}/script.py
    COPYONLY
)

add_executable(cpy src/main.c)

set_target_properties(cpy
    PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY ${BINARY_DIR}
)

target_include_directories(cpy
    PRIVATE
        ${PYTHON_INCLUDE_DIRS}
)

target_link_libraries(cpy
    PRIVATE
        Python3::Python
)