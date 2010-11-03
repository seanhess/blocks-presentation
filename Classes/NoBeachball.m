//
//  NoBeachball.m
//  BlocksPresentation
//
//  Created by Sean Hess on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NoBeachball.h"


@implementation NoBeachball

-(IBAction)doFreeze {
	[self freezeTheComputer];
}

-(IBAction)doNotFreeze {
	[self dontFreezeTheComputer];
	[self dontFreezeAndJoinBackToMainThread];
}

-(IBAction)queueAndCancel {
	// Now, let's queue up a bunch of them
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];	
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];	
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];	
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];	
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];	
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];
	[self dontFreezeTheComputer];	
	
	// Awww... smack. Let's cancel!
	[queue cancelAllOperations];
}

-(void)go {
	//[self freezeTheComputer];
	//[self dontFreezeTheComputer];
	//[self dontFreezeAndJoinBackToMainThread];
	
	

}

-(NSInteger)freezeTheComputer {
	
	NSInteger start = 2;
	
	NSLog(@"NoBeachball: START freezeTheComputer - %i", start);	
		
	for (int i = 0; i < 1000000000; i++) {
		start += 1;
	}
	
	NSLog(@"NoBeachball: END freezeTheComputer - %i", start);
	return start;
}

-(void)dontFreezeTheComputer {
	
	// New operation queues run on a background thread.
	
	if (!queue) queue = [NSOperationQueue new];
	
	[queue addOperationWithBlock:^{
		[self freezeTheComputer];
	}];
}

-(void)dontFreezeAndJoinBackToMainThread {
	
	if (!queue) queue = [NSOperationQueue new];
	
	[queue addOperationWithBlock:^{
		[self freezeTheComputer];
		
		[[NSOperationQueue mainQueue] addOperationWithBlock:^{
			NSLog(@"NoBeachball: on the main thread. We could do some drawing here");
		}];
	}];
}

- (void)dealloc {
	[queue release];
	[super dealloc];
}

@end
