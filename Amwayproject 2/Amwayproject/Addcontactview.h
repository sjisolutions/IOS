//
//  Addcontactview.h
//  Amwayproject
//
//  Created by sji on 3/14/14.
//  Copyright (c) 2014 Sjisolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Customerdetails.h"
@interface Addcontactview : UIViewController<UITextFieldDelegate,UIScrollViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UITextViewDelegate>{
     UIScrollView *scrollview;
    UIDatePicker *pickerView;
UIView *customPickerViewTime,*customPickerViewTime1,*customPickerViewTime2;
    UILabel *namef,*namel,*numphone,*idemail,*mem,*stat,*edu,*loccollege,*statecollege,*loccurrent,*statecurrent,*ideashared,*dec,*meetnext,*phot,*conferencelocation,*notebrief;
    UITextField *namef1,*namel1,*numphone1,*idemail1,*mem1,*stat1,*edu1,*loccollege1,*statecollege1,*loccurrent1,*statecurrent1,*ideashared1,*dec1,*meetnext1,*phot1,*conferencelocation1;
   UITextView *notebrief1;
    UIButton *savebut;
    UIPickerView *dayspicker,*dayspicker1;
    NSMutableArray *decissionarray;
     NSMutableArray *decissionarray1;
    AppDelegate *app;
    Customerdetails *cust;
    BOOL isSelectedPicker;
    UILabel *lblDateFromDate;
    UIButton *datebtn;
    UIButton *daysbtn;
    UIButton *membun;
     UIButton *share;
    UIButton *emial;
    BOOL mm;
    NSString *nm;
}
@property(nonatomic,retain)UIView *customPickerView;
- (BOOL)validateEmail:(NSString *)emailStr;
@end
