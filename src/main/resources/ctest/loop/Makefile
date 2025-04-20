HEX_DIR = ./hex
DUMP_DIR = ./dump
GCCFLAGS = -march=rv32i -mabi=ilp32
LDFLAGS = -b elf32-littleriscv
OBJCOPYFLAGS = -O binary
ODFLAGS = -An -tx1 -w1 -v
OBJECT = test

clean:
	rm -rf $(HEX_DIR)
	rm -rf $(DUMP_DIR)	

build:
	mkdir $(HEX_DIR)
	mkdir $(DUMP_DIR)
	riscv64-unknown-elf-gcc $(GCCFLAGS) -c -o $(OBJECT).o $(OBJECT).c
	riscv64-unknown-elf-ld $(LDFLAGS) $(OBJECT).o -T link.ld -o $(OBJECT)
	riscv64-unknown-elf-objcopy $(OBJCOPYFLAGS) $(OBJECT) $(OBJECT).bin
	od $(ODFLAGS) $(OBJECT).bin >> $(HEX_DIR)/$(OBJECT).hex
	riscv64-unknown-elf-objdump -b elf32-littleriscv -D $(OBJECT) > $(DUMP_DIR)/$(OBJECT).elf.dmp
