# CMakeTest
Initial setup for C++ project using Google Test

Goal:

- Keep it simple
- Automatically take care of dependencies
- Recompile only when necessary
- Use GoogleTest as an external project to be downloaded (avoid copy pasting the source in the project by hand)

Build:

- `mkdir build`
- `cd build`
- `cmake ..`
- `make run_unit_tests`
- `./run_unit_tests`
