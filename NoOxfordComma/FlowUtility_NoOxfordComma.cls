/*******************************************************************************
 * Author: Brett Barlow                                                        *
 * Created Date: 8/27/2017                                                     *
 *******************************************************************************
 * Description: To transform a collection of strings into a comma seperated    *
 * sentence without an oxford comma, follow these instructions:                *
 *   1. Drag the FlowUtility_NoOxfordComma Apex Class into the Flow Designer   *
 *   2. Assign the String Collection Variable that contains your values to     *
 *      the String Collection input                                            *
 *   3. Assign the word you would like to use at the end of the list of values *
 *      to the Finishing Word input. If my Finishing Word was: or, I would     *
 *      end up with something like this: Value1, Value2 or Value3              *
 *   4. Assign the output to the String Variable you would like to contain the *
 *      comma seperated sentence without an oxford comma                       *                                        *
 *   5. The Apex Class handles the rest                                        *
 *******************************************************************************
 * Other Notes:                                                                *
 *   - More information about this utility and others can be found here:       *
 *   - Only use this Apex Class with Visual Flow                               *
 *******************************************************************************/
public with sharing class FlowUtility_NoOxfordComma {
    /****************************************************************************
     * This is what we need to populate from the flow. Make sure all variables  *
     * you pass in are of the Input/Output Type of Input and Output.            *
     ****************************************************************************
     * Variable Descriptions:                                                   *
     * String Collection must be a Collection of Strings                        *
     * Finishing Word must be a String                                          *
     ****************************************************************************/
    public class FlowRequest {
        @InvocableVariable(label = 'String Collection' required = true)
        public List<String> stringCollection;
        @InvocableVariable(label = 'Finishing Word' required = true)
        public String finishingWord;
    }
    /******************************************************************
     * The @InvocableMethod annotation allows Apex Classes to be      *
     * visible in the Flow Designer and Process Builder.              *
     * The label attribute allows us to give this a custom display,   *
     * although it doesn't seem to cooperate in the Flow Designer.    *
     ******************************************************************
     * We need to pass in a List of FlowRequests, even though the     *
     * Flow will only give us 1.                                      *
     * We need to return a List of Strings, even though there is just *
     * 1 String Variable being used in the Flow.                      *
     * Yeah, idk why either                                           *
     ******************************************************************/
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
}
