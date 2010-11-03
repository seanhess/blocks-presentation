//
//  SDK.m
//  BlocksPresentation
//
//  Created by Sean Hess on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SDK.h"


@implementation SDK

-(IBAction)go {
	
	// Enumeration
	NSArray * array = [NSArray arrayWithObjects:@"One", @"two", @"three", nil];
	
	[array enumerateObjectsUsingBlock: ^ (id obj, NSUInteger idx, BOOL *stop) {
		NSLog(@"SDK - Array %@", obj);
	}];
	
	
	
	// Sorting
	NSMutableDictionary * one = [NSMutableDictionary dictionary];
	[one setObject:[NSNumber numberWithInt:10] forKey:@"age"];
	
	NSMutableDictionary * two = [NSMutableDictionary dictionary];
	[two setObject:[NSNumber numberWithInt:18] forKey:@"age"];
	
	NSMutableDictionary * three = [NSMutableDictionary dictionary];
	[three setObject:[NSNumber numberWithInt:5] forKey:@"age"];
	
	NSArray * ages = [NSArray arrayWithObjects:one, two, three, nil];
	
	NSLog(@"SDK - unsorted: %@", ages);
	
	NSArray * sortedAges = [ages sortedArrayUsingComparator:^(id obj1, id obj2) {
		NSDictionary * d1 = (NSDictionary*)obj1;
		NSDictionary * d2 = (NSDictionary*)obj2;		
		
		int age1 = [[d1 objectForKey:@"age"] intValue];
		int age2 = [[d2 objectForKey:@"age"] intValue];

		if (age1 < age2)
			return NSOrderedAscending;
		
		else if (age1 > age2)
			return NSOrderedDescending;
		
		else
			return NSOrderedSame;
	}];
	
	NSLog(@"SDK - sorted: %@", sortedAges);
	
	
	
	
	// Animations. Easier than using a selector to know when they are done
	
	[UIView animateWithDuration:100 animations:^{
		NSLog(@"SDK - ANIMATE!");
		
		// We're not actually doing anything, because I'm not in a view, but pretend I edited the frame, or something
	
	} completion: ^ (BOOL finished) {
		NSLog(@"SDK - COMPLETE!");
	}];
	
	
}

@end
