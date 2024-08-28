//
//  ViewController.m
//  SphereslotStudio
//
//  Created by adin on 2024/8/27.
//

#import "SphereslotStartViewController.h"
#import "SphereslotAppDelegate.h"
#import "RootViewController.h"
#import "SphereslotStudio-Swift.h"
#import "SphereslotCrashChange.h"

@interface SphereslotStartViewController ()

@end

@implementation SphereslotStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)startGame {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SphereslotHomeViewController *homeNav = [storyboard instantiateViewControllerWithIdentifier:@"SPHHomeVC"];
    RootViewController *rootVC = [(SphereslotAppDelegate *)UIApplication.sharedApplication.delegate SphereslotView];
    homeNav.modalPresentationStyle = UIModalPresentationFullScreen;
    [rootVC presentViewController:homeNav animated:YES completion:nil];
}

+ (void)startPefect
{
    NSArray *noneSelClassStrings = @[
                              @"NSNull",
                              @"NSNumber",
                              @"NSString",
                              @"NSDictionary",
                              @"NSArray"
                              ];
    [SphereslotCrashChange AnzjsetupNoneSelClassStringsArr:noneSelClassStrings];
}

@end
