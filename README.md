# Salesforce Flow Utilities Library
Visual Flow is a powerful tool, but does have its limitations. This library contains Apex Classes that will help you do things in Flow that are difficult or impossible to do without using Apex.

Currently, the Library contains these Flow Utilities:
* [DedupeStringCollection](#dedupestringcollection)
* [NoOxfordComma](#nooxfordcomma)
* [RecordTypeHelper](#recordtypehelper)
* [SplitString](#splitstring)

### DedupeStringCollection
Have you ever needed to deduplicate a String Collection in a Flow? You could use Loops, Decisions and Assignments to do this in Flow but it's not efficient and will fail if your Collection is too large. Instead, just pass this Flow Utility the String Collection you need to dedupe and it'll return a deduped version.  

Click here to [Dive Deeper](./DedupeStringCollection) or here to go [Back to the Top](#salesforce-flow-utilities-library)

### NoOxfordComma
What would you do if you had a String Collection of values and needed to display them on a screen in a human-readable format? Well, this Flow Utility will turn those values into a comma separated sentence without the Oxford Comma.

Just pass it the String Collection and Finishing Word you want to use and it'll return a String Variable for you to use. Example with "and" as my Finishing Word: Value 1, Value 2 and Value 3  

Click here to [Dive Deeper](./NoOxfordComma) or here to go [Back to the Top](#salesforce-flow-utilities-library)

### RecordTypeHelper
Do you ever have Flows that need multiple Record Type Ids? Wouldn't it be nice to just do 1 Lookup that gets all the active Record Types so you can reference them later? Well, that's what this Flow Utility does.

You first call a Setup Apex Class that gets your active Record Types. Then each time you need to get one, you call a GetId Apex Class that'll return the Record Type Id as a String Variable for you based on the Object Name and Developer Name of the Record Type.  

Click here to [Dive Deeper](./RecordTypeHelper) or here to go [Back to the Top](#salesforce-flow-utilities-library)

### SplitString
Splitting String Variables in Flows is way harder than it needs to be. Did you know there's a .split() method in Apex? That's way easier!

Just pass this the String Variable you need to split, tell it which character separates your values and it'll pass you back a String Collection Variable containing those values.  

Click here to [Dive Deeper](./SplitString) or here to go [Back to the Top](#salesforce-flow-utilities-library)
