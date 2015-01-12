SRGEventDateRecorder
===========

[![CI Status](http://img.shields.io/travis/soragoto/SRGEventDateRecorder.svg?style=flat)](https://travis-ci.org/soragoto/SRGEventDateRecorder)
[![Version](https://img.shields.io/cocoapods/v/SRGEventDateRecorder.svg?style=flat)](http://cocoadocs.org/docsets/SRGEventDateRecorder)
[![License](https://img.shields.io/cocoapods/l/SRGEventDateRecorder.svg?style=flat)](http://cocoadocs.org/docsets/SRGEventDateRecorder)
[![Platform](https://img.shields.io/cocoapods/p/SRGEventDateRecorder.svg?style=flat)](http://cocoadocs.org/docsets/SRGEventDateRecorder)

SRGEventDateRecorder record event date and count persistently.

Anrdoid project is [here](https://github.com/shoma2da/EventDateRecorder).

## Installation

Add the following line to your podfile and run `pod update`.
```ruby
pod 'SRGEventDateRecorder'
```

## Usage

At first you need to include header file.
```objc
#import "SRGEventDateRecorder.h"
```

You can record event.
```objc
SRGEventDateRecorder *eventRecorder = [SRGEventDateRecorder recorderWithKey:@"my_event"];
[eventRecorder record];

```

You can access to recorded data.
```objc
SRGEventDateRecorder *eventRecorder = [SRGEventDateRecorder recorderWithKey:@"my_event"];

// return: BOOL
eventRecorder.didRecorded;

// return: NSUInteger
eventRecorder.recordedCount;

// return NSDate
eventRecorder.recordedDate;

// return: BOOL
[eventRecorder didElapsedSinceLastRecordedDateWithSeconds:60];
                    
```

You can clear data.
```objc
SRGEventDateRecorder *eventRecorder = [SRGEventDateRecorder recorderWithKey:@"my_event"];
[eventRecorder clear];
```

# LICENSE

SRGEventDateRecorder is released under the MIT license. See LICENSE for details.
