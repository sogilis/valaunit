all:
	valac -o run-tests *.vala --pkg gee-0.8
	./run-tests

clean:
	rm run-tests

