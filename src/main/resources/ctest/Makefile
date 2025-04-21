HEX_DIR = ./hex
DUMP_DIR = ./dump
GCCFLAGS = -march=rv32i -mabi=ilp32
LDFLAGS = -b elf32-littleriscv
OBJCOPYFLAGS = -O binary
ODFLAGS = -An -tx1 -w1 -v
OBJECT = test

# 获取所有源文件（test.c 和 device 目录下的所有 .c 文件）
SRCS = test.c $(wildcard device/*.c)
# 生成对应的目标文件列表（.o 文件）
OBJS = $(SRCS:.c=.o)

# 清理生成的文件
clean:
	rm -rf $(HEX_DIR) $(DUMP_DIR)
	rm -f $(OBJECT) $(OBJECT).bin $(OBJS)

# 编译和链接
build: $(OBJS)
	mkdir -p $(HEX_DIR) $(DUMP_DIR)
	riscv64-unknown-elf-ld $(LDFLAGS) $(OBJS) -T link.ld -o $(OBJECT)
	riscv64-unknown-elf-objcopy $(OBJCOPYFLAGS) $(OBJECT) $(OBJECT).bin
	od $(ODFLAGS) $(OBJECT).bin >> $(HEX_DIR)/$(OBJECT).hex
	riscv64-unknown-elf-objdump -b elf32-littleriscv -D $(OBJECT) > $(DUMP_DIR)/$(OBJECT).elf.dmp

# 通用规则：将 .c 文件编译为 .o 文件
%.o: %.c
	riscv64-unknown-elf-gcc $(GCCFLAGS) -c $< -o $@