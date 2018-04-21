//
//  ViewController.h
//  DZ 40 - Skut_KVO_KVC_1
//
//  Created by mac on 15.04.2018.
//  Copyright © 2018 Dima Zgera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController

//buttons
@property (weak, nonatomic) IBOutlet UIButton *clearButton;
@property (weak, nonatomic) IBOutlet UIButton *randomButton;
- (IBAction)actionClear:(UIButton *)sender;
- (IBAction)actionRandom:(UIButton *)sender;

//Output student info
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *dateOfBirthField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderControl;
@property (weak, nonatomic) IBOutlet UITextField *averageGradeField;

@end

