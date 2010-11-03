//
//  Services.m
//  BlocksPresentation
//
//  Created by Sean Hess on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Services.h"
#import "ServiceTime.h"

@implementation Services
@synthesize lameMessage;

-(IBAction)doBlocks {
	
	
	// We can run it 2 at a time with block-based services
	
	[self calculateTimeTwiceAndDisplayWithMessage:@"Important Message"];
	[self calculateTimeTwiceAndDisplayWithMessage:@"Unimportant Message"];	
}

-(IBAction)doSelector {
	
	// We can't do this more than once at a time, because we have to use an ivar for the message
	
	[self attemptToDoTheSameThingWithASelectorAndMessage:@"Selector Message"];	
}

// Notice how 
- (void)calculateTimeTwiceAndDisplayWithMessage:(NSString*)message {
	
	// Notice how the entire flow is maintained within this one callback
	// even though we must indent, the flow of the program is obvious
	
	ServiceTime * service = [[ServiceTime new] autorelease];	
	
	[service getCurrentTimeWithCallback: ^(int hour, int minute, int second) {
		NSLog(@"Services - Time Once: %i %i %i withMessage: %@", hour, minute, second, message);
		
		ServiceTime * service = [[ServiceTime new] autorelease];			
		
		[service getCurrentTimeWithCallback:^(int hour, int minute, int second) {
			NSLog(@"Services - Time Twice: %i %i %i withMessage:%@", hour, minute, second, message);
		}];
	}];
}









- (void)attemptToDoTheSameThingWithASelectorAndMessage:(NSString*)message {
	
	// With selectors, we have to split everything into separate methods.
	// The only way to get the message into the log statements below is to store it in an ivar
	// It's not the end of the world, but it's certainly messier. My class doesn't necessarily
	// care about lameMessage. 
	
	self.lameMessage = message;
	
	ServiceTime * service = [[ServiceTime new] autorelease];
	[service getCurrentTimeWithTarget:self selector:@selector(firstTime:)];
}

- (void)firstTime:(NSDictionary*)data {
	NSLog(@"Services - Time Once: %@ %@ %@ withmessage:%@", [data objectForKey:@"hour"], [data objectForKey:@"minute"], [data objectForKey:@"second"], lameMessage);
	
	ServiceTime * service = [[ServiceTime new] autorelease];
	[service getCurrentTimeWithTarget:self selector:@selector(secondTime:)];	
}

- (void)secondTime:(NSDictionary*)data {
	NSLog(@"Services - Time Once: %@ %@ %@ withmessage:%@", [data objectForKey:@"hour"], [data objectForKey:@"minute"], [data objectForKey:@"second"], lameMessage);
}

- (void)dealloc {
	[lameMessage release];
	[super dealloc];
}

@end