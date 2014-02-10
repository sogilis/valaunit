void main (string[] args) {

	TestRunner runner = new TestRunner();
	runner.add_test(test1);
	runner.add_test(test2);
	runner.add_test(test3);
	runner.run();

}//main
