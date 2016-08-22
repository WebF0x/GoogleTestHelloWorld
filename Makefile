SOURCE_DIR = source

OBJS := $(SOURCE_DIR)/main.o \
	$(SOURCE_DIR)/hello.o \
	$(SOURCE_DIR)/factorial.o

-include $(OBJS:.o=.d)

all: hello

hello: $(OBJS)
	g++ -o hello $(OBJS)

%.o: %.cpp
	 g++ -c -MMD -o $@ $<

clean:
	rm -f hello source/*.o source/*.d
