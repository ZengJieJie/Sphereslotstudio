//
//  NSMutableString+AvoidCrash.m
//  https://github.com/Anzj/AvoidCrash
//
//  Created by mac on 16/10/6.
//  Copyright © 2016年 Anzj. All rights reserved.
//

#import "NSMutableString+AvoidCrash.h"

#import "SphereslotCrashChange.h"

@implementation NSMutableString (AvoidCrash)

+ (void)anzj_avoidCrashExchangeMethod {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class stringClass = NSClassFromString(@"__NSCFString");
        
        //replaceCharactersInRange
        [SphereslotCrashChange exchangeInstanceMethod:stringClass method1Sel:@selector(replaceCharactersInRange:withString:) method2Sel:@selector(avoidCrashReplaceCharactersInRange:withString:)];
        
        //insertString:atIndex:
        [SphereslotCrashChange exchangeInstanceMethod:stringClass method1Sel:@selector(insertString:atIndex:) method2Sel:@selector(avoidCrashInsertString:atIndex:)];
        
        //deleteCharactersInRange
        [SphereslotCrashChange exchangeInstanceMethod:stringClass method1Sel:@selector(deleteCharactersInRange:) method2Sel:@selector(avoidCrashDeleteCharactersInRange:)];
    });
}

//=================================================================
//                     replaceCharactersInRange
//=================================================================
#pragma mark - replaceCharactersInRange

- (void)avoidCrashReplaceCharactersInRange:(NSRange)range withString:(NSString *)aString {
    
    @try {
        [self avoidCrashReplaceCharactersInRange:range withString:aString];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultIgnore;
        [SphereslotCrashChange noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        
    }
}

//=================================================================
//                     insertString:atIndex:
//=================================================================
#pragma mark - insertString:atIndex:

- (void)avoidCrashInsertString:(NSString *)aString atIndex:(NSUInteger)loc {
    
    @try {
        [self avoidCrashInsertString:aString atIndex:loc];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultIgnore;
        [SphereslotCrashChange noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        
    }
}

//=================================================================
//                   deleteCharactersInRange
//=================================================================
#pragma mark - deleteCharactersInRange

- (void)avoidCrashDeleteCharactersInRange:(NSRange)range {
    
    @try {
        [self avoidCrashDeleteCharactersInRange:range];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultIgnore;
        [SphereslotCrashChange noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        
    }
}








@end
