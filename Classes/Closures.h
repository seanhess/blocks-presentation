//
//  Closures.h
//  BlocksPresentation
//
//  Created by Sean Hess on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Closures : NSObject {

}

-(IBAction)go;
-(void)doLater:(void(^)(void))block;

@end
