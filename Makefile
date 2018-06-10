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


all :
	@make -C src/math 
	@make -C src/osal  
	@make mergeMulLibs
	@make -C demo

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
