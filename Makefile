OBJS := main.o hello.o factorial.o

-include $(OBJS:.o=.d)

all: hello

hello: $(OBJS)
	g++ -o hello $(OBJS)

%.o: %.cpp
	 g++ -c -MMD -o $@ $<

clean:
	rm -f hello *.o *.d
