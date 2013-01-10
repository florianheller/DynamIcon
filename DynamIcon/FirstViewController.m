//
//  FirstViewController.m
//  DynamIcon
//
//  Created by Florian Heller on 1/10/13.
//  Copyright (c) 2013 Florian Heller - RWTH Aachen University. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = NSLocalizedString(@"Temperature", @"Title of the fist tab");
		self.tabBarItem.image = [self temperatureTabBarItemIconWithTemperature:[NSNumber numberWithFloat:21.5]];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Dynamic image generation

- (UIImage*)temperatureTabBarItemIconWithTemperature:(NSNumber*)temperature  {
	// We use this image to get some information about the dispay
	UIImage *backgroundImage = [UIImage imageNamed:@"thermometer"];
	
	
	// The generated icon will be 30x30pt large
	CGSize iconSize = CGSizeMake(30., 30.);
	
	// Set the scale of the returned image to the correct value
	UIGraphicsBeginImageContextWithOptions(iconSize, NO, backgroundImage.scale);
	
	// draw the thermometer icon on he left side of the icon
	// the image is 12x28pt large
	
	CGRect iconImageRectangle= CGRectMake(1,1, backgroundImage.size.width, backgroundImage.size.height);
	[backgroundImage drawInRect:iconImageRectangle];
	
	// set the writing color to white
	[[UIColor whiteColor] set];
	
	// write the temperature as integer in the image
	// position is right from the thermometer
	NSString *temperatureString = [NSString stringWithFormat:@"%d°",[temperature intValue]];
	UIFont *font = [UIFont boldSystemFontOfSize:12];
	CGPoint point = CGPointMake(12., 1);
	[temperatureString drawAtPoint:point withFont:font];
	
	// create the image from the context
	UIImage *theImage=UIGraphicsGetImageFromCurrentImageContext();
	
	// close the context
	UIGraphicsEndImageContext();
	return theImage;
}

@end
