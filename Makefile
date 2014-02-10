all:
	valac -o run-tests *.vala --pkg gee-1.0
	./run-tests

clean:
	rm run-tests

