/**************************************************************************
 * Author: Brett Barlow                                                   *
 * Created Date: 8/27/2017                                                *
 * Description: To test the FlowUtility_DedupeStringCollection Apex Class *
 **************************************************************************/
@isTest
private class FlowUtility_DedupeStringCollectionTest {
    private static List<String> myStrings = new List<String>{
            'First', 'Second', 'Third', 'First'
    };

    static testMethod void testDedupeStringCollection() {
        // Set up the request
        List<FlowUtility_DeDupeStringCollection.FlowRequest> flowRequests =
                new List<FlowUtility_DeDupeStringCollection.FlowRequest>();
        FlowUtility_DeDupeStringCollection.FlowRequest flowRequest =
                new FlowUtility_DeDupeStringCollection.FlowRequest();
        flowRequest.myStrings = myStrings;
        flowRequests.add(flowRequest);

        List<List<String>> myStrings_Deduped =
                FlowUtility_DedupeStringCollection.dedupeStringCollection(flowRequests);

        // Assert that the list was deduped
        for (List<String> strings : myStrings_Deduped) {
            System.assertEquals(3, strings.size());
        }
    }
}
