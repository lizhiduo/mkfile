BIN := sample

SRC := $(wildcard *.c)
OBJS := $(SRC:.c=.o)

IFLAG := -I $(HOME_DIR)/include
IFLAG += -I $(HOME_DIR)/include/osal

LFLAG := -L .

LIBS := -l$(module)

%.o : %.c
	@$(CC) -c $^ -o $@ $(IFLAG)

all : $(OBJS)
	@$(CC) -o $(BIN) $^ $(IFLAG) $(LFLAG) $(LIBS) 

install:
	cp $(BIN) $(HOME_DIR)

clean:
		@rm -rf *.o *.a $(BIN)
