//
//  SRGEventDateRecorder.m
//  SRGEventDateRecorder
//
//  Created by nori0620 on 2014/12/22.
//  Copyright (c) 2014年 soragoto. All rights reserved.
//

#import "SRGEventDateRecorder.h"

static const NSString *PersistentPrefix = @"SRGEventDateRecorder";

NSMutableDictionary *instancePool;

@implementation SRGEventDateRecorder {
}

+ (instancetype)recorderWithKey:(NSString *)key {
    if( !instancePool ){ instancePool = @{}.mutableCopy; }
    if( instancePool[key]){ return instancePool[key]; }
    instancePool[key] = [[self alloc] initWithKey:key];
    return instancePool[key];
}

- (instancetype)initWithKey:(NSString *)key {
    if( self = [super init]){
        _key = key;
        [self p_load];
    }
    return self;
}

- (void)record {
    _recordedCount += 1;
    _recordedDate   = [NSDate date];
    [self p_persist];
}

- (BOOL) didRecorded {
    return _recordedCount > 0;
}

- (BOOL) didElapsedSinceLastRecordedDateWithSeconds:(NSTimeInterval)seconds {
    if( !self.didRecorded ){ return NO; }
    NSTimeInterval elapsed = [[NSDate date] timeIntervalSince1970] - [_recordedDate timeIntervalSince1970];
    return elapsed >= seconds;
}

- (void)clear {
    _recordedCount = 0;
    _recordedDate  = nil;
    [[NSUserDefaults standardUserDefaults]
        removeObjectForKey: self.p_persistentKey
    ];
}

# pragma mark - Persisters

- (NSString *) p_persistentKey {
    return [NSString stringWithFormat:@"%@.%@", PersistentPrefix, _key ];
}

- (void) p_persist {
    [[NSUserDefaults standardUserDefaults]
        setObject: @{
            @"count" : @(_recordedCount),
            @"date"  : _recordedDate,
        }
        forKey: self.p_persistentKey
    ];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void) p_load {
    NSDictionary *plain = [[NSUserDefaults standardUserDefaults]
        dictionaryForKey:self.p_persistentKey
    ];
    _recordedCount = [plain[@"count"] integerValue];
    _recordedDate  = plain[@"date"];
}

@end
