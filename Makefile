TARGET=hello

CC=gcc
CFLAGS=-O0 -g3 -I$(RENDERED_TEMPLATE_DIR)
TEMPLATE_RENDER_TOOL=./scripts/preprocess.py

SRC_DIR=src
OBJ_DIR=$(BUILD_DIR)/obj
TEMPLATE_DIR=templates
SRCS=$(SRC_DIR)/*.c
TEMPLATES=$(wildcard $(TEMPLATE_DIR)/*.j2)

SRCS=$(wildcard $(addsuffix /*.c,$(SRC_DIR)))
OBJS=$(addprefix $(OBJ_DIR)/,$(patsubst %.c,%.o,$(notdir $(SRCS))))
RENDERED_TEMPLATES=$(addprefix $(RENDERED_TEMPLATE_DIR)/,$(patsubst %.j2,%,$(notdir $(TEMPLATES))))

BUILD_DIR=build
RENDERED_TEMPLATE_DIR=$(BUILD_DIR)/templates

# ===========================================================

default: build

build: prepare_build_dir $(RENDERED_TEMPLATES) $(OBJS) link

link:
	$(CC) -o $(TARGET) $(OBJS)

prepare_build_dir:
	mkdir -p $(BUILD_DIR)
	mkdir -p $(RENDERED_TEMPLATE_DIR)
	mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -o $@ -c $<

$(RENDERED_TEMPLATE_DIR)/%: $(TEMPLATE_DIR)/%.j2
	$(TEMPLATE_RENDER_TOOL) $< > $@

clean:
	rm -rf $(OBJ_DIR)/*.o
	rmdir $(OBJ_DIR)
	rm -rf $(RENDERED_TEMPLATE_DIR)/*
	rmdir $(RENDERED_TEMPLATE_DIR)
	rmdir $(BUILD_DIR)
	rm $(TARGET)

# ===========================================================

debug_makefile:
	@echo $(SRCS)
	@echo $(OBJS)
	@echo $(RENDERED_TEMPLATES)

