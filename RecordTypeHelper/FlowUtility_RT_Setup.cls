/**
 * @author   Brett Barlow
 * @version  1.0, 27 Aug 2017
 * @see      <a href="https://github.com/thebrettbarlow/FlowUtilities">GitHub Page</a>
 */
public with sharing class FlowUtility_RT_Setup {
    @InvocableMethod (label = 'Record Type: Setup')
    public static List<List<String>> setupRTs() {
        List<List<String>> listOfListOfStrings = new List<List<String>>();
        List<String> stringList = new List<String>();
        // This gets all active record types
        List<RecordType> rts = Database.query(FlowUtility_RT_Setup.getRTQuery());
        // Flows don't do maps so we're setting values into a list in this format:
        // SObjectName+DeveloperName=RecordTypeId
        for(RecordType rt : rts) {
            stringList.add(rt.SobjectType + '+' + rt.DeveloperName + '=' + rt.Id);
        }
        listOfListOfStrings.add(stringList);
        return listOfListOfStrings;
    }
    public static String getRTQuery() {
        return 'SELECT Id, SobjectType, DeveloperName ' +
                'FROM RecordType ' +
                'WHERE IsActive = true ';
    }
}
