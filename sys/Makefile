
all:
	$(MAKE) -C i386
	$(MAKE) -C kern
	ld -melf_i386 -T i386/link.ld -o kernel.bin i386/*.o kern/*.o

clean:
	rm */*.o
