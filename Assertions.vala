public void assert_true(bool condition, string message) {
    if (!condition) {
        stderr.printf("%s\n", message);
    }//if
}//assert_true

