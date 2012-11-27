HMDiallingCode
==============

HMDiallingCode gets the dialling code of the user's current location. It uses CoreLocation and reverse geocoding to determine the country of the user, then retrieve it's international dialling code.

Usage
-----
Import HMDiallingCode.m, HMDiallingCode.h and DiallingCodes.plist into your project and add CoreLocation into your linked libraries.

First, init your object with a delegate
```- (id)initWithDelegate:(id<HMDiallingCodeDelegate>)delegate;```

Then call ```getDiallingCode``` to start the retrieval.

You should implement the methods of ```HMDiallingCodeDelegate``` to get call backs after success/failure.

License
--------
Feel free to do whatever you want with this code.