//
//  Response.m
//  TVGrid
//
//  Created by Sean Hess on 10/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Response.h"
#import "CJSONDeserializer.h"




@implementation Response

// parsing
-(NSData*)data {
	return data;
}

-(NSString*)string {
	return [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
}

-(id)json {
	
//	NSTimeInterval start = [NSDate timeIntervalSinceReferenceDate];
	
	NSError *error = nil;
	id results = [[CJSONDeserializer deserializer] deserialize:data error:&error];
	
	if (error) {
		NSLog(@"JSON PARSING ERROR: %@, %@", [error localizedDescription], [self string]);
	}
	
//	NSLog(@"Parsed %f", [NSDate timeIntervalSinceReferenceDate] - start);	
	
	return results;
}

-(NSInteger)statusCode {
	return 200;
}

-(NSError*)error {
	return nil;
}

// creating
-(id)initWithData:(NSData*)newData response:(NSURLResponse*)urlResponse {
	if (self = [super init]) {
		data = [newData retain];
		response = [urlResponse retain];
	}
	return self;
}

+(Response*)responseWithData:(NSData*)data response:(NSURLResponse*)urlResponse {
	Response * response = [[[Response alloc] initWithData:data response:urlResponse] autorelease];
	return response;
}

-(void)dealloc {
	[data release];
	[response release];
	[super dealloc];
}

@end
