//
//  ViewController.m
//  SRGEventDateRecorder
//
//  Created by nori0620 on 2014/12/22.
//  Copyright (c) 2014年 soragoto. All rights reserved.
//

#import "ViewController.h"
#import "SRGEventDateRecorder.h"

@interface ViewController ()

@property SRGEventDateRecorder *recorder;

-  (IBAction)  didTapRecordButton:(id)sender;
-  (IBAction)  didTapOutpuLogButton:(id)sender;
-  (IBAction)  didTapClearButton:(id)sender;

@end

@implementation ViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    if( self = [super initWithCoder:aDecoder] ){
        _recorder = [SRGEventDateRecorder recorderWithKey:@"test_recorder"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)didTapRecordButton:(id)sender {
    [_recorder record];
}

- (void)didTapOutpuLogButton:(id)sender {
    NSLog(@"recorded didRecord?:%d",_recorder.didRecorded);
    NSLog(@"recorded count:%@",@(_recorder.recordedCount));
    NSLog(@"recorded date:%@",_recorder.recordedDate);
    NSLog(@"elapsed 60 seconds since laste record?:%d",[_recorder didElapsedSinceLastRecordedDateWithSeconds:60]);
    
}

- (void)didTapClearButton:(id)sender {
    [_recorder clear];
}

@end
