CC = clang
FLAGS = -std=c11 -Wall -Wextra -Werror -Wpedantic -DDEBUG=0

# Вказуємо правильні шляхи до Homebrew для процесорів Apple Silicon (M1/M2/M3/M4)
CFLAGS := -Iinc -I/opt/homebrew/include
LDFLAGS := -L/opt/homebrew/lib -lSDL2 -lSDL2_image -lSDL2_ttf -lm -ldl -lpthread

NAME = endgame
ARCHIVE = $(NAME).a
SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c, obj/%.o, $(SRC))

.PHONY: all clean uninstall reinstall

all: $(NAME)

$(NAME): $(ARCHIVE)
	$(CC) $(FLAGS) -o $(NAME) $(ARCHIVE) $(LDFLAGS)

$(ARCHIVE): $(OBJ)
	ar rcs $(ARCHIVE) $(OBJ)

obj/%.o: src/%.c | obj
	$(CC) $(FLAGS) $(CFLAGS) -c $< -o $@

obj:
	mkdir -p obj

clean:
	rm -rf obj $(ARCHIVE)

uninstall: clean
	rm -f $(NAME)

reinstall: uninstall all