public errordomain AssertionError {
    FAILURE
}//AssertionError

public void assert_true(bool condition, string message) throws AssertionError {
    if (!condition) {
        throw new AssertionError.FAILURE(message);
    }//if
}//assert_true

