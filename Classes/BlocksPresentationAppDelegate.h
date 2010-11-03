//
//  BlocksPresentationAppDelegate.h
//  BlocksPresentation
//
//  Created by Sean Hess on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BlocksPresentationViewController;

@interface BlocksPresentationAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    BlocksPresentationViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet BlocksPresentationViewController *viewController;

@end

