
all:
	$(MAKE) -C amd64
	$(MAKE) -C kern
	ld -melf_i386 -T link.ld -o kernel.bin amd64/*.o kern/*.o

clean:
	rm */*.o
