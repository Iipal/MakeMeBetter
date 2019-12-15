NAME := libname.a
NPWD := $(CURDIR)/$(NAME)

CC     := clang
CFLAGS := -Wall -Wextra -Werror -Wunused -MMD

# all .h files must to placed in to "includes" folder(or sub-dirs) only.
ifneq (,$(wildcard ./includes))
IFLAGS := $(addprefix -I,$(shell find ./includes -type d))
endif

# all .c files must to placed in to "srcs" folder(or sub-dirs) only.
ifneq (,$(wildcard ./srcs))
SRCS      := $(shell find srcs -name "*.c")
OBJS      := $(SRCS:.c=.o)
ASMS      := $(SRCS:.c=.S)
LLVM_ASMS := $(SRCS:.c=.ll)
endif

# all submodules or additional libs must to be placed in to libs folder
#  and has it's own folder and Makefile with the same rules as this.
ifneq (,$(wildcard ./libs))
LIBS_DIRS := $(shell find ./libs -maxdepth 1 -type d)
LIBS_DIRS := $(filter-out $(firstword $(LIBS_DIRS)), $(LIBS_DIRS))
LIBS_NAMES = $(join $(LIBS_DIRS),$(addsuffix .a,$(addprefix /,$(notdir $(LIBS_DIRS)))))
endif

DEL  := rm -rf
