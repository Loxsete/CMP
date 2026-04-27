CC      = gcc
CFLAGS  = -Wall -Wextra -std=c99 -Iinclude

SRC     = src/main.c src/lexer.c src/parser.c src/codegen.c
TARGET  = cmp

EXAMPLE = examples/file.cmp

.PHONY: all clean run

all: build $(TARGET)

build:
	mkdir -p build

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $@ $^

run: all
	./$(TARGET) $(EXAMPLE)
	./build/program

clean:
	rm -f $(TARGET) build/program build/program.asm build/program.o
