//
//  AppDelegate.m
//  DZ 40 - Skut_KVO_KVC_1
//
//  Created by mac on 15.04.2018.
//  Copyright © 2018 Dima Zgera. All rights reserved.
//

#import "AppDelegate.h"
#import "ZDStudent.h"

@interface AppDelegate ()

@property (strong, nonatomic) ZDStudent *student;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    
    ZDStudent *student1 = [[ZDStudent alloc] init];
    ZDStudent *student2 = [[ZDStudent alloc] init];
    ZDStudent *student3 = [[ZDStudent alloc] init];
    ZDStudent *student4 = [[ZDStudent alloc] init];
    ZDStudent *student5 = [[ZDStudent alloc] init];
    ZDStudent *student6 = [[ZDStudent alloc] init];
    ZDStudent *student7 = [[ZDStudent alloc] init];
    ZDStudent *student8 = [[ZDStudent alloc] init];
    
    student1 = [student1 randomStudentProperties:student1];
    student2 = [student2 randomStudentProperties:student2];
    student3 = [student3 randomStudentProperties:student3];
    student4 = [student4 randomStudentProperties:student4];
    student5 = [student5 randomStudentProperties:student5];
    student6 = [student6 randomStudentProperties:student6];
    student7 = [student7 randomStudentProperties:student7];
    student8 = [student8 randomStudentProperties:student8];
    
    self.student = student4;
    
    student4.friend = student3;
    student3.friend = student2;
    student2.friend = student1;
    student1.friend = student4;
    
    student4.firstName = @"Vasya";
    
    //set observing to student4
    [student4 addObserver:self forKeyPath:@"firstName"
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:NULL];
    
    NSArray *students = @[student1, student2, student3, student4, student5, student6, student7, student8];
    
    NSLog(@"\nstudent1 name: %@\nstudent2 name: %@\nstudent3 name: %@\nstudent4 name: %@",
          student1.firstName, student2.firstName, student3.firstName, student4.firstName);
    
    NSLog(@"student4.firstName = %@", [student3 valueForKeyPath:@"friend.friend.friend.firstName"]);
    NSLog(@"*************************************");
    
    [student3 setValue:@"Loshok" forKeyPath:@"friend.friend.friend.firstName"];
    
    NSArray *studentNames = [students valueForKeyPath:@"@unionOfObjects.firstName"];
    
    NSLog(@"Names: %@", studentNames);
    NSLog(@"*************************************");
    
    NSNumber *minAge = [students valueForKeyPath:@"@min.dateOfBirth"];
    NSNumber *maxAge = [students valueForKeyPath:@"@max.dateOfBirth"];
    
    NSLog(@"Junger student DOB: %@ Older student DOB: %@", maxAge, minAge);
    
    NSLog(@"*************************************");
    
    NSNumber *sumAverageGrade = [students valueForKeyPath:@"@sum.averageGrade"];
    NSNumber *avgAverageGrade = [students valueForKeyPath:@"@avg.averageGrade"];
    
    NSLog(@"Sum all grade: %@ Average all grade: %@", sumAverageGrade, avgAverageGrade);
    
    
    return YES;
}

#pragma mark - Observing

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{

    NSLog(@"observeValueForKeyPath: %@\nofObject: %@\nchange: %@",keyPath, object, change);
}

- (void) dealloc{

    [self.student removeObserver:self forKeyPath:@"firstName"];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
