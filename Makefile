SOURCE_DIR = source
OBJ_DIR = obj
BIN_DIR = bin

OBJS := $(OBJ_DIR)/main.o \
	$(OBJ_DIR)/hello.o \
	$(OBJ_DIR)/factorial.o

-include $(OBJS:.o=.d)

all: hello

hello: $(OBJS)
	@mkdir -p bin/
	g++ -o bin/hello $(OBJS)

$(OBJ_DIR)/%.o: $(SOURCE_DIR)/%.cpp
	@mkdir -p obj/
	 g++ -c -MMD -o $@ $<

clean:
	rm -fr $(BIN_DIR) $(OBJ_DIR)
