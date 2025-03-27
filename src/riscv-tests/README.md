# riscv-tests use method
- add `io.globalpointer` logic in `Top.scala`
- compile isa .dump file to bin file by riscv-gnu-toolchain
- run Script used for riscv-tests
```bash
cd Chisel-Chip
# generate hex file in src/riscv-tests/hex
bash tohex.sh
# Test Isa for {package}cpu_riscv_tests in src/main/scala & src/test/scala
sudo bash riscv-tests.sh cpu_riscv_tests cpu
```

> learn more in Chisel-Chip/README.md