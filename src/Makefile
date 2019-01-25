HOME_DIR := $(shell pwd)
export HOME_DIR

include $(HOME_DIR)/build/rule_tool.mk

all:
	@$(MAKE) depend
	@$(MAKE) libs

libs:
	@$(MAKE) -f makefile -C $(HOME_DIR)/base MODULE=base $(MAKE_TARGET)

depend:
	@$(MAKE) libs MAKE_TARGET=depend

clean:
	@$(MAKE) libs MAKE_TARGET=clean

.PHONY : clean all
