all:
	$(MAKE) examples/run-tests
	LD_LIBRARY_PATH=src:examples ./examples/run-tests

examples/run-tests: examples/libtests.so
	cd examples/ && valac -X -I. -X -L. -X -I../src -X -L../src -X -ltests -X -lvalaunit --vapidir=. --vapidir=../src -o run-tests run-tests.vala --basedir ./ --pkg valaunit --pkg tests

examples/libtests.so: src/libvalaunit.so examples/Test*.vala
	cd examples/ && valac -X -I../src -X -L../src -X -lvalaunit --vapidir=../src -C -H tests.h --library tests Test*.vala --basedir ./ --pkg valaunit
	cd examples/ && gcc --shared -fPIC -o libtests.so *.c `pkg-config --cflags --libs gee-1.0` -I../src

src/libvalaunit.so: src/*.vala
	cd src/ && valac -C -H valaunit.h --library valaunit *.vala --basedir ./ --pkg gee-1.0
	cd src/ && gcc --shared -fPIC -o libvalaunit.so `pkg-config --cflags --libs gee-1.0` *.c

clean:
	rm -f examples/run-tests
	find examples/ src/ | grep -E '\.c|\.h|\.vapi|\.so' | xargs rm -f

