/**************************************************************************************
 * Author: Brett Barlow                                                               *
 * Created Date: 8/27/2017                                                            *
 **************************************************************************************
 * Description: To deduplicate a collection of strings, follow these instructions:    *
 *   1. Drag the FlowUtility_DedupeStringCollection Apex Class into the Flow Designer *
 *   2. Assign the String Collection Variable you would like to deduplicate to the    *
 *      String Collection input                                                       *
 *   3. Assign the output to the String Collection Variable you would like to contain *
 *      the deduplicated list of values. This can be the same collection variable as  *
 *      in step 2                                                                     *
 *   4. The Apex Class handles the rest                                               *
 **************************************************************************************
 * Other Notes:                                                                       *
 *   - More information about this utility and others can be found here:              *
 *     https://github.com/thebrettbarlow/FlowUtilities                                *
 *   - Only use this Apex Class with Visual Flow                                      *
 **************************************************************************************/
public with sharing class FlowUtility_DedupeStringCollection {
    /***************************************************************************
     * This is what we need to populate from the flow. Make sure all variables *
     * you pass in are of the Input/Output Type of Input and Output.           *
     ***************************************************************************
     * Variable Description:                                                   *
     * String Collection must be a Collection of Strings                       *
     ***************************************************************************/
    public class FlowRequest {
        @InvocableVariable(label = 'String Collection' required = true)
        public List<String> myStrings;
    }
    /****************************************************************
     * The @InvocableMethod annotation allows Apex Classes to be    *
     * visible in the Flow Designer and Process Builder.            *
     * The label attribute allows us to give this a custom display, *
     * although it doesn't seem to cooperate in the Flow Designer.  *
     ****************************************************************
     * We need to pass in a List of FlowRequests, even though the   *
     * Flow will give give us 1.                                    *
     * We need to return a List of Lists, even though there is just *
     * 1 Collection being used in the Flow.                         *
     * Yeah, idk why either                                         *
     ****************************************************************/
    @InvocableMethod (label = 'DeDupe String Collection')
    public static List<List<String>> dedupeStringCollection(List<FlowRequest> requests) {
        List<List<String>> listOfDeDupedLists = new List<List<String>>();
        for(FlowRequest request : requests) {
            /**********************************************************************
             * We can't return a set...                                           *
             * My workaround: Create a new List from a new Set that derives its   *
             * value from request.myStrings, which is a List.                     *
             * We are immediately add this to the list of lists we are returning. *
             **********************************************************************/
            listOfDeDupedLists.add(
                    new List<String>(
                            new Set<String>(request.myStrings)
                    )
            );
        }
        return listOfDeDupedLists;
    }
}
