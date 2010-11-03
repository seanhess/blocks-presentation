//
//  ServiceCallGoogle.m
//  BlocksPresentation
//
//  Created by Sean Hess on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ServiceTime.h"
#import "Request.h"


@implementation ServiceTime

-(void)getCurrentTimeWithCallback:(void(^)(int, int, int))block {
	
	// This would be more useful as an abstraction if it did more work. 
	// But imagine calling a service and doing a lot of work on it
	// You can abstract that into services. 
	
	// This is very similar to thick Data Objects. But the point is
	// that it is asynchronous instead of synchronous. You never have 
	// to worry about whether it's running in a main thread or a background
	// thread. 
	
	void(^callback)(int, int, int) = [block copy];
	
	[Request get:@"http://json-time.appspot.com/time.json?tz=America/Denver" callback: ^(Response * response) {		

		/* 
		 {
		 "tz": "UTC", 
		 "hour": 15, 
		 "datetime": "Wed, 03 Nov 2010 15:24:19 +0000", 
		 "second": 19, 
		 "error": false, 
		 "minute": 24
		 }
		*/
		
		NSDictionary * data = response.json;
		
		callback([[data objectForKey:@"hour"] intValue], [[data objectForKey:@"minute"] intValue], [[data objectForKey:@"second"] intValue]);
		
		[callback release];
	}];
}

// The old away. Ignore the implementation. That's not the point. 
-(void)getCurrentTimeWithTarget:(id)target selector:(SEL)selector {
	[self getCurrentTimeWithCallback:^(int hour, int minute, int second) {
		
		// Note that I *can't* pass back three parameters here. 
		// I have to convert it to one object for the selector
		// I also lose any typing, because I'm dumping it into a dictionary
		
		NSMutableDictionary * results = [NSMutableDictionary dictionary];
		[results setObject:[NSNumber numberWithInt:hour] forKey:@"hour"];
		[results setObject:[NSNumber numberWithInt:minute] forKey:@"minute"];
		[results setObject:[NSNumber numberWithInt:second] forKey:@"second"];		 
		
		[target performSelector:selector withObject:results];
	}];
}

@end
