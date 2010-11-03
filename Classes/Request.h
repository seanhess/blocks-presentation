//
//  GetRequest.h
//  TVGrid
//
//  Created by Sean Hess on 9/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response.h"

// Simplifies getting stuff
@interface Request : NSObject {
	NSURL * url;
	NSURLRequest * request;
	NSString * urlString;
	
	Response * response;
	
	void(^callback)(Response*data);
}

-(id)initWithURL:(NSString*)url callback:(void(^)(Response*))block;
-(void)send;

+(Request*)get:(NSString*)url callback:(void(^)(Response*))block;
+(NSOperationQueue*)queue;


@end
















@interface RequestCache : NSObject {
	NSMutableDictionary * dict;
}

+(RequestCache*)sharedCache;
-(void)cache:(NSString*)url data:(NSData*)data;
-(NSMutableData*)load:(NSString*)url;

@end

