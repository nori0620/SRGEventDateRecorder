//
//  SRGEventDateRecorder.h
//  SRGEventDateRecorder
//
//  Created by nori0620 on 2014/12/22.
//  Copyright (c) 2014年 soragoto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRGEventDateRecorder : NSObject

@property (readonly) NSString *key;
@property (readonly) NSDate *hoge;
@property (readonly) NSDate *recordedDate;
@property (readonly) NSUInteger recordedCount;

+ (instancetype)recorderWithKey:(NSString *)key;
- (void) record;
- (BOOL) didRecorded;
- (BOOL) didElapsedSinceLastRecordedDateWithSeconds:(NSTimeInterval)seconds;
- (void) clear;

@end
