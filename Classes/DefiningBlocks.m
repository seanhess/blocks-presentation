//
//  DefiningBlocks.m
//  BlocksPresentation
//
//  Created by Sean Hess on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DefiningBlocks.h"


@implementation DefiningBlocks

-(void)go {
	
	// Here are some examples of defining blocks. Remember: Return(^Name)(Parameters)
	
	
	
	// Return(^Name)(Parameters)
	void(^myBlock)(void) = ^(void) {
		NSLog(@"DefiningBlocks: This is my block");
	};
	
	myBlock();	
	
	
	
	// Return(^Name)(Parameters)
	int(^add2)(int) = ^(int a) {
		return a + 2;
	};
	
	NSLog(@"DefiningBlocks: 2 + 2 = %i", add2(2));
	
	
	
	// Return(^Name)(Parameters)
	NSString *(^concat)(NSString*,NSString*) = ^(NSString * a, NSString * b) {
		return [a stringByAppendingString:b];
	};
	
	NSLog(@"DefiningBlocks: Hello? %@", concat(@"Hello ", @"World!"));
	
	
	
	// Shortcut for void parameters. Leave void out, leave parenthesis off of actual block
	void(^logSomething)() = ^ {
		NSLog(@"DefiningBlocks: Something!");
	};
	
	logSomething();
	
	
	
	
	// Inline! As a function parameter. See below
	[self doSomethingAndCallBackWithAString: ^(NSString * message) {
		NSLog(@"DefiningBlocks: Message: %@", message);
	}];
	
	
	
	
	// Using typedef for complicated signatures. 
	typedef NSString * (^ConcatBlock)(NSString *, NSString *);
	
	ConcatBlock concatAgain = ^(NSString * a, NSString * b) {
		return concat(a, b);
	};
	
	NSLog(@"DefiningBlocks: My Name: %@", concatAgain(@"Sean ", @"Hess"));
	
	
	
}

// Return, (^), Parameters - name goes in normal place
-(void)doSomethingAndCallBackWithAString:(void(^)(NSString*))block {
	block(@"This is a string");
}

@end
