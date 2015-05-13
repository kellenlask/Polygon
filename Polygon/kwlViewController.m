//
//  kwlViewController.m
//  Polygon
//
//  Created by Maclab04 on 5/12/15.
//  Copyright (c) 2015 __KellenLask__. All rights reserved.
//

#import "kwlViewController.h"

@implementation kwlViewController

//Constants
static int max = 12;
static int min = 3;
static int radius = 120;
static NSArray * names; 

//Entry Point, like 'main'
- (void)viewDidLoad
{
	[super viewDidLoad];
	
	//Set the stepper to behave like we want
	_stepper.maximumValue = max;
    _stepper.minimumValue = min;
	_stepper.stepValue = 1.0;
	
	//Initialize some variables
	_stepper.value = 5;
	nSides = 5;
	
	names = @[@"Triangle", @"Quadrilateral", @"Pentagon", @"Hexagon", @"Heptagon", @"Octagon", @"Nonigon", @"Decagon", @"Hendecagon", @"Dodecagon"];
	
	[self update];
	
	
}

//Action handler for the stepper 
- (IBAction)stepper:(UIStepper *)sender forEvent:(UIEvent *)event 
{
	//Change nSides
	nSides = _stepper.value;
	
	//Update the label and drawing
	[self update];
	
}

- (void)update
{
	float angles = [self calcAngles: nSides];
	
	//float angles = calcAngles(nSides);
	[_resultsLabel setText:[NSString stringWithFormat:@"Sides: %d | %@\nAngles: %.0f° | %.2fr", nSides, names[nSides - 3], angles, angles * M_PI / 180]];
	
	
	//Setting up the canvas
	_canvas.image = nil; //Clear the imageview
	UIGraphicsBeginImageContext(self.view.frame.size);
	[self.canvas.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
	CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
	CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 5);
	
	int centerX = self.view.frame.size.width / 2;
	int centerY = self.view.frame.size.height / 2;
	
	//Doing the drawing
	float angle = 2 * M_PI / nSides;
	
	float x = radius * cos(0 * angle) + centerX;
	float y = radius * sin(0 * angle) + centerY;
	
	for (int i = 1; i <= nSides; i++) {
		CGContextMoveToPoint(UIGraphicsGetCurrentContext(), x, y);

		x = radius * cos((i) * angle) + centerX;
		y = radius * sin((i) * angle) + centerY;
		
		CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), x, y);
		
	}
	
	//Throwing the drawing in the imageview
	CGContextStrokePath(UIGraphicsGetCurrentContext());
	CGContextFlush(UIGraphicsGetCurrentContext());
	self.canvas.image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
} //End update

//Calculates the interior angles for any regular n-gon in degrees
- (float)calcAngles:(int)sides {
	float interiorAngles = (180 * (sides - 2)) / sides;
	
	return interiorAngles;
}
@end
