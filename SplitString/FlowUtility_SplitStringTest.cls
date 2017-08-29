/***************************************************************
 * Author: Brett Barlow                                        *
 * Created Date: 8/27/2017                                     *
 * Description: To test the FlowUtility_SplitString Apex Class *
 ***************************************************************/
@isTest
private class FlowUtility_SplitStringTest {
    private static String myString = 'First;Second; Third;First';
    private static String character = ';';

    static testMethod void notUnique() {
        FlowUtility_SplitStringTest.testScenario(false, 4);
    }

    static testMethod void unique() {
        FlowUtility_SplitStringTest.testScenario(true, 3);
    }

    static void testScenario(Boolean uniqueOnly, Integer listSize) {
        // Set up the request
        List<FlowUtility_SplitString.FlowRequest> requests = new List<FlowUtility_SplitString.FlowRequest>();
        FlowUtility_SplitString.FlowRequest request = new FlowUtility_SplitString.FlowRequest();
        request.myString = myString;
        request.character = character;
        request.uniqueOnly = uniqueOnly;
        requests.add(request);

        // Call the method
        List<List<String>> listOfSplitStrings = FlowUtility_SplitString.splitString(requests);

        // Assert that the list has the right number of strings
        for (List<String> splitStrings : listOfSplitStrings) {
            System.assertEquals(listSize, splitStrings.size());
        }
    }
}
