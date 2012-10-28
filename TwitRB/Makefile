APP=TwitRB

.PHONY: all clean run

all: $(APP)

clean:
	rm -f *.o $(APP)

run: all
	@./$(APP)

$(APP): rb_main.rb $(wildcard *.rb)
	macrubyc -o $@ $^
