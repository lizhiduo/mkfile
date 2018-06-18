CC = gcc
AR = ar

module = test

HOME_DIR := $(shell pwd)
export HOME_DIR
export CC
export AR
export module

LIBS_DIR := $(HOME_DIR)/libs
LIBS := $(wildcard $(LIBS_DIR)/*.a)

#FILE_C:=$(subst ./, , $(foreach dir, $(HOME_DIR)/src/osal, $(wildcard $(dir)/*.c)))
FILE_C:=$(wildcard $(HOME_DIR)/src/osal/*.c)
SRC=$(notdir $(FILE_C))
FILE_NAME=$(basename $(SRC))

#FILE_LIBS=$(notdir $(LIBS))
#NAME_LIBS=$(basename $(FILE_LIBS))

#del lib前缀
#DST_LIBS=$(patsubst lib%, %, $(NAME_LIBS))

#*.o替换*.c
OBJS=$(patsubst %.c, %.o, $(SRC))

all:
	@make -C src/math 
	@make -C src/osal  
	@make mergeMulLibs
	@make -C demo

all_test:
	@echo "file_c: "$(FILE_C)
	@echo "src: "$(SRC)
	@echo "name: "$(FILE_NAME)
	#@echo "libs: "$(FILE_LIBS)
	#@echo "name: "$(NAME_LIBS)
	#@echo "dst: "$(DST_LIBS)
	@echo "objs: "$(OBJS)
	

clean:
	@make -C src/math clean 
	@make -C src/osal clean 
	@make -C demo clean 
	@rm -f libs/* 

install:
	@make -C demo install

mergeMulLibs:
	@if [ ! -e objs ]; then \
		mkdir objs; \
		for file in $(LIBS);do \
			cp $$file objs/; \
			f=`basename $$file`; \
			cd objs; \
			$(AR) x $$f; \
			cd ../; \
		done; \
		fi
	@$(AR) crUu lib$(module).a objs/*.o
	@rm -rf objs
	@mv lib$(module).a demo
	@ echo "mergeMulLibs finish..."
