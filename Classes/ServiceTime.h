//
//  ServiceCallGoogle.h
//  BlocksPresentation
//
//  Created by Sean Hess on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceTime : NSObject {

}

// Blocks!
-(void)getCurrentTimeWithCallback:(void(^)(int,int,int))block;

// Lame, old way of doing this
-(void)getCurrentTimeWithTarget:(id)target selector:(SEL)selector;

@end
