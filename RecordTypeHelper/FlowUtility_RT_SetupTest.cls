/**
 * @author   Brett Barlow
 * @version  1.0, 27 Aug 2017
 * @see      <a href="https://github.com/thebrettbarlow/FlowUtilities">GitHub Page</a>
 */
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
