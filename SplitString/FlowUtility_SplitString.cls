/**
 * @author   Brett Barlow
 * @version  1.0, 27 Aug 2017
 * @see      <a href="https://github.com/thebrettbarlow/FlowUtilities">GitHub Page</a>
 */
public with sharing class FlowUtility_SplitString {
    @InvocableMethod(label = 'Split Variable By Character')
    public static List<List<String>> splitString(List<FlowRequest> requests) {
        List<List<String>> listOfSplitStrings = new List<List<String>>();
        for(FlowRequest request : requests) {
            String character = request.character;
            // Accounting for whitespace between the split char and the next value
            // For example, Flow multi-select input fields give us this extra space
            String myString = request.myString.replace(character + ' ', character);
            List<String> splitStrings = myString.split(character);
            if(request.uniqueOnly) {
                // I'm doing this quirky thing because we can't return a set
                listOfSplitStrings.add(
                        new List<String>(
                                new Set<String>(splitStrings)
                        )
                );
            } else {
                listOfSplitStrings.add(splitStrings);
            }
        }
        return listOfSplitStrings;
    }
    // This will come from the Flow
    public class FlowRequest {
        @InvocableVariable(label = 'String To Split' required = true)
        public String myString;
        @InvocableVariable(label = 'Character To Split By' required = true)
        public String character;
        @InvocableVariable(label = 'Return Only Unique Values' required = true)
        public Boolean uniqueOnly;
    }
}
