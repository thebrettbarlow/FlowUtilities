/*****************************************************************
 * Author: Brett Barlow                                          *
 * Created Date: 8/27/2017                                       *
 * Description: To test the FlowUtility_NoOxfordComma Apex Class *
 *****************************************************************/
@IsTest
private class FlowUtility_NoOxfordCommaTest {
    private static String keyToSplitOn = ';';
    private static String finishingWord = 'or';
    private static String string1 = 'One';
    private static String string2 = 'Two';
    private static String string3 = 'Three';
    private static List<String> myStrings = new List<String>();
    private static String string0_Expected = '';
    private static String string1_Expected = 'One';
    private static String string2_Expected = 'One or Two';
    private static String string3_Expected = 'One, Two or Three';

    static testMethod void testZeroStrings() {
        FlowUtility_NoOxfordCommaTest.testStringToSplit(myStrings, string0_Expected);
    }
    static testMethod void testOneString() {
        myStrings.add(string1);
        FlowUtility_NoOxfordCommaTest.testStringToSplit(myStrings, string1_Expected);
    }
    static testMethod void testTwoStrings() {
        myStrings.add(string1);
        myStrings.add(string2);
        FlowUtility_NoOxfordCommaTest.testStringToSplit(myStrings, string2_Expected);
    }
    static testMethod void testThreeStrings() {
        myStrings.add(string1);
        myStrings.add(string2);
        myStrings.add(string3);
        FlowUtility_NoOxfordCommaTest.testStringToSplit(myStrings, string3_Expected);
    }

    static void testStringToSplit(List<String> myStrings, String stringToSplit_Expected) {
        // Set up the flow request
        List<FlowUtility_NoOxfordComma.FlowRequest> requests =
                new List<FlowUtility_NoOxfordComma.FlowRequest>();
        FlowUtility_NoOxfordComma.FlowRequest request =
                new FlowUtility_NoOxfordComma.FlowRequest();
        request.stringCollection = myStrings;
        request.finishingWord = finishingWord;
        requests.add(request);

        // Call the method
        List<String> noOxfordCommas = FlowUtility_NoOxfordComma.getNoOxfordComma(requests);
        for(String noOxfordComma : noOxfordCommas) {
            System.assertEquals(stringToSplit_Expected, noOxfordComma);
        }
    }
}
