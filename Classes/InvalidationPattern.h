//
//  InvalidationPattern.h
//  BlocksPresentation
//
//  Created by Sean Hess on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface InvalidationPattern : NSObject {
	BOOL needsAwesomeness;
	CGFloat weight;
	CGFloat height;
	NSInteger age;
	NSInteger awesomeness;
}

-(void)go;

-(void)setWeight:(CGFloat)weight;
-(void)setHeight:(CGFloat)height;
-(void)setAge:(NSInteger)age;
-(void)calculateAwesomeness;
-(void)setNeedsAwesomeness;

@end
