ifndef $(RULE_MK)
RULE_MK = 1

OBJS_BASE_DIR := $(HOME_DIR)/build/objs
LIB_DIR := $(HOME_DIR)/build/lib

SRCS := $(subst ./, , $(foreach dir, ., $(wildcard $(dir)/*.c)))

OBJS := $(subst .c,.o, $(SRCS)) # SRCS的.c替换成.o
OBJS_DIR := $(OBJS_BASE_DIR)/$(MODULE)

vpath %.o $(OBJS_DIR) # 在OBJS_DIR目录搜索.o结尾的文件
vpath %.a $(LIB_DIR)

LIB_MODULE := $(MODULE).a
LIB_TARGET := lib$(TARGET_NAME).a

lib : $(LIB_DIR)/$(LIB_MODULE)
	@echo $(LIB_DIR)/$(LIB_MODULE)

$(LIB_DIR)/$(LIB_MODULE) : $(OBJS)
	@echo $(MODULE) : Creating $(LIB_MODULE)
	$(AR) $(AR_FLAGS) $(LIB_DIR)/$(LIB_MODULE) $(OBJS_DIR)/*.o
	$(AR) $(AR_FLAGS) $(LIB_DIR)/$(LIB_TARGET) $(OBJS_DIR)/*.o
	
depend:
	@echo $(MODULE) : Make dir ...
	-mkdir -p $(OBJS_DIR) $(LIB_DIR)
	$(CC) $(C_FLAGS) $(SRCS) -MM > MAKEFILE.DEPEND

clean:
	@echo $(MODULE) : Deling ...
	$(RM) MAKEFILE.DEPEND
	$(RM) $(OBJS_BASE_DIR) $(LIB_DIR)

.c.o:
	@echo $(MODULE) : Compiling $<
	$(CC) $(C_FLAGS) -c -o $(OBJS_DIR)/$@ $<

-include MAKEFILE.DEPEND #忽略包含的文件不存在时错误提示

endif

