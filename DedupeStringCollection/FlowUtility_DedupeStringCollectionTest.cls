/**
 * @author   Brett Barlow
 * @version  1.0, 27 Aug 2017
 * @see      <a href="https://github.com/thebrettbarlow/FlowUtilities">GitHub Page</a>
 */
@isTest
private class FlowUtility_DedupeStringCollectionTest {
    private static List<String> myStrings = new List<String>{
            'First', 'Second', 'Third', 'First'
    };

    static testMethod void testDedupeStringCollection() {
        // Set up the request
        List<FlowUtility_DedupeStringCollection.FlowRequest> flowRequests =
                new List<FlowUtility_DedupeStringCollection.FlowRequest>();
        FlowUtility_DedupeStringCollection.FlowRequest flowRequest =
                new FlowUtility_DedupeStringCollection.FlowRequest();
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
