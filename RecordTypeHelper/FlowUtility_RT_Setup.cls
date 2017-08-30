/*****************************************************************************
 * Author: Brett Barlow                                                      *
 * Created Date: 8/27/2017                                                   *
 *****************************************************************************
 * Description: This class works together with the FlowUtility_RT_Setup      *
 * class. To use them together, follow these instructions:                   *
 *   1. Drag the FlowUtility_RT_Setup Apex Class into the Flow Designer      *
 *   2. Assign the output into a Collection Variable for you to use later    *
 *   3. When you are ready to get a RecordTypeId, drag the                   *
 *      FlowUtility_RT_GetId class into the Flow Designer and assign the     *
 *      Object API Name, RecordType Developer Name and RT String Collection  *
 *      you just populated into the Input variables                          *
 *   4. The Apex Classes handle the rest                                     *
 *****************************************************************************
 * Other Notes:                                                              *
 *   - More information about this utility and others can be found here:     *
 *     https://github.com/thebrettbarlow/FlowUtilities                       *
 *   - Only use this Apex Class with Visual Flow                             *
 *****************************************************************************/
public with sharing class FlowUtility_RT_Setup {
    /****************************************************************
     * The @InvocableMethod annotation allows Apex Classes to be    *
     * visible in the Flow Designer and Process Builder.            *
     * The label attribute allows us to give this a custom display, *
     * although it doesn't seem to cooperate in the Flow Designer.  *
     ****************************************************************
     * We need to return a List of Lists, even though there is just *
     * 1 Collection being used in the Flow.                         *
     * Yeah, idk why either                                         *
     ****************************************************************/
    @InvocableMethod (label = 'Record Type: Setup')
    public static List<List<String>> setupRTs() {
        List<List<String>> listOfListOfStrings = new List<List<String>>();
        List<String> stringList = new List<String>();
        // This gets all active record types
        List<RecordType> rts = Database.query(FlowUtility_RT_Setup.getRTQuery());
        for(RecordType rt : rts) {
            /******************************************************************
             * We cannot return a map, so instead we will make our own.       *
             * The full string is SObjectName+DeveloperName=RecordTypeId      *
             * The key is SObjectName+DeveloperName                           *
             * The value (referenced in FlowUtility_RT_GetId) is RecordTypeId *
             ******************************************************************/
            stringList.add(rt.SobjectType + '+' + rt.DeveloperName + '=' + rt.Id);
        }
        listOfListOfStrings.add(stringList);
        return listOfListOfStrings;
    }
    /***********************************************************
     * This is a utility method to get all active Record Types *
     ***********************************************************/
    public static String getRTQuery() {
        return 'SELECT Id, SobjectType, DeveloperName ' +
                'FROM RecordType ' +
                'WHERE IsActive = true ';
    }
}
