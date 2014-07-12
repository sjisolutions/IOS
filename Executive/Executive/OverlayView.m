//  OverlayView.m
//  CameraOverlayDemo
//
//  Created by sji on 10/3/14.
//  Copyright (c) 2014 Sjisolutions. All rights reserved.
//

#import "OverlayView.h"
#import <QuartzCore/QuartzCore.h>

@implementation OverlayView
@synthesize demoLabel,btnstop,btncapture,btnmenu,btncancel,recording,videoTime;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        recordingTime = 0;
        
        // Initialization code
        demoLabel = [[UILabel alloc] init];
        demoLabel.contentMode = UIViewContentModeCenter;
        demoLabel.textColor = [UIColor whiteColor];
        [demoLabel setTextAlignment: NSTextAlignmentCenter];
       
        [demoLabel setBackgroundColor:[UIColor lightGrayColor]];
        demoLabel.alpha = 0.6;
        [self addSubview:demoLabel];
        
        recording = [[UILabel alloc] init];
        recording.contentMode = UIViewContentModeCenter;
        recording.textColor = [UIColor redColor];
        [recording setTextAlignment: NSTextAlignmentCenter];
        recording.text = @"Recording...";
//        [recording setFont:[UIFont fontWithName:@"Arial" size:20]];
        recording.font=[UIFont fontWithName:@"Arial" size:22];
        recording.hidden = YES;
        [recording setBackgroundColor:[UIColor clearColor]];
        [self addSubview:recording];

        videoTime = [[UILabel alloc] init];
        videoTime.contentMode = UIViewContentModeCenter;
        videoTime.textColor = [UIColor whiteColor];
        [videoTime setTextAlignment: NSTextAlignmentCenter];
//        [recording setFont:[UIFont fontWithName:@"Arial" size:22]];
videoTime.font=[UIFont fontWithName:@"Arial" size:22];
       
        videoTime.text = @"00:00:00";
        videoTime.hidden = YES;
        videoTime.layer.cornerRadius = 5;
        [videoTime setBackgroundColor:[UIColor blackColor]];
        videoTime.alpha = 0.6;
        [self addSubview:videoTime];

        btnmenu = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btnmenu.userInteractionEnabled = TRUE;
        [btnmenu setTitle:@"Menu" forState:UIControlStateNormal];
        [btnmenu setBackgroundImage:[UIImage imageNamed:@"button2.png"] forState:UIControlStateNormal];
        [btnmenu addTarget:self action:@selector(GotoMenu) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:btnmenu];
        
        btncapture = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btncapture.userInteractionEnabled = TRUE;
        [btncapture setTitle:@"Capture" forState:UIControlStateNormal];
        [btncapture setBackgroundImage:[UIImage imageNamed:@"button2.png"] forState:UIControlStateNormal];
        [btncapture addTarget:self action:@selector(StartRecording) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:btncapture];

        btnstop = [UIButton buttonWithType:UIButtonTypeCustom];
                btnstop.userInteractionEnabled = FALSE;
        btnstop.enabled = FALSE;
        [btnstop setTitle:@"Stop" forState:UIControlStateNormal];
        [btnstop setBackgroundImage:[UIImage imageNamed:@"button2.png"] forState:UIControlStateNormal];

        [btnstop addTarget:self action:@selector(StopRecording) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:btnstop];

        btncancel = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btncancel.userInteractionEnabled = TRUE;
        [btncancel setTitle:@"Cancel" forState:UIControlStateNormal];
        [btncancel setBackgroundImage:[UIImage imageNamed:@"button2.png"] forState:UIControlStateNormal];

        [btncancel addTarget:self action:@selector(CancelRecording) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btncancel];
        [self bringSubviewToFront:btncancel];
        if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
             [demoLabel setFrame:CGRectMake(0, 43, 1024, 55 )];
            [recording setFrame:CGRectMake(860, 0, 135, 44 )];
             [videoTime setFrame:CGRectMake(10, 0, 120, 33 )];
            [btnstop setFrame:CGRectMake(539, 50, 135, 43)];
[btncapture setFrame:CGRectMake(325, 50, 135, 43)];
            [btncancel setFrame:CGRectMake(761, 50, 135, 43)];
            [btnmenu setFrame:CGRectMake(105, 50, 135, 43)];
        }else{
            CGRect screen=[[UIScreen mainScreen]bounds];
            if (screen.size.height==568) {
                 NSLog(@"GotoMenu");
                [demoLabel setFrame:CGRectMake(0, -20, 560, 55 )];
                [recording setFrame:CGRectMake(300, -30, 130, 35 )];
                [videoTime setFrame:CGRectMake(30, -30, 100, 33 )];
                [btnmenu setFrame:CGRectMake(30, 5, 100, 33)];
                [btncapture setFrame:CGRectMake(150, 5, 85, 33)];
                [btnstop setFrame:CGRectMake(255, 5,85, 33)];
                [btncancel setFrame:CGRectMake(360, 5,85, 33)];
            }else{
            [demoLabel setFrame:CGRectMake(0, 0, 485, 40 )];
            [recording setFrame:CGRectMake(300, -30, 130, 35 )];
            [videoTime setFrame:CGRectMake(30, -30, 100, 33 )];
            [btnmenu setFrame:CGRectMake(30, 3, 100, 30)];
            [btncapture setFrame:CGRectMake(150, 3, 85, 30)];
            [btnstop setFrame:CGRectMake(255, 3,85, 30)];
            [btncancel setFrame:CGRectMake(360, 3,85, 30)];
                    }
        }
    }
    return self;
}

-(void)GotoMenu {
    NSLog(@"GotoMenu");
    if (self.delegate && [self.delegate respondsToSelector:@selector(GotoMenu:)]) {
        [self.delegate GotoMenu:self];
    }
}

-(void)StartRecording {
    NSLog(@"StartRecording");
    recording.hidden = FALSE;
    btncapture.userInteractionEnabled = FALSE;
    btncapture.enabled = FALSE;
    btnstop.userInteractionEnabled = TRUE;
    btnstop.enabled = TRUE;
    videoTime.hidden = NO;
    recordingTimer =  [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateMatchLabel:) userInfo:nil repeats:YES];

    if (self.delegate && [self.delegate respondsToSelector:@selector(StartRecording:)]) {
        [self.delegate StartRecording:self];
    }
}

-(void)StopRecording {
    NSLog(@"StopRecording");
    if (self.delegate && [self.delegate respondsToSelector:@selector(StopRecording:)]) {
        [self.delegate StopRecording:self];
    }
}

-(void)CancelRecording {
    NSLog(@"CancelREcording");
    if (self.delegate && [self.delegate respondsToSelector:@selector(CancelRecording:)]) {
        [self.delegate CancelRecording:self];
    }
}

-(void)updateMatchLabel:(NSTimer*)timer {
    recordingTime++;
    int hours,second,minutes;
    second = recordingTime;
    hours = second / 3600;
    minutes = (second - (hours*3600)) / 60;
    second = second % 60;
    
    [videoTime setText:[NSString stringWithFormat:@"%02d:%02d:%02d",hours,minutes,second]];
}

@end