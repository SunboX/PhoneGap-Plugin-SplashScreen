//
//  SplashScreen.m
//
//  Created by André Fiedler on 07.01.11.
//  Copyright 2011 André Fiedler, <fiedler.andre at gmail dot com>
//  MIT licensed
//

#import "SplashScreen.h"


@implementation SplashScreen
#ifndef __IPHONE_3_0
@synthesize webView;
#endif

- (void)dealloc
{
    if (imageView)
        [imageView release];
    [super dealloc];
}

- (void)createSplashScreen
{
	UIImage* image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Default" ofType:@"png"]];
	imageView = [[UIImageView alloc] initWithImage:image];
	[image release];
	
	CGRect frameRect = imageView.frame;
	CGPoint rectPoint = frameRect.origin;
	NSInteger newYPos = rectPoint.y - 20;
	imageView.frame = CGRectMake(0, newYPos, imageView.frame.size.width, imageView.frame.size.height);
	
    [imageView sizeToFit];
	imageView.tag = 1;
    imageView.hidden = YES;
	
	webView.superview.autoresizesSubviews = YES;
	
	[webView.superview addSubview:imageView];
	[webView.superview bringSubviewToFront:imageView];
}


- (void)show:(NSArray*)arguments withDict:(NSDictionary*)options
{
	if (!imageView)
        [self createSplashScreen];
	
	if (!imageView.hidden) {
		return;
	}
	
	imageView.hidden = NO;
}

- (void)hide:(NSArray*)arguments withDict:(NSDictionary*)options
{
	if (!imageView)
        [self createSplashScreen];
	
	if (imageView.hidden) {
		return;
	}
	
	imageView.hidden = YES;
}

@end
