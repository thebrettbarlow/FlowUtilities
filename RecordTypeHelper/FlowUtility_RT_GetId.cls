/**
 * @author   Brett Barlow
 * @version  1.0, 27 Aug 2017
 * @see      <a href="https://github.com/thebrettbarlow/FlowUtilities">GitHub Page</a>
 */
public with sharing class FlowUtility_RT_GetId {
    @InvocableMethod (label = 'Record Type: Get Id')
    public static List<String> getRT(List<FlowUtility_RT_GetId.FlowRequest> requests) {
        List<String> listOfStrings = new List<String>();
        for(FlowUtility_RT_GetId.FlowRequest request : requests) {
            // I'm doing this because we can't pass Maps from Flows
            for(String rtString : request.rtStrings) {
                if(FlowUtility_RT_GetId.rtStringCheck(rtString, request)) {
                    listOfStrings.add(rtString.substringAfter('='));
                    break; // Break when we've found what we're looking for
                }
            }
        }
        return listOfStrings;
    }
    private static Boolean rtStringCheck(String rtString, FlowUtility_RT_GetId.FlowRequest request) {
        if(rtString.substringBefore('+') + rtString.substringBetween('+', '=') ==
                request.sObjectName + request.rtDevName) {
            return true;
        } else {
            return false;
        }
    }
    // This will come from the Flow
    public class FlowRequest {
        @InvocableVariable(label = 'Object API Name' required = true)
        public String sObjectName;
        @InvocableVariable(label = 'RT Developer Name' required = true)
        public String rtDevName;
        @InvocableVariable(label = 'RT String Collecton' required = true)
        public List<String> rtStrings;
    }
}
