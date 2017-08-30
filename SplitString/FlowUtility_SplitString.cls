/*****************************************************************************
 * Author: Brett Barlow                                                      *
 * Created Date: 8/27/2017                                                   *
 *****************************************************************************
 * Description: To split a string, follow these instructions:                *
 *   1. Drag the FlowUtility_SplitString Apex Class into the Flow Designer   *
 *   2. Assign the String Variable you would like to split to the            *
 *      String To Split input                                                *
 *   3. Define the character you would like to split your string variable by *
 *      in the Character To Split By input                                   *
 *   4. Define if you would like to only return unique values in the         *
 *      Return Only Unique Values input                                      *
 *   5. The Apex Class handles the rest                                      *
 *****************************************************************************
 * Other Notes:                                                              *
 *   - More information about this utility and others can be found here:     *
 *     https://github.com/thebrettbarlow/FlowUtilities                       *
 *   - Only use this Apex Class with Visual Flow                             *
 *****************************************************************************/
public with sharing class FlowUtility_SplitString {
    /***************************************************************************
     * This is what we need to populate from the flow. Make sure all variables *
     * you pass in are of the Input/Output Type of Input and Output.           *
     ***************************************************************************
     * Variable Description:                                                   *
     * String To Split must be a String                                        *
     * Character To Split By must be a String                                  *
     * Return Only Unique Values must be a Boolean                             *
     ***************************************************************************/
    public class FlowRequest {
        @InvocableVariable(label = 'String To Split' required = true)
        public String myString;
        @InvocableVariable(label = 'Character To Split By' required = true)
        public String character;
        @InvocableVariable(label = 'Return Only Unique Values' required = true)
        public Boolean uniqueOnly;
    }
    /****************************************************************
     * The @InvocableMethod annotation allows Apex Classes to be    *
     * visible in the Flow Designer and Process Builder.            *
     * The label attribute allows us to give this a custom display, *
     * although it doesn't seem to cooperate in the Flow Designer.  *
     ****************************************************************
     * We need to pass in a List of FlowRequests, even though the   *
     * Flow will only give us 1.                                    *
     * We need to return a List of Lists, even though there is just *
     * 1 Collection being used in the Flow.                         *
     * Yeah, idk why either                                         *
     ****************************************************************/
    @InvocableMethod(label = 'Split Variable By Character')
    public static List<List<String>> splitString(List<FlowRequest> requests) {
        List<List<String>> listOfSplitStrings = new List<List<String>>();
        for(FlowRequest request : requests) {
            /**************************************************
             * First, we need to account for any whitespace   *
             * between the split character and the next value *
             **************************************************/
            String character = request.character; // character is used a few times
            String myString = request.myString.replace(character + ' ', character);
            List<String> splitStrings = myString.split(character);
            if(request.uniqueOnly) {
            /**********************************************************************
             * We can't return a set...                                           *
             * My workaround: Create a new List from a new Set that derives its   *
             * value from splitStrings, which is a List.                          *
             * We are immediately add this to the list of lists we are returning. *
             **********************************************************************/
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
}
