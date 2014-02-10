all:
	valac -o run-tests *.vala
	./run-tests

clean:
	rm run-tests

