//
//  Factories.m
//  BlocksPresentation
//
//  Created by Sean Hess on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Factories.h"


@implementation Factories


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

-(IBAction)factoriesOne {
	[self createSomeStuffWithFactory:^ {
		UIView * view = [[UIView new] autorelease];
		view.backgroundColor = [UIColor redColor];
		view.frame = CGRectMake(0, 5, 10, 10);
		return view;
	}];	
}

-(IBAction)factoriesTwo {
	[self createSomeStuffWithFactory:^ {
		UIView * view = [[UIView new] autorelease];
		view.backgroundColor = [UIColor greenColor];
		view.frame = CGRectMake(0, 20, 30, 30);
		return view;
	}];
}

- (void)createSomeStuffWithFactory:(UIView*(^)())factory {
	for (int i = 0; i < 5; i++) {
		UIView * view = factory();

		// layout only the x coordinate. 
		CGRect frame = view.frame;
		frame.origin.x = i * (frame.size.width + 5);
		view.frame = frame;
		
		[self addSubview:view];
	}
}

- (void)dealloc {
    [super dealloc];
}


@end
