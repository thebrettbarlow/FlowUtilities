/*****************************************************************************
 * Author: Brett Barlow                                                      *
 * Created Date: 8/27/2017                                                   *
 *****************************************************************************
 * Description: This class works together with the FlowUtility_RT_Setup      *
 * class. To use them together, follow these instructions:                   *
 *   1. Drag the FlowUtility_RT_Setup Apex Class into the Flow Designer      *
 *   2. Assign the output into a Collection Variable for you to use later    *
 *   3. When you are ready to get a RecordTypeId, drag the                   *
 *   FlowUtility_RT_GetId class into the Flow Designer and assign the        *
 *   Object API Name, RecordType Developer Name and RT String Collection you *
 *   just populated into the Input variables                                 *
 *   4. The Apex Classes handle the rest                                     *
 *****************************************************************************
 * Other Notes:                                                              *
 *   - More information about this utility and others can be found here:     *
 *   - Only use this Apex Class with Visual Flow                             *
 *****************************************************************************/
public with sharing class FlowUtility_RT_GetId {
    /***************************************************************************
     * This is what we need to populate from the flow. Make sure all variables *
     * you pass in are of the Input/Output Type of Input and Output.           *
     ***************************************************************************
     * Variable Descriptions:                                                  *
     * Object API Name must be a String                                        *
     * RT Developer Name must be a String                                      *
     * RT String Collecton must be a Collection of Strings                     *
     ***************************************************************************/
    public class FlowRequest {
        @InvocableVariable(label = 'Object API Name' required = true)
        public String sObjectName;
        @InvocableVariable(label = 'RT Developer Name' required = true)
        public String rtDevName;
        @InvocableVariable(label = 'RT String Collecton' required = true)
        public List<String> rtStrings;
    }
    /****************************************************************
     * The @InvocableMethod annotation allows Apex Classes to be    *
     * visible in the Flow Designer and Process Builder.            *
     * The label attribute allows us to give this a custom display, *
     * although it doesn't seem to cooperate in the Flow Designer.  *
     ****************************************************************
     * We need to pass in a List of FlowRequests, even though the     *
     * Flow will only give us 1.                                      *
     * We need to return a List of Strings, even though there is    *
     * just 1 String being used in the Flow                         *
     * Yeah, idk why either                                         *
     ****************************************************************/
    @InvocableMethod (label = 'Record Type: Get Id')
    public static List<String> getRT(List<FlowUtility_RT_GetId.FlowRequest> requests) {
        List<String> listOfStrings = new List<String>();
        for(FlowUtility_RT_GetId.FlowRequest request : requests) {
            /***************************************************
             * Because we can't pass maps to and from flows,   *
             * we need to loop and check each var individually *
             ***************************************************/
            for(String rtString : request.rtStrings) {
                if(FlowUtility_RT_GetId.rtStringCheck(rtString, request)) {
                    listOfStrings.add(rtString.substringAfter('='));
                    break; // Break when we've found what we're looking for
                }
            }
        }
        return listOfStrings;
    }
    /************************************************
     * This is a helper method to check if this var *
     * contains the RecordTypeId we're looking for  *
     ************************************************/
    private static Boolean rtStringCheck(String rtString, FlowUtility_RT_GetId.FlowRequest request) {
        if(rtString.substringBefore('+') + rtString.substringBetween('+', '=') ==
                request.sObjectName + request.rtDevName) {
            return true;
        } else {
            return false;
        }
    }
}
