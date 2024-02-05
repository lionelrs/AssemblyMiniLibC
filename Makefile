CC=gcc
AS=nasm
ASFLAGS=-f elf64
CFLAGS=-Wall -Wextra -Iinclude
LDFLAGS=-L. -lasm
SRC=$(wildcard src/*.asm)
OBJ=$(SRC:src/%.asm=obj/%.o)
TEST_SRC=$(wildcard tests/test_*.c)
TEST_OBJ=$(TEST_SRC:tests/%.c=obj/%.o)
# TEST_MAIN=tests/test_main.c
# TEST_MAIN_OBJ=$(TEST_MAIN:tests/test_main.c=obj/test_main.o)
TEST_EXEC=test_suite

# Targets
all: libasm.so test_suite

libasm.so: $(OBJ)
	$(CC) -shared -o $@ $^ $(LDFLAGS) -fPIC -nostdlib

$(OBJ): obj/%.o : src/%.asm
	@mkdir -p obj
	$(AS) $(ASFLAGS) $< -o $@

test_suite: $(TEST_OBJ) libasm.so
	$(CC) $(CFLAGS) $^ -o $(TEST_EXEC) $(LDFLAGS) -Wl,-rpath,.

$(TEST_OBJ): obj/%.o : tests/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(TEST_MAIN_OBJ): obj/%.o : tests/%.c
	$(CC) $(CFLAGS) -c $< -o $@

test: all
	./$(TEST_EXEC)

clean:
	rm -rf obj

fclean: clean
	rm -f libasm.so $(TEST_EXEC)

re:	fclean all