/**
 * @author   Brett Barlow
 * @version  1.0, 27 Aug 2017
 * @see      <a href="https://github.com/thebrettbarlow/FlowUtilities">GitHub Page</a>
 */
public with sharing class FlowUtility_NoOxfordComma {
    @InvocableMethod (label = 'No Oxford Comma')
    public static List<String> getNoOxfordComma(List<FlowUtility_NoOxfordComma.FlowRequest> requests) {
        List<String> noOxfordCommas = new List<String>();
        for(FlowRequest request : requests) {
            List<String> myStrings = request.stringCollection;
            String noOxfordComma = '';
            // Check if there are any words
            if(myStrings.size() > 0) {
                // Then, start with the first word
                noOxfordComma = myStrings[0];
                // Then, check if there is more than 1 word
                if(myStrings.size() > 1) {
                    // If so, loop starting with the 2nd word
                    // and ending before the last word
                    Integer indexBeforeLastWord = myStrings.size() - 1;
                    for(Integer i = 1; i < indexBeforeLastWord; i++) {
                        noOxfordComma += ', ' + myStrings[i];
                    }
                    // Finally, add the last word along with the finishing word
                    noOxfordComma += ' ' + request.finishingWord + ' ' +
                            myStrings[indexBeforeLastWord];
                }
            }
            noOxfordCommas.add(noOxfordComma);
        }
        return noOxfordCommas;
    }
    // This will come from the Flow
    public class FlowRequest {
        @InvocableVariable(label = 'String Collection' required = true)
        public List<String> stringCollection;
        @InvocableVariable(label = 'Finishing Word' required = true)
        public String finishingWord;
    }
}
