//
//  BlocksPresentationViewController.h
//  BlocksPresentation
//
//  Created by Sean Hess on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DefiningBlocks.h"
#import "Closures.h"
#import "NoBeachball.h"
#import "InvalidationPattern.h"
#import "Services.h"
#import "SDK.h"
#import "CodeReuse.h"

@interface BlocksPresentationViewController : UIViewController {
	IBOutlet DefiningBlocks * definingBlocks;
	IBOutlet Closures * closures;
	IBOutlet NoBeachball * noBeachball;
	IBOutlet InvalidationPattern * invalidationPattern;
	IBOutlet Services * services;
	IBOutlet SDK * sdk;
	IBOutlet CodeReuse * codeReuse;
}

@end

