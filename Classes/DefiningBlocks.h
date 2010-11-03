//
//  DefiningBlocks.h
//  BlocksPresentation
//
//  Created by Sean Hess on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DefiningBlocks : NSObject {

}

-(IBAction)go;
-(void)doSomethingAndCallBackWithAString:(void(^)(NSString*))block;

@end
