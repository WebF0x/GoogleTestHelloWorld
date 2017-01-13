# Build settings
CXX = g++ # C++ Compiler
LD = g++ # Linker
INCLUDE = -Iinclude
CFLAGS = -g -std=c++14
OBJ_DIR = obj
BIN_DIR = bin

# Libraries
LIBRARIES_TEST =
LIBRARIES_APP =

# Executable path
EXECUTABLE_TEST = $(BIN_DIR)/test/test
EXECUTABLE_APP = $(BIN_DIR)/app/app

# Source files
SOURCES_TEST = test/main.cpp \
	source/factorial.cpp \
	source/hello.cpp
SOURCES_APP = source/main.cpp \
	source/factorial.cpp \
	source/hello.cpp

# Objects
OBJECTS_TEST := $(SOURCES_TEST:%.cpp=$(OBJ_DIR)/%.o)
OBJECTS_APP := $(SOURCES_APP:%.cpp=$(OBJ_DIR)/%.o)

# Build targets
all: test app
test: $(EXECUTABLE_TEST)
app: $(EXECUTABLE_APP)

# Link executable
$(EXECUTABLE_TEST): $(OBJECTS_TEST)
	@echo Linking: $@
	@mkdir -p $(@D)
	@$(LD) -o $@ $^ $(LIBRARIES_TEST)

$(EXECUTABLE_APP): $(OBJECTS_APP)
	@echo Linking: $@
	@mkdir -p $(@D)
	@$(LD) -o $@ $^ $(LIBRARIES_APP)

# Compile only if a dependency was modified
DEPENDENCIES_TEST := $(OBJECTS_TEST:.o=.d)
DEPENDENCIES_APP := $(OBJECTS_APP:.o=.d)
-include $(DEPENDENCIES_TEST)
-include $(DEPENDENCIES_APP)

# Rule to compile any object
$(OBJ_DIR)/%.o: %.cpp
	@echo Compiling: $@
	@mkdir -p $(@D)
	@$(CXX) $(CFLAGS) $(INCLUDE) -c -MMD -o $@ $<

# Erase generated files
clean:
	@echo Cleaning
	@rm -rf $(OBJ_DIR) $(BIN_DIR)

# Tell 'make' these rules do not have a corresponding file
# Without this, an unrelated file with the same name as the build rule could prevent from building
.PHONY: clean all test app
