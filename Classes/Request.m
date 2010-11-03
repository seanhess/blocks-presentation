//
//  GetRequest.m
//  TVGrid
//
//  Created by Sean Hess on 9/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Request.h"
#import "Response.h"

@implementation Request

+(Request*)get:(NSString*)url callback:(void(^)(Response*))block {
	Request * req = [[[Request alloc] initWithURL:url callback:block] autorelease];
	[req send];
	return req;
}

-(id)initWithURL:(NSString*)urls callback:(void(^)(Response*))block {
	if (self = [super init]) {
		callback = [block copy];
		urlString = [urls copy];
		url = [[NSURL URLWithString:urlString] retain];
		request = [[NSURLRequest requestWithURL:url] retain];
	}
	return self;
}

// call back our callback
-(void)finish {
	callback(response);
	[callback release];
}

-(void)send {
//	NSLog(@"Request Sending: %@", url);	
	
	// Check the cache
	
//	NSData * cachedData = [[RequestCache sharedCache] load:urlString];
	
//	if (cachedData) {
//		//NSLog(@"Request Cached: %@", urlString);		
//		response = [[Response responseWithData:cachedData response:[[NSURLResponse new] autorelease]] retain];
//		return [self finish];
//	}
	
	
	// Make the call
	
	[[Request queue] addOperationWithBlock:^ {
		NSURLResponse * urlResponse;
		NSError * error;
		NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
		
		if (!data) {
			//NSLog(@"Request Error: %@ %@", url, error);
			// callback(nil);
			return;
		}
		
		//NSLog(@"Request Finished: %@", url);
		response = [[Response responseWithData:data response:urlResponse] retain];		 
		[[RequestCache sharedCache] cache:urlString data:data];				
		
		[self performSelectorOnMainThread:@selector(finish) withObject:nil waitUntilDone:YES];
	}];
}

+(NSOperationQueue*)queue {
	static NSOperationQueue * queue = nil;
	
	if (!queue) {
		queue = [NSOperationQueue new];
	}
	
	return queue;
}

-(void)dealloc {
	[url release];
	[request release];
	[urlString release];
	[response release];
	[super dealloc];
}



@end





























@implementation RequestCache

-(NSMutableDictionary*)dict {
	if (!dict) dict = [NSMutableDictionary new];
	return dict;
}

-(void)cache:(NSString*)url data:(NSData*)data {
	[self.dict setObject:data forKey:url];
}

-(NSMutableData*)load:(NSString*)url {
	return [self.dict objectForKey:url];
}

-(void)dealloc {
	[dict release];
	[super dealloc];
}

+(RequestCache*)sharedCache {
	static RequestCache * shared = nil;
	
	if (!shared)
		shared = [self new];
	
	return shared;
}

@end

