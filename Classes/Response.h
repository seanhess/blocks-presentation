//
//  Response.h
//  TVGrid
//
//  Created by Sean Hess on 10/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Response : NSObject {
	NSData * data;
	NSURLResponse * response;
}

// results

-(NSInteger)statusCode;
-(NSError*)error;

-(NSData*)data;
-(NSString*)string;
-(id)json;

// creating
-(id)initWithData:(NSData*)data response:(NSURLResponse*)response;
+(Response*)responseWithData:(NSData*)data response:(NSURLResponse*)response;

@end
