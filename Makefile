SOURCE_DIR = source

OBJS := $(SOURCE_DIR)/main.o \
	$(SOURCE_DIR)/hello.o \
	$(SOURCE_DIR)/factorial.o

-include $(OBJS:.o=.d)

all: hello

hello: $(OBJS)
	@mkdir bin/
	g++ -o bin/hello $(OBJS)

%.o: %.cpp
	 g++ -c -MMD -o $@ $<

clean:
	rm -fr bin/ source/*.o source/*.d
