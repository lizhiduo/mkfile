module_name := osal

SRC := $(wildcard *.c)
OBJS := $(SRC:.c=.o)

%.o : %.c
	$(CC) -c $^ -o $@

all : $(OBJS)
	@$(AR) -r lib$(module_name).a $^
	@cp lib$(module_name).a $(HOME_DIR)/libs

clean:
	@rm -rf *.o *.a

