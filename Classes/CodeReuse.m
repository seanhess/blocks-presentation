//
//  CodeReuse.m
//  BlocksPresentation
//
//  Created by Sean Hess on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CodeReuse.h"


@implementation CodeReuse

-(void)doSomething {
	
	// Pretend I have several lines needed in here to calculate something
	// I need to calculate the number of iterations to run. 
	
	int iterations = 0;
	iterations += 14;
	iterations *= 20;
	iterations /= 30;
		
	// What if you want to reuse the iteration calculation AND the for loop?
	
	for (int i = 0; i < iterations; i++) {
		NSLog(@"I: %i", i);
	}
}




- (void)enumerate:(void(^)(int))block {
	int iterations = 0;
	iterations += 14;
	iterations *= 20;
	iterations /= 30;
	
	// What if you want to reuse the iteration calculation AND the for loop?
	
	for (int i = 0; i < iterations; i++) {
		block(i);
	}
}

- (void)reuseItOne {
	[self enumerate:^(int i) {
		NSLog(@"CodeReuse - i %i", i);
	}];
}

- (void)reuseItTwo {
	[self enumerate:^(int i) {
		NSLog(@"CodeReuse - +2 %i", i+2);
	}];
}

- (void)reuseIt {
	[self reuseItOne];
	[self reuseItTwo];
}



@end
