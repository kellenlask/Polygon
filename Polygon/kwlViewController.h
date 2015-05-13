//
//  kwlViewController.h
//  Polygon
//
//  Created by Maclab04 on 5/12/15.
//  Copyright (c) 2015 __KellenLask__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface kwlViewController : UIViewController

{
	//Fields
	@protected
	int nSides;
}

//Properties
@property (strong, nonatomic) IBOutlet UILabel *resultsLabel;
@property (strong, nonatomic) IBOutlet UIStepper *stepper;
@property (strong, nonatomic) IBOutlet UIImageView *canvas;

//Methods
- (IBAction)stepper:(UIStepper *)sender forEvent:(UIEvent *)event;
- (void)update;
- (float)calcAngles: (int)sides;

@end
