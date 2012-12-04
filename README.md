HMDiallingCode
==============

HMDiallingCode gets the dialling code of the user's current location. It uses CoreLocation and reverse geocoding to determine the country of the user, then retrieve it's international dialling code. Additionally, it can be used to get the dialling code for a specific country or the counties that use a specific dialling code.

Usage
-----
Included is a demo project showing how to use the classes.

To use in your own project, first import HMDiallingCode.m, HMDiallingCode.h and DiallingCodes.plist and add CoreLocation to your linked libraries.

Then init your object with a delegate:

```- (id)initWithDelegate:(id<HMDiallingCodeDelegate>)delegate;```

Then call ```getDiallingCodeForCurrentLocation``` to start the retrieval.

You should implement the methods of ```HMDiallingCodeDelegate``` to get call backs after success/failure.

You could use ```getDiallingCodeForCountry``` to get the dialling code for a specific country and ```getCountriesWithDiallingCode``` to get an array of country codes that match a dialling code.

License
--------
Feel free to do whatever you want with this code.

If this code was helpful, I would love to hear from you.

[@HeshamMegid](http://twitter.com/HeshamMegid)   
[http://hesh.am](http://hesh.am)
