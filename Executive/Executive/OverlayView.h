//
//  OverlayView.h
//  CameraOverlayDemo
//
//  Created by sji on 10/3/14.
//  Copyright (c) 2014 Sjisolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OverlayDelegate;

@interface OverlayView : UIView {
    NSInteger recordingTime;
    NSTimer *recordingTimer;
}

@property (strong, nonatomic) IBOutlet UILabel *demoLabel;
@property (strong, nonatomic) IBOutlet UILabel *recording;
@property (strong, nonatomic) IBOutlet UILabel *videoTime;
;
@property (weak, nonatomic) IBOutlet UIButton *btnmenu;
@property (weak, nonatomic) IBOutlet UIButton *btncapture;
@property (weak, nonatomic) IBOutlet UIButton *btnstop;
@property (weak, nonatomic) IBOutlet UIButton *btncancel;

@property (assign, nonatomic) id <OverlayDelegate>delegate;

@end


@protocol OverlayDelegate<NSObject>
@optional

-(void)GotoMenu:(OverlayView*)overlayviewcontroller;
-(void)StartRecording:(OverlayView*)overlayviewcontroller;
-(void)StopRecording:(OverlayView*)overlayviewcontroller;
-(void)CancelRecording:(OverlayView*)overlayviewcontroller;

@end