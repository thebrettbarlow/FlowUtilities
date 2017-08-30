# Salesforce Flow Utilities Library
Visual Flow is a powerful tool, but it does have its limitations. This library contains Apex Classes that will help you to do things in Flow that would've otherwise been difficult or impossible to do.

### DedupeStringCollection
Have you ever needed to deduplicate a String Collection in a Flow? You could use loops, decisions and assignments to do this in Flow but it's not efficient and will fail if your collection is too large. Instead, just pass this Flow Utility the collection you need to dedupe and it'll return a deduped version.

### NoOxfordComma
What would you do if you had a collection of values and need to display them on a screen in a human-readable format? Well that would be difficult to do in a Flow, but this Flow Utility will turn those values into a comma separated sentence without the Oxford Comma. Just pass it the String Collection and Finishing Word and it'll return a String Variable for you to use.

### RecordTypeHelper
Do you ever have Flows that need multiple Record Type Ids? Wouldn't it be nice to just do 1 Lookup that gets all the active Record Types and reference them later? Well that's what this Flow Utility does.

You first call a Setup Apex Class that gets your active Record Types. Then each time you need to get one, you call a GetId Apex Class that'll return the Record Type Id as a String Variable for you based on the Object Name and Developer Name of the Record Type.

### SplitString
