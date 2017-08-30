# RecordTypeHelper
Do you ever have Flows that need multiple Record Type Ids? Wouldn't it be nice to just do 1 Lookup that gets all the active Record Types so you can reference them later? Well that's what this Flow Utility does.

You first call a Setup Apex Class that gets your active Record Types. Then each time you need to get one, you call a GetId Apex Class that'll return the Record Type Id as a String Variable for you based on the Object Name and Developer Name of the Record Type.  

For more information on how to use this, check out the the comments within the Apex Classes and the video below:  

[![DedupeStringCollection How-To Video](https://img.youtube.com/vi/123/0.jpg)](https://www.youtube.com/watch?v=123)

[Back to All Flow Utilities](/../../)
