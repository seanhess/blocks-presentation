//
//  Factories.h
//  BlocksPresentation
//
//  Created by Sean Hess on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Factories : UIView {

}

-(IBAction)factoriesOne;
-(IBAction)factoriesTwo;
- (void)createSomeStuffWithFactory:(UIView*(^)())factory;

@end
