/************************************************************
 * Author: Brett Barlow                                     *
 * Created Date: 8/27/2017                                  *
 * Description: To test the FlowUtility_RT_Setup Apex Class *
 ************************************************************/
@IsTest
private class FlowUtility_RT_SetupTest {
    static testMethod void rtSetup() {
        List<List<String>> listOfListOfStrings = FlowUtility_RT_Setup.setupRTs();
        List<RecordType> rts = Database.query(FlowUtility_RT_Setup.getRTQuery());

        // We're just getting the record types, so not much to test
        for(List<String> listOfStrings : listOfListOfStrings) {
            System.assertEquals(listOfStrings.size(), rts.size());
        }
    }
}
