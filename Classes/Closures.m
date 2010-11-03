//
//  Closures.m
//  BlocksPresentation
//
//  Created by Sean Hess on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Closures.h"


@implementation Closures

-(void)go {
		
	// This shows how a block will store its local scope, event if executed
	// much later. This works for function parameters too. Anything in the local
	// scope. 
	
	NSString * aVariableInLocalScope = @"a variable!"; 
	
	[self doLater: ^{
		NSLog(@"Closures: Still have the variable in scope? %@", aVariableInLocalScope);
	}];
}














































// IGNORE THIS FOR NOW
-(void)doLater:(void(^)(void))block {
	// forces it to execute on the next run loop. 
	[[NSOperationQueue mainQueue] addOperationWithBlock:block];
}

@end
