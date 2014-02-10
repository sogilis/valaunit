string red(string message) {
	return "\033[31;1m" + message + "\033[0m";
}

string green(string message) {
	return "\033[32;1m" + message + "\033[0m";
}

public class Reporter: Object {
	public void success(Test test) {
	    stdout.printf(green("%s: OK") + "\n", test.get_test_name());
	}
	
	public void failure(Test test, string message) {
		stdout.printf(red("%s: FAIL") + "\n", test.get_test_name());
		stderr.printf("  %s\n", message);
	}
}

