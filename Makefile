.PHONY: all 

all:
	make -C src
	make -C runtime
	make -C regression

clean:
	make clean -C src
	make clean -C runtime
	make clean -C regression
	make clean -C regression/expressions
	make clean -C regression/deep-expressions


