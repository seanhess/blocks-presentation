//
//  Services.h
//  BlocksPresentation
//
//  Created by Sean Hess on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Services : NSObject {
	NSString * lameMessage;
}

@property (nonatomic, retain) NSString * lameMessage;

-(IBAction)doBlocks;
-(IBAction)doSelector;

-(void)calculateTimeTwiceAndDisplayWithMessage:(NSString*)message;
-(void)attemptToDoTheSameThingWithASelectorAndMessage:(NSString *)message;

@end
