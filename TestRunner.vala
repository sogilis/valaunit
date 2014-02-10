using Gee;

public delegate void TestFunction();

public class Test {
	private TestFunction test_function;
	
	public Test(TestFunction test_function) {
		this.test_function = test_function;
	}
	
	public void run() {
		this.test_function();
	}
}

public class TestRunner: Object {
	private ArrayList<Test> tests = new ArrayList<Test>();
	
	public void add_test(TestFunction test) {
		this.tests.add(new Test(test));
	}
	
	public void run() {
		foreach (Test test in this.tests) {
			test.run();
		}
	}
}

