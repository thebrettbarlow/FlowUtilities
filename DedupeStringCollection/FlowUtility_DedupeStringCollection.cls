/**
 * @author   Brett Barlow
 * @version  1.0, 27 Aug 2017
 * @see      <a href="https://github.com/thebrettbarlow/FlowUtilities">GitHub Page</a>
 */
public with sharing class FlowUtility_DedupeStringCollection {
    @InvocableMethod (label = 'DeDupe String Collection')
    public static List<List<String>> dedupeStringCollection(List<FlowRequest> requests) {
        List<List<String>> listOfDeDupedLists = new List<List<String>>();
        for(FlowRequest request : requests) {
            // I'm doing this quirky thing because we can't return a set
            listOfDeDupedLists.add(
                    new List<String>(
                            new Set<String>(request.myStrings)
                    )
            );
        }
        return listOfDeDupedLists;
    }
    // This will come from the Flow
    public class FlowRequest {
        @InvocableVariable(label = 'String Collection' required = true)
        public List<String> myStrings;
    }
}