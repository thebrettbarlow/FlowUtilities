/************************************************************
 * Author: Brett Barlow                                     *
 * Created Date: 8/27/2017                                  *
 * Description: To test the FlowUtility_RT_GetId Apex Class *
 ************************************************************/
@IsTest
private class FlowUtility_RT_GetIdTest {
    static testMethod void getRT() {
        List<List<String>> listOfListOfRTStrings = FlowUtility_RT_Setup.setupRTs();
        if(listOfListOfRTStrings.size() > 0) {
            for(List<String> listOfRTStrings : listOfListOfRTStrings) {
                // Let's get a record type to test with
                RecordType rt = Database.query(FlowUtility_RT_Setup.getRTQuery() + 'LIMIT 1');

                // And setting up the flow request
                List<FlowUtility_RT_GetId.FlowRequest> requests = new List<FlowUtility_RT_GetId.FlowRequest>();
                FlowUtility_RT_GetId.FlowRequest request = new FlowUtility_RT_GetId.FlowRequest();
                request.rtStrings = FlowUtility_RT_Setup.setupRTs()[0];
                request.sObjectName = rt.SobjectType;
                request.rtDevName = rt.DeveloperName;
                requests.add(request);
                // Call the method
                List<String> rtStrings = FlowUtility_RT_GetId.getRT(requests);

                // Assert that it found the correct Record Type Id
                for(String rtString : rtStrings) {
                    System.assertEquals(rtString, String.valueOf(rt.Id));
                }
            }
        }
    }
}
