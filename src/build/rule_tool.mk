ifndef $(RULE_TOOL_MK)
RULE_TOOL_MK = 1

CC := gcc
AR := ar 
LD := ld 
STRIP := strip 
RANLIB := ranlib 
MAKE := make
#MAKE := make -s

RM := rm -rf

AR_FLAGS := -rc

endif

