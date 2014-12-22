//
//  SRGEventDateRecorderTests.m
//  SRGEventDateRecorderTests
//
//  Created by nori0620 on 2014/12/22.
//  Copyright (c) 2014年 soragoto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SRGEventDateRecorder.h"

@interface SRGEventDateRecorderTests : XCTestCase

@property SRGEventDateRecorder *foo;
@property SRGEventDateRecorder *bar;

@end

@implementation SRGEventDateRecorderTests

- (void)setUp {
    [super setUp];
    _foo = [SRGEventDateRecorder recorderWithKey:@"foo"];
    _bar = [SRGEventDateRecorder recorderWithKey:@"bar"];
}

- (void)tearDown {
    [super tearDown];
    [_foo clear];
    [_bar clear];
}

- (void)testCreateInstance{
    XCTAssert( _foo, @"foo's instance");
    XCTAssert( _bar, @"bar's instance");
}

- (void) testRecordCount {
    
    XCTAssertEqual(_foo.recordedCount, 0);
    XCTAssertEqual(_bar.recordedCount, 0);
    
    [_foo record];
    XCTAssertEqual(_foo.recordedCount, 1);
    XCTAssertEqual(_bar.recordedCount, 0);
    
    [_bar record];
    XCTAssertEqual(_foo.recordedCount, 1);
    XCTAssertEqual(_bar.recordedCount, 1);
    
}

- (void) testDidRecord {
    
    XCTAssertEqual(_foo.didRecorded, NO);
    XCTAssertEqual(_bar.didRecorded, NO);
    
    [_foo record];
    XCTAssertEqual(_foo.didRecorded, YES);
    XCTAssertEqual(_bar.didRecorded, NO);
    
    [_bar record];
    XCTAssertEqual(_foo.didRecorded, YES);
    XCTAssertEqual(_bar.didRecorded, YES);
    
}

- (void) testSingleton {
    SRGEventDateRecorder *otherFoo = [SRGEventDateRecorder recorderWithKey:_foo.key];
    XCTAssertEqualObjects(_foo,otherFoo);
    
}

@end
