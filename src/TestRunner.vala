using Gee;

public delegate void TestFunction() throws AssertionError;

public class Test {
	private TestFunction test_function;
	private string test_name;
	
	public Test(TestFunction test_function, string test_name) {
		this.test_function = test_function;
		this.test_name     = test_name;
	}//Test
	
	public string get_test_name() {
	    return this.test_name;
	}//get_test_name
	
	public void run() throws AssertionError {
		this.test_function();
	}//run
}//Test

public class TestRunner: Object {
	private ArrayList<Test> tests = new ArrayList<Test>();
	private Reporter reporter;
	
	public TestRunner(Reporter reporter) {
		this.reporter = reporter;
	}
	
	public void add_test(TestFunction test, string test_name) {
		this.tests.add(new Test(test, test_name));
	}//add_test
	
	public void run() {
		foreach (Test test in this.tests) {
			try {
			    test.run();
			    reporter.success(test);
			} catch (AssertionError error) {
				reporter.failure(test, error.message);
			}//try
		}//foreach
	}//run
}//TestRunner


