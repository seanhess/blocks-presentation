//
//  InvalidationPattern.m
//  BlocksPresentation
//
//  Created by Sean Hess on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "InvalidationPattern.h"


@implementation InvalidationPattern

-(void)go {
	
	// This is an example of delaying execution until the next run loop. There are many reasons
	// you might want to do this, but one is to avoid recalculating something every time any
	// of the data changes. If several data are changing at once, you want to wait until they are all
	// set to recalculate. 
	
	// This is really similar to drawRect and setNeedsDisplay, and layoutSubviews and setNeedsLayout. 
	// This is how you would create your own. 
	

	
	
	// set them! 
	[self setWeight:155.0];
	[self setHeight:5.8];
	[self setAge:28];
	
	
	NSLog(@"InvalidationPattern: Done Setting data");
}

-(void)setWeight:(CGFloat)w {
	weight = w;
	[self setNeedsAwesomeness];
}

-(void)setHeight:(CGFloat)h {
	height = h;
	[self setNeedsAwesomeness];
}

-(void)setAge:(NSInteger)a {
	age = a;
	[self setNeedsAwesomeness];
}

-(void)setNeedsAwesomeness {
	
	if (!needsAwesomeness) {
		needsAwesomeness = YES;

		[[NSOperationQueue mainQueue] addOperationWithBlock: ^{
			[self calculateAwesomeness];
		}];
	}
}


-(void)calculateAwesomeness {
	// Some expensive calculation / drawing, etc. 
	
	awesomeness = (int)(weight * height) % age;
	NSLog(@"InvalidationPattern: New Awesomeness Calculated %i", awesomeness);
}

@end