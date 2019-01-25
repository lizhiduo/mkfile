libs:
	@$(MAKE) -f mkfile.mk -C math MODULE=math $(MAKE_TARGET)
	@$(MAKE) -f mkfile.mk -C osal MODULE=osal $(MAKE_TARGET)

depend:
	@$(MAKE) -f makefile libs MAKE_TARGET=depend

clean:
	@$(MAKE) -f makefile libs MAKE_TARGET=clean

.PHONY: clean depend
