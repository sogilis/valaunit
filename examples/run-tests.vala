void main (string[] args) {

	TestRunner runner = new TestRunner(new Reporter());
	runner.add_test(test1, "Test 1");
	runner.add_test(test2, "Test 2");
	runner.add_test(test3, "Test 3");
	runner.run();

}//main
