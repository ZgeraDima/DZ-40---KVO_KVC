//
//  ZDStudent.h
//  DZ 40 - Skut_KVO_KVC_1
//
//  Created by mac on 17.04.2018.
//  Copyright © 2018 Dima Zgera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

typedef enum
{
    GenderMale,
    GenderFemale
}Gender;

@interface ZDStudent : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSDate *dateOfBirth;
@property (assign, nonatomic) Gender gender;
@property (assign, nonatomic) CGFloat averageGrade;

@property (weak, nonatomic) ZDStudent *friend;

- (ZDStudent*) randomStudentProperties:(ZDStudent*)student;
- (ZDStudent*) resetProperties:(ZDStudent*)student;



@end
