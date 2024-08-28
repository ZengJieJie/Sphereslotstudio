//
//  main.m
//  SphereslotStudio
//
//  Created by adin on 2024/8/27.
//

#import <UIKit/UIKit.h>
#import "SphereslotAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([SphereslotAppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
