//
//  NoBeachball.h
//  BlocksPresentation
//
//  Created by Sean Hess on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NoBeachball : NSObject {
	NSOperationQueue * queue;
}

-(IBAction)doFreeze;
-(IBAction)doNotFreeze;
-(IBAction)queueAndCancel;




-(NSInteger)freezeTheComputer;
-(void)dontFreezeTheComputer;
-(void)dontFreezeAndJoinBackToMainThread;

@end
