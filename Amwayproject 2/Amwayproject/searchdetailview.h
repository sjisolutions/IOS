//
//  searchdetailview.h
//  Amwayproject
//
//  Created by sji on 3/14/14.
//  Copyright (c) 2014 Sjisolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Customerdetails.h"
@interface searchdetailview : UIViewController<UITextViewDelegate,UITextFieldDelegate>{
    AppDelegate *app;
    Customerdetails *progarray;
    UILabel *namef,*namel,*numphone,*idemail,*mem,*stat,*edu,*loccollege,*statecollege,*loccurrent,*statecurrent,*ideashared,*dec,*meetnext,*phot,*conferencelocation,*notebrief;
    UITextField *numphone1,*idemail1,*mem1,*stat1,*edu1,*loccollege1,*statecollege1,*loccurrent1,*statecurrent1,*phot1,*conferencelocation1,*notebrief1;
    UITextView *notebrief12;
    UITextField *namel1,*namef1,*dec12,*meetnext1,*ideashared1;
    NSMutableArray *corearray;
    UIScrollView *scrollview;
    UIButton *edit;
    BOOL er;
    NSArray *arr;
    NSManagedObjectContext *context;
    UIDatePicker *pickerView;
    UIView *customPickerViewTime;
    UIPickerView *dayspicker;
    BOOL isSelectedPicker;
    UIButton *datebtn;
    UIButton *daysbtn;
     NSMutableArray *decissionarray;
    UIButton *savebut;
    UIButton *membun;
    UIButton *share;
    NSString *nm;
   }
@property(nonatomic,retain)UIView *customPickerView;

@property (nonatomic ,retain) NSMutableArray *corearray;
@property(nonatomic,retain) NSString *str_key_value;

@end
