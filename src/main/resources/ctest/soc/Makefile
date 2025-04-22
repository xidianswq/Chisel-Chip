HEX_DIR = ./hex
DUMP_DIR = ./dump
GCCFLAGS = -march=rv32i -mabi=ilp32 -c
ASFLAGS = -march=rv32i -mabi=ilp32 -misa-spec=2.2 -c
LDFLAGS = -b elf32-littleriscv
OBJCOPYFLAGS = -O binary
ODFLAGS = -An -tx1 -w1 -v
OBJECT = test

# 获取所有源文件
SRCS = test.c $(wildcard device/*.c) 
START = start.S
OBJS = $(SRCS:.c=.o)
START_OBJ = $(START:.S=.o)            

# 清理生成的文件
clean:
	rm -rf $(HEX_DIR) $(DUMP_DIR)
	rm -f $(OBJECT) $(OBJECT).bin $(OBJS) $(START_OBJ)

# 编译和链接
build: $(START_OBJ) $(OBJS)
	mkdir -p $(HEX_DIR) $(DUMP_DIR)
	riscv64-unknown-elf-ld $(LDFLAGS) $(OBJS) $(START_OBJ) -T link.ld -o $(OBJECT)
	riscv64-unknown-elf-objcopy $(OBJCOPYFLAGS) $(OBJECT) $(OBJECT).bin
	od $(ODFLAGS) $(OBJECT).bin >> $(HEX_DIR)/$(OBJECT).hex
	riscv64-unknown-elf-objdump -b elf32-littleriscv -D $(OBJECT) > $(DUMP_DIR)/$(OBJECT).elf.dmp

%.o: %.c
	riscv64-unknown-elf-gcc $(GCCFLAGS) $< -o $@
	
%.o: %.S
	riscv64-unknown-elf-as $(ASFLAGS) $< -o $@
