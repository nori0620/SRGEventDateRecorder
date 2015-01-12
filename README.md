SRGEventDateRecorder
===========

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

