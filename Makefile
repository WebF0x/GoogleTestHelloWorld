SOURCE_DIR = source
OBJ_DIR = obj
BIN_DIR = bin
EXECUTABLE := $(BIN_DIR)/hello

OBJECTS := $(OBJ_DIR)/main.o \
	$(OBJ_DIR)/hello.o \
	$(OBJ_DIR)/factorial.o

DEPENDENCIES := $(OBJECTS:.o=.d)

-include $(DEPENDENCIES)

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	@mkdir -p $(BIN_DIR)
	g++ -o $(EXECUTABLE) $(OBJECTS)

$(OBJ_DIR)/%.o: $(SOURCE_DIR)/%.cpp
	@mkdir -p $(OBJ_DIR)
	 g++ -c -MMD -o $@ $<

clean:
	rm -fr $(BIN_DIR) $(OBJ_DIR)
