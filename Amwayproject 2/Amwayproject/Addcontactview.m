//
//  Addcontactview.m
//  Amwayproject
//
//  Created by sji on 3/14/14.
//  Copyright (c) 2014 Sjisolutions. All rights reserved.
//

#import "Addcontactview.h"
#define ACCEPTED_CHARS_PHONE @"+0123456789 "
BOOL go;
@interface Addcontactview ()

@end

@implementation Addcontactview
@synthesize customPickerView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINavigationBar *nav = self.navigationController.navigationBar;
    //[self.navigationItem setTitle:@"Beauty Care"];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, 150, 40)];
    label.backgroundColor = [UIColor clearColor];
    label.font =[UIFont fontWithName:@"Arial" size:20];
    label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    
    label.text = @"Add new customer";
    self.navigationItem.titleView = label;
    [label sizeToFit];

    scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,320,480)];
    
    scrollview.showsVerticalScrollIndicator=YES;
    scrollview.scrollEnabled=YES;
    scrollview.userInteractionEnabled=YES;
    [self.view addSubview:scrollview];
//
    savebut = [UIButton buttonWithType:UIButtonTypeCustom];
[savebut addTarget:self action:@selector(saveinformation) forControlEvents:UIControlEventTouchUpInside];
    [savebut setTitle:@"Save" forState:UIControlStateNormal];
    [savebut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [savebut setBackgroundImage:[UIImage imageNamed:@"s.png"] forState:UIControlStateNormal];
    savebut.tintColor=[UIColor blueColor];
    [scrollview addSubview:savebut];
//
    namef1 = [[UITextField alloc]initWithFrame:CGRectMake(120, 25, 180, 30)];
    namef1.delegate=self;
   
    namef1.font = [UIFont fontWithName:@"Arial" size:13];
    namef1.adjustsFontSizeToFitWidth = YES;
    namef1.returnKeyType = UIReturnKeyDone;
    [namef1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
    namef1.placeholder= @"  First name and last name";
    [namef1 setBackgroundColor:[UIColor whiteColor]];
    
    [scrollview addSubview:namef1];
 //
    namel1 = [[UITextField alloc]initWithFrame:CGRectMake(120, 65, 180, 30)];
    namel1.placeholder = @"  Last name";
    [namel1 setBackground:[UIImage imageNamed:@"bbbb.png"]];

    namel1.font = [UIFont fontWithName:@"Arial" size:13];
    namel1.delegate=self;
    namel1.adjustsFontSizeToFitWidth = YES;

    [namel1 setBackgroundColor:[UIColor whiteColor]];
    namel1.returnKeyType = UIReturnKeyDone;
//    [scrollview addSubview:namel1];
 //
    numphone1 = [[UITextField alloc]initWithFrame:CGRectMake(120, 105, 180, 30)];
    numphone1.placeholder = @"  Contact number";
    numphone1.delegate=self;
    numphone1.font = [UIFont fontWithName:@"Arial" size:13];
    numphone1.adjustsFontSizeToFitWidth = YES;
    [numphone1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
    [numphone1 addTarget:self action:@selector(checknumber) forControlEvents:UIControlEventEditingDidEnd];
    [numphone1 setBackgroundColor:[UIColor whiteColor]];
    
    
    [numphone1 setKeyboardType:UIKeyboardTypeNumberPad];
    
numphone1.returnKeyType = UIReturnKeyDone;
    [scrollview addSubview:numphone1];
 //
    idemail1 = [[UITextField alloc]initWithFrame:CGRectMake(120, 145, 180, 30)];
    idemail1.placeholder = @"  Email address";
    idemail1.delegate=self;
    idemail1.font = [UIFont fontWithName:@"Arial" size:13];
    [idemail1 setBackgroundColor:[UIColor whiteColor]];
    [idemail1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
    idemail1.adjustsFontSizeToFitWidth = YES;
     idemail1.autocapitalizationType = UITextAutocapitalizationTypeNone;
//    [idemail1 addTarget:self action:@selector(emailvalidate) forControlEvents:UIControlEventEditingDidEnd];
    idemail1.returnKeyType = UIReturnKeyDone;
    [scrollview addSubview:idemail1];
 //
    
    mem1 = [[UITextField alloc]initWithFrame:CGRectMake(120, 185, 180, 30)];
    mem1.placeholder = @"  Member";
    mem1.delegate=self;
    mem1.font = [UIFont fontWithName:@"Arial" size:13];
    mem1.adjustsFontSizeToFitWidth = YES;
    mem1.returnKeyType = UIReturnKeyDone;
    [mem1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
    [mem1 setBackgroundColor:[UIColor whiteColor]];
    [scrollview addSubview:mem1];
    
//
    stat1 = [[UITextField alloc]initWithFrame:CGRectMake(120, 225, 180, 40)];
    stat1.placeholder = @"  Job/Student";
    stat1.delegate=self;
    [stat1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
    [stat1 setBackgroundColor:[UIColor whiteColor]];
    stat1.font = [UIFont fontWithName:@"Arial" size:13];
    stat1.adjustsFontSizeToFitWidth = YES;
    stat1.returnKeyType = UIReturnKeyDone;
    [scrollview addSubview:stat1];
//
    edu1 = [[UITextField alloc]initWithFrame:CGRectMake(120, 273, 180, 40)];
    edu1.placeholder = @"  Qualification";
    edu1.delegate=self;
    [edu1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
    [edu1 setBackgroundColor:[UIColor whiteColor]];
    edu1.font = [UIFont fontWithName:@"Arial" size:13];
    edu1.adjustsFontSizeToFitWidth = YES;
    edu1.returnKeyType = UIReturnKeyDone;
    [scrollview addSubview:edu1];
//
    loccollege1 = [[UITextField alloc]initWithFrame:CGRectMake(120, 305, 180, 40)];
    loccollege1.placeholder = @"  College location";
    loccollege1.delegate=self;
    [loccollege1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
    [loccollege1 setBackgroundColor:[UIColor whiteColor]];
    loccollege1.font = [UIFont fontWithName:@"Arial" size:13];
    loccollege1.adjustsFontSizeToFitWidth = YES;
    loccollege1.returnKeyType = UIReturnKeyDone;
    [scrollview addSubview:loccollege1];
//
    statecollege1 = [[UITextField alloc]initWithFrame:CGRectMake(120, 350, 180, 40)];
    statecollege1.placeholder = @"  College state";
    statecollege1.delegate=self;
    [statecollege1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
    [statecollege1 setBackgroundColor:[UIColor whiteColor]];
    statecollege1.font = [UIFont fontWithName:@"Arial" size:13];
    statecollege1.adjustsFontSizeToFitWidth = YES;
    statecollege1.returnKeyType = UIReturnKeyDone;
    [scrollview addSubview:statecollege1];
//
    loccurrent1 = [[UITextField alloc]initWithFrame:CGRectMake(120, 395, 180, 40)];
    loccurrent1.placeholder = @"  Current location";
    loccurrent1.delegate=self;
    [loccurrent1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
    [loccurrent1 setBackgroundColor:[UIColor whiteColor]];
    loccurrent1.font = [UIFont fontWithName:@"Arial" size:13];
    loccurrent1.adjustsFontSizeToFitWidth = YES;
    loccurrent1.returnKeyType = UIReturnKeyDone;
    [scrollview addSubview:loccurrent1];
//
    statecurrent1 = [[UITextField alloc]initWithFrame:CGRectMake(120, 425, 180, 40)];
    statecurrent1.placeholder = @"  Current state";
    statecurrent1.delegate=self;
    [statecurrent1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
    [statecurrent1 setBackgroundColor:[UIColor whiteColor]];
    statecurrent1.font = [UIFont fontWithName:@"Arial" size:13];
    statecurrent1.adjustsFontSizeToFitWidth = YES;
    statecurrent1.returnKeyType = UIReturnKeyDone;
    [scrollview addSubview:statecurrent1];
//
    ideashared1 = [[UITextField alloc]initWithFrame:CGRectMake(120, 465, 180, 40)];
    ideashared1.placeholder = @"  Share your ideas";
    ideashared1.delegate=self;
    [ideashared1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
    [ideashared1 setBackgroundColor:[UIColor whiteColor]];
    ideashared1.font = [UIFont fontWithName:@"Arial" size:13];
    ideashared1.adjustsFontSizeToFitWidth = YES;
    ideashared1.returnKeyType = UIReturnKeyDone;
    [scrollview addSubview:ideashared1];
//
    dec1 = [[UITextField alloc]initWithFrame:CGRectMake(120, 505, 180, 40)];
    dec1.placeholder = @"  Your decision";
    dec1.delegate=self;
    [dec1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
    [dec1 setBackgroundColor:[UIColor whiteColor]];
    dec1.font = [UIFont fontWithName:@"Arial" size:13];
    dec1.adjustsFontSizeToFitWidth = YES;
    dec1.returnKeyType = UIReturnKeyDone;
    [scrollview addSubview:dec1];
//
    meetnext1 = [[UITextField alloc]initWithFrame:CGRectMake(120, 545, 180, 40)];
    meetnext1.placeholder = @"  Next meet date";
    meetnext1.delegate=self;
    [meetnext1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
    [meetnext1 setBackgroundColor:[UIColor whiteColor]];
    meetnext1.font = [UIFont fontWithName:@"Arial" size:13];
    meetnext1.adjustsFontSizeToFitWidth = YES;
    meetnext1.returnKeyType = UIReturnKeyDone;
    [scrollview addSubview:meetnext1];
//
    conferencelocation1 = [[UITextField alloc]initWithFrame:CGRectMake(120, 585, 180, 40)];
    conferencelocation1.placeholder = @"   Nearest conference location";
    conferencelocation1.delegate=self;
    [conferencelocation1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
    [conferencelocation1 setBackgroundColor:[UIColor whiteColor]];
    conferencelocation1.font = [UIFont fontWithName:@"Arial" size:13];
    conferencelocation1.adjustsFontSizeToFitWidth = YES;
    conferencelocation1.returnKeyType = UIReturnKeyDone;
    [scrollview addSubview:conferencelocation1];
//    
   notebrief1 = [[UITextView alloc]initWithFrame:CGRectMake(120, 635, 180, 150)];
    notebrief1.delegate=self;
   [notebrief1 setBackgroundColor:[UIColor whiteColor]];
    notebrief1.font = [UIFont fontWithName:@"Arial" size:12];
   
 notebrief1.text = @"Note:";
    notebrief1.scrollEnabled = YES;
    notebrief1.pagingEnabled = YES;
    notebrief1.textColor = [UIColor lightGrayColor];
    notebrief1.editable = YES;
    [notebrief1.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [notebrief1.layer setBorderWidth:2.0];
    notebrief1.layer.cornerRadius = 5.0;
    notebrief1.clipsToBounds = YES;
    [scrollview addSubview:notebrief1];
//    
    decissionarray=[[NSMutableArray alloc]initWithObjects:@"Yes",@"No",@"Later", nil];
    decissionarray1=[[NSMutableArray alloc]initWithObjects:@"Yes",@"No", nil];

//   
    datebtn=[UIButton buttonWithType:UIButtonTypeCustom];
	
    [datebtn addTarget:self action:@selector(datebutton:) forControlEvents:UIControlEventTouchUpInside];
    
	[scrollview addSubview:datebtn];
//    
    membun=[UIButton buttonWithType:UIButtonTypeCustom];
	
    [membun addTarget:self action:@selector(datebutton1:) forControlEvents:UIControlEventTouchUpInside];
    
	[scrollview addSubview:membun];
    share=[UIButton buttonWithType:UIButtonTypeCustom];
	
    [share addTarget:self action:@selector(datebutton2:) forControlEvents:UIControlEventTouchUpInside];
    
	[scrollview addSubview:share];
//    
    daysbtn=[UIButton buttonWithType:UIButtonTypeCustom];
	
    [daysbtn addTarget:self action:@selector(btnDateFrom_TouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
	[scrollview addSubview:daysbtn];
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        [nav setFrame:CGRectMake(0, 0, 768, 84)];
        [label setFrame:CGRectMake(200, 10, 300, 80)];
        label.font =[UIFont fontWithName:@"Arial" size:45];
        savebut.font=[UIFont fontWithName:@"Arial" size:30];
        namef.font = [UIFont fontWithName:@"Arial" size:30];
        [namef1 setBackground:[UIImage imageNamed:@"bar.png"]];
        namel.font = [UIFont fontWithName:@"Arial" size:30];
        numphone.font = [UIFont fontWithName:@"Arial" size:30];
        idemail.font = [UIFont fontWithName:@"Arial" size:30];
        mem.font = [UIFont fontWithName:@"Arial" size:30];
        loccollege.font = [UIFont fontWithName:@"Arial" size:30];
        edu.font = [UIFont fontWithName:@"Arial" size:30];
        stat.font = [UIFont fontWithName:@"Arial" size:30];
        loccurrent.font = [UIFont fontWithName:@"Arial" size:30];
        statecurrent.font = [UIFont fontWithName:@"Arial" size:30];
        statecollege.font = [UIFont fontWithName:@"Arial" size:30];
        ideashared.font = [UIFont fontWithName:@"Arial" size:30];
        dec.font = [UIFont fontWithName:@"Arial" size:30];
        meetnext.font = [UIFont fontWithName:@"Arial" size:30];
        phot.font = [UIFont fontWithName:@"Arial" size:30];
        conferencelocation.font = [UIFont fontWithName:@"Arial" size:30];
        notebrief.font = [UIFont fontWithName:@"Arial" size:30];
        namef1.font = [UIFont fontWithName:@"Arial" size:30];

         namel1.font = [UIFont fontWithName:@"Arial" size:30];
        numphone1.font = [UIFont fontWithName:@"Arial" size:30];
        idemail1.font = [UIFont fontWithName:@"Arial" size:30];
        mem1.font = [UIFont fontWithName:@"Arial" size:30];
        loccollege1.font = [UIFont fontWithName:@"Arial" size:30];
        edu1.font = [UIFont fontWithName:@"Arial" size:30];
        stat1.font = [UIFont fontWithName:@"Arial" size:30];
        loccurrent1.font = [UIFont fontWithName:@"Arial" size:30];
        statecurrent1.font = [UIFont fontWithName:@"Arial" size:30];
      statecollege1.font = [UIFont fontWithName:@"Arial" size:30];
        ideashared1.font = [UIFont fontWithName:@"Arial" size:30];
         dec1.font = [UIFont fontWithName:@"Arial" size:30];
        meetnext1.font = [UIFont fontWithName:@"Arial" size:30];
        phot1.font = [UIFont fontWithName:@"Arial" size:30];
        conferencelocation1.font = [UIFont fontWithName:@"Arial" size:30];
        notebrief1.font = [UIFont fontWithName:@"Arial" size:30];
        if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
            [namef1 setBackground:[UIImage imageNamed:@"bar.png"]];
            [namel1 setBackground:[UIImage imageNamed:@"bar.png"]];
            [numphone1 setBackground:[UIImage imageNamed:@"bar.png"]];
            [idemail1 setBackground:[UIImage imageNamed:@"bar.png"]];
            [mem1 setBackground:[UIImage imageNamed:@"bar.png"]];
            [stat1 setBackground:[UIImage imageNamed:@"bar.png"]];
            [edu1 setBackground:[UIImage imageNamed:@"bar.png"]];
            [statecollege1 setBackground:[UIImage imageNamed:@"bar.png"]];
            [loccollege1 setBackground:[UIImage imageNamed:@"bar.png"]];
            [loccurrent1 setBackground:[UIImage imageNamed:@"bar.png"]];
            [statecurrent1 setBackground:[UIImage imageNamed:@"bar.png"]];
            [ideashared1 setBackground:[UIImage imageNamed:@"bar.png"]];
            [dec1 setBackground:[UIImage imageNamed:@"bar.png"]];
            [meetnext1 setBackground:[UIImage imageNamed:@"bar.png"]];
            [conferencelocation1 setBackground:[UIImage imageNamed:@"bar.png"]];
            [scrollview setFrame:CGRectMake(0,0,768,1000)];
            [scrollview setContentSize:CGSizeMake(320, 1680) ];
            [namef1 setFrame:CGRectMake(35,50, 725, 60)];
            //            [namel1 setFrame:CGRectMake(35,130, 725, 60)];
            [numphone1 setFrame:CGRectMake(35,130, 725, 60)];
            [idemail1 setFrame:CGRectMake(35,210, 725, 60)];
            [mem1 setFrame:CGRectMake(35,290, 725, 60)];
            [stat1 setFrame:CGRectMake(35,370, 725, 60)];
            [edu1 setFrame:CGRectMake(35,450, 725, 60)];
            [statecollege1 setFrame:CGRectMake(35,530, 725, 60)];
            [loccollege1 setFrame:CGRectMake(35,610, 725, 60)];
            [loccurrent1 setFrame:CGRectMake(35,690, 725, 60)];
            [statecurrent1 setFrame:CGRectMake(35,770, 725, 60)];
            [ideashared1 setFrame:CGRectMake(35,850, 725, 60)];
            [dec1 setFrame:CGRectMake(35,930,725, 60)];
            [meetnext1 setFrame:CGRectMake(35,1010, 725, 60)];
            [conferencelocation1 setFrame:CGRectMake(35,1090, 725, 60)];
            [notebrief1 setFrame:CGRectMake(35,1170, 650, 120)];
            datebtn.frame=CGRectMake(35,930,725, 60);
            daysbtn.frame=CGRectMake(35,1010, 725, 60);
            savebut.frame = CGRectMake(300,1400,150.0,60.0);
            membun.frame=CGRectMake(35,290, 725, 60);
            share.frame=CGRectMake(35,850, 725, 60);
            
        }else{
            [scrollview setFrame:CGRectMake(0,0,768,1000)];
            [scrollview setContentSize:CGSizeMake(320, 1680) ];
            [namef1 setFrame:CGRectMake(35,50, 725, 60)];
//            [namel1 setFrame:CGRectMake(35,130, 725, 60)];
            [numphone1 setFrame:CGRectMake(35,130, 725, 60)];
            [idemail1 setFrame:CGRectMake(35,210, 725, 60)];
            [mem1 setFrame:CGRectMake(35,290, 725, 60)];
            [stat1 setFrame:CGRectMake(35,370, 725, 60)];
            [edu1 setFrame:CGRectMake(35,450, 725, 60)];
            [statecollege1 setFrame:CGRectMake(35,530, 725, 60)];
            [loccollege1 setFrame:CGRectMake(35,610, 725, 60)];
            [loccurrent1 setFrame:CGRectMake(35,690, 725, 60)];
            [statecurrent1 setFrame:CGRectMake(35,770, 725, 60)];
            [ideashared1 setFrame:CGRectMake(35,850, 725, 60)];
            [dec1 setFrame:CGRectMake(35,930,725, 60)];
            [meetnext1 setFrame:CGRectMake(35,1010, 725, 60)];
            [conferencelocation1 setFrame:CGRectMake(35,1090, 725, 60)];
            [notebrief1 setFrame:CGRectMake(35,1170, 650, 120)];
            datebtn.frame=CGRectMake(35,930,725, 60);
            daysbtn.frame=CGRectMake(35,1010, 725, 60);
            savebut.frame = CGRectMake(300,1400,150.0,60.0);
            membun.frame=CGRectMake(35,290, 725, 60);
            share.frame=CGRectMake(35,850, 725, 60);
        }
    }else{
        CGRect screen=[[UIScreen mainScreen]bounds];
        if (screen.size.height==568) {
            namef1.font = [UIFont fontWithName:@"Arial" size:15];
            namel1.font = [UIFont fontWithName:@"Arial" size:15];
            numphone1.font = [UIFont fontWithName:@"Arial" size:15];
            idemail1.font = [UIFont fontWithName:@"Arial" size:15];
            mem1.font = [UIFont fontWithName:@"Arial" size:15];
            loccollege1.font = [UIFont fontWithName:@"Arial" size:15];
            edu1.font = [UIFont fontWithName:@"Arial" size:15];
            stat1.font = [UIFont fontWithName:@"Arial" size:15];
            loccurrent1.font = [UIFont fontWithName:@"Arial" size:15];
            statecurrent1.font = [UIFont fontWithName:@"Arial" size:15];
            statecollege1.font = [UIFont fontWithName:@"Arial" size:15];
            ideashared1.font = [UIFont fontWithName:@"Arial" size:15];
            dec1.font = [UIFont fontWithName:@"Arial" size:15];
            meetnext1.font = [UIFont fontWithName:@"Arial" size:15];
            phot1.font = [UIFont fontWithName:@"Arial" size:15];
            conferencelocation1.font = [UIFont fontWithName:@"Arial" size:15];
            notebrief1.font = [UIFont fontWithName:@"Arial" size:15];
            if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
                [namef1 setBackground:[UIImage imageNamed:@"bar.png"]];
                [namel1 setBackground:[UIImage imageNamed:@"bar.png"]];
                [numphone1 setBackground:[UIImage imageNamed:@"bar.png"]];
                [idemail1 setBackground:[UIImage imageNamed:@"bar.png"]];
                [mem1 setBackground:[UIImage imageNamed:@"bar.png"]];
                [stat1 setBackground:[UIImage imageNamed:@"bar.png"]];
                [edu1 setBackground:[UIImage imageNamed:@"bar.png"]];
                [statecollege1 setBackground:[UIImage imageNamed:@"bar.png"]];
                [loccollege1 setBackground:[UIImage imageNamed:@"bar.png"]];
                [loccurrent1 setBackground:[UIImage imageNamed:@"bar.png"]];
                [statecurrent1 setBackground:[UIImage imageNamed:@"bar.png"]];
                [ideashared1 setBackground:[UIImage imageNamed:@"bar.png"]];
                [dec1 setBackground:[UIImage imageNamed:@"bar.png"]];
                [meetnext1 setBackground:[UIImage imageNamed:@"bar.png"]];
                [conferencelocation1 setBackground:[UIImage imageNamed:@"bar.png"]];

                [scrollview setFrame:CGRectMake(0,0,320,520)];
                [scrollview setContentSize:CGSizeMake(320, 915) ];
                [namef1 setFrame:CGRectMake(15, 25, 290, 30)];
                //                [namel1 setFrame:CGRectMake(15, 65, 290, 30)];
                [numphone1 setFrame:CGRectMake(15, 65, 290, 30)];
                [idemail1 setFrame:CGRectMake(15, 105, 290, 30)];
                [mem1 setFrame:CGRectMake(15, 145, 290, 30)];
                [stat1 setFrame:CGRectMake(15, 185, 290, 30)];
                [edu1 setFrame:CGRectMake(15, 225, 290, 30)];
                [statecollege1 setFrame:CGRectMake(15, 305, 290, 30)];
                [loccollege1 setFrame:CGRectMake(15, 268, 290, 30)];
                [loccurrent1 setFrame:CGRectMake(15, 350, 290, 25)];
                [statecurrent1 setFrame:CGRectMake(15, 395, 290, 30)];
                [ideashared1 setFrame:CGRectMake(15, 430, 290, 30)];
                [dec1 setFrame:CGRectMake(15, 465, 290, 30)];
                [meetnext1 setFrame:CGRectMake(15, 505, 290, 30)];
                [conferencelocation1 setFrame:CGRectMake(15, 545, 290, 30)];
                //                [notebrief setFrame:CGRectMake(10,660, 120, 30)];
                [notebrief1 setFrame:CGRectMake(15, 585, 260, 100)];
                datebtn.frame=CGRectMake(15, 465, 290, 30);
                daysbtn.frame=CGRectMake(15, 505, 290, 30);
                savebut.frame = CGRectMake(110,750,100.0,37.0);
                membun.frame=CGRectMake(15, 145, 290, 30);
                share.frame=CGRectMake(15, 430, 290, 30);
            }else{
                [scrollview setFrame:CGRectMake(0,0,320,520)];
                [scrollview setContentSize:CGSizeMake(320, 915) ];
                [namef1 setFrame:CGRectMake(15, 25, 290, 30)];
//                [namel1 setFrame:CGRectMake(15, 65, 290, 30)];
                [numphone1 setFrame:CGRectMake(15, 65, 290, 30)];
                [idemail1 setFrame:CGRectMake(15, 105, 290, 30)];
                [mem1 setFrame:CGRectMake(15, 145, 290, 30)];
                [stat1 setFrame:CGRectMake(15, 185, 290, 30)];
                [edu1 setFrame:CGRectMake(15, 225, 290, 30)];
                [statecollege1 setFrame:CGRectMake(15, 305, 290, 30)];
                [loccollege1 setFrame:CGRectMake(15, 268, 290, 30)];
                [loccurrent1 setFrame:CGRectMake(15, 350, 290, 25)];
                [statecurrent1 setFrame:CGRectMake(15, 395, 290, 30)];
                [ideashared1 setFrame:CGRectMake(15, 430, 290, 30)];
                [dec1 setFrame:CGRectMake(15, 465, 290, 30)];
                [meetnext1 setFrame:CGRectMake(15, 505, 290, 30)];
                [conferencelocation1 setFrame:CGRectMake(15, 545, 290, 30)];
//                [notebrief setFrame:CGRectMake(10,660, 120, 30)];
                [notebrief1 setFrame:CGRectMake(15, 585, 260, 100)];
                datebtn.frame=CGRectMake(15, 465, 290, 30);
                daysbtn.frame=CGRectMake(15, 505, 290, 30);
                savebut.frame = CGRectMake(110,750,100.0,37.0);
                membun.frame=CGRectMake(15, 145, 290, 30);
                share.frame=CGRectMake(15, 430, 290, 30);
            }
        }else{
            [scrollview setFrame:CGRectMake(0,0,320,480)];
            [scrollview setContentSize:CGSizeMake(320, 930) ];
            [namef1 setFrame:CGRectMake(15, 25, 290, 30)];
//            [namel1 setFrame:CGRectMake(15, 65, 290, 30)];
            [numphone1 setFrame:CGRectMake(15, 65, 290, 30)];
            [idemail1 setFrame:CGRectMake(15, 105, 290, 30)];
            [mem1 setFrame:CGRectMake(15, 145, 290, 30)];
            [stat1 setFrame:CGRectMake(15, 185, 290, 30)];
            [edu1 setFrame:CGRectMake(15, 225, 290,27)];
            [statecollege1 setFrame:CGRectMake(15, 305, 290, 30)];
            [loccollege1 setFrame:CGRectMake(15, 268, 290, 30)];
            [loccurrent1 setFrame:CGRectMake(15, 350, 290, 27)];
            [statecurrent1 setFrame:CGRectMake(15, 392, 290, 30)];
            [ideashared1 setFrame:CGRectMake(15, 425, 290, 30)];
            [dec1 setFrame:CGRectMake(15, 465, 290, 30)];
            [meetnext1 setFrame:CGRectMake(15, 505, 290, 30)];
            [conferencelocation1 setFrame:CGRectMake(15, 545, 290, 30)];
            [notebrief1 setFrame:CGRectMake(15, 593, 260, 100)];
            datebtn.frame=CGRectMake(15, 465, 290, 25);
            daysbtn.frame=CGRectMake(15, 505, 290, 40);
            savebut.frame = CGRectMake(110,760,100.0,37.0);
            membun.frame=CGRectMake(15, 145, 290, 30);
             share.frame=CGRectMake(15, 425, 290, 30);


        }
    }
    
    

    
}
-(void)checknumber{
   nm = numphone1.text;
    
    int len = nm.length;
    
    if(len == 0)
        return;
    
    NSString *ss = [nm substringFromIndex:len-1];
    
    // NSLog(@"%@",ss);
    
    NSRange rng = [ACCEPTED_CHARS_PHONE rangeOfString:ss];
    
    go = YES;
    
    
    if([ss isEqualToString:@"+" ] && len > 1)
    {
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"Invalid Entry" message:@" + is allowed only in the beginning" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        
        go = NO;
        
        numphone1.text = [nm substringToIndex:len-1];
        
        [av show];
        
        return;
    }
    
    
    if(rng.length == 0)
    {
        numphone1.text = [nm substringToIndex:len-1];
        
        NSString *msg = [NSString stringWithFormat:@"Entered Character %@ is Invalid in this textfield",ss];
        
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"Invalid Entry" message:msg delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        
        go = NO;
        
        [av show];
        
        return;
    }
    
    go = YES;

}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
        [textView resignFirstResponder];
    return YES;
}

-(void)btnDateFrom_TouchUpInside:(UIButton*)sender
{
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
            [meetnext1 setBackground:[UIImage imageNamed:@"blue bare for ios7.png"]];
        }else{
           [meetnext1 setBackground:[UIImage imageNamed:@"bar blue.png"]];
        }
    }else{
        CGRect screen=[[UIScreen mainScreen]bounds];
        if (screen.size.height==568) {
            if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
                [meetnext1 setBackground:[UIImage imageNamed:@"blue bare for ios7.png"]];
            }else{
              [meetnext1 setBackground:[UIImage imageNamed:@"bar blue.png"]];
            }
        }else{
            [meetnext1 setBackground:[UIImage imageNamed:@"bar blue.png"]];
        }
    }

    
    [customPickerViewTime2 setHidden:YES];
    [customPickerViewTime1 setHidden:YES];
    [customPickerViewTime setHidden:YES];
	[namel1 resignFirstResponder];
    [numphone1 resignFirstResponder];
    [idemail1 resignFirstResponder];
    [mem1 resignFirstResponder];
    [stat1 resignFirstResponder];
    [edu1 resignFirstResponder];
    [datebtn resignFirstResponder];
    [daysbtn resignFirstResponder];
    
    [loccollege1 resignFirstResponder];
    [statecollege1 resignFirstResponder];
    [loccurrent1 resignFirstResponder];
    [statecurrent1 resignFirstResponder];
    [ideashared1 resignFirstResponder];
    [dec1 resignFirstResponder];
    [phot1 resignFirstResponder];
    [conferencelocation1 resignFirstResponder];
    [notebrief1 resignFirstResponder];

    customPickerView.center =CGPointMake(160,600);
	
	if(pickerView!=nil)
	{
		[pickerView removeFromSuperview];
		pickerView=nil;
	}
	
    customPickerView = [[UIView alloc] initWithFrame:CGRectMake(0,650,320,300)];
	customPickerView.tag = 200;
	[self.view addSubview:customPickerView];
	
	
	//Adding toolbar
	UIToolbar *toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
	UIBarButtonItem *barButtonDone =[[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(donebbuttonclicked:)];
	UIBarButtonItem *barButtonSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
	toolBar.items = [[NSArray alloc] initWithObjects:barButtonSpace,barButtonDone,nil];
	[customPickerView addSubview:toolBar];
    
    //Adding picker view
	pickerView=[[UIDatePicker alloc]initWithFrame:CGRectMake(0, 44, 320, 250)];
	pickerView.datePickerMode = UIDatePickerModeDate;
    pickerView.hidden = NO;
    pickerView.tag=sender.tag;
	pickerView.date = [NSDate date];
	pickerView.backgroundColor=[UIColor clearColor];
	pickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [pickerView addTarget:self
	               action:@selector(changeDateFromLabel:)
	     forControlEvents:UIControlEventValueChanged];
	[customPickerView addSubview:pickerView];
	
	
	
	[self.view bringSubviewToFront:customPickerView];
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        customPickerView.center =CGPointMake(200,200);
        if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
            [customPickerView setFrame:CGRectMake(0,1200,768,600)];
            [toolBar setFrame:CGRectMake(0, 60, 768, 44)];
            [toolBar setBackgroundImage:[UIImage imageNamed:@"tab bar5.png"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
            [pickerView setFrame:CGRectMake(0, 100, 768,800)];
             [pickerView setBackgroundColor:[UIColor whiteColor]];
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.5];
            customPickerView.center =CGPointMake(385,858);
            [UIView commitAnimations];
//            customPickerView.center =CGPointMake(600,300);

        }else{
            [customPickerView setFrame:CGRectMake(0,1200,768,600)];
            [toolBar setFrame:CGRectMake(0, 60, 768, 44)];
            [toolBar setBackgroundImage:[UIImage imageNamed:@"tab bar5.png"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
            [pickerView setBackgroundColor:[UIColor whiteColor]];
            [customPickerView setBackgroundColor:[UIColor whiteColor]];

            [pickerView setFrame:CGRectMake(0, 100, 768,800)];
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.5];
            customPickerView.center =CGPointMake(385,858);
            [UIView commitAnimations];


        }
    }else{
        CGRect screen=[[UIScreen mainScreen]bounds];
        if (screen.size.height==568) {
            if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
                [customPickerView setFrame:CGRectMake(0,650,320,300)];
                [toolBar setFrame:CGRectMake(0, 0, 320, 44)];
                [pickerView setFrame:CGRectMake(0, 44, 320, 250)];
                [pickerView setBackgroundColor:[UIColor whiteColor]];
[toolBar setBackgroundImage:[UIImage imageNamed:@"tab bar5.png"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
                customPickerView.center =CGPointMake(160,310);

            }else{
                [customPickerView setFrame:CGRectMake(0,650,320,300)];
                [toolBar setFrame:CGRectMake(0, 0, 320, 44)];
                [pickerView setFrame:CGRectMake(0, 44, 320, 250)];
                [toolBar setBackgroundImage:[UIImage imageNamed:@"tab bar5.png"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
                [pickerView setBackgroundColor:[UIColor whiteColor]];
                [customPickerView setBackgroundColor:[UIColor whiteColor]];

                customPickerView.center =CGPointMake(160,310);

            }
        }else{
            [customPickerView setFrame:CGRectMake(0,650,320,300)];
            [toolBar setFrame:CGRectMake(0, 0, 320, 44)];
            [toolBar setBackgroundImage:[UIImage imageNamed:@"tab bar5.png"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
            [pickerView setBackgroundColor:[UIColor whiteColor]];
            [customPickerView setBackgroundColor:[UIColor whiteColor]];

            [pickerView setFrame:CGRectMake(0, 44, 320, 250)];
            customPickerView.center =CGPointMake(160,310);
        }
    }
    
    
}
- (void)changeDateFromLabel:(id)sender
{
    isSelectedPicker=YES;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
	[df setDateFormat:@"MM-dd-yyyy"];

	meetnext1.text = [NSString stringWithFormat:@"%@",
                            [df stringFromDate:pickerView.date]];
    NSString *str=@"   ";
    meetnext1.text=[str stringByAppendingString:meetnext1.text];
}

-(void)donebbuttonclicked:(id)sender
{
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
            [meetnext1 setBackground:[UIImage imageNamed:@"bar.png"]];
        }else{
           [meetnext1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
        }
    }else{
        CGRect screen=[[UIScreen mainScreen]bounds];
        if (screen.size.height==568) {
            if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
                [meetnext1 setBackground:[UIImage imageNamed:@"bar.png"]];
                
            }else{
               [meetnext1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
            }
        }else{
            [meetnext1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
        }
    }

    
    [customPickerView setHidden:YES];
    NSDateFormatter *df1 = [[NSDateFormatter alloc] init];
	[df1 setDateFormat:@"MM-dd-yyyy"];
	meetnext1.text = [NSString stringWithFormat:@"%@",
                            [df1 stringFromDate:pickerView.date]];
    NSString *str=@"   ";
    meetnext1.text=[str stringByAppendingString:meetnext1.text];
}


-(IBAction)datebutton:(id)sender
{
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
            [dec1 setBackground:[UIImage imageNamed:@"blue bare for ios7.png"]];
        }else{
            [dec1 setBackground:[UIImage imageNamed:@"bar blue.png"]];
        }
    }else{
        CGRect screen=[[UIScreen mainScreen]bounds];
        if (screen.size.height==568) {
            if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
                [dec1 setBackground:[UIImage imageNamed:@"blue bare for ios7.png"]];
            }else{
                [dec1 setBackground:[UIImage imageNamed:@"bar blue.png"]];
            }
        }else{
            [dec1 setBackground:[UIImage imageNamed:@"bar blue.png"]];
        }
    }
    
    [namel1 resignFirstResponder];
    [numphone1 resignFirstResponder];
    [idemail1 resignFirstResponder];
    [mem1 resignFirstResponder];
    [stat1 resignFirstResponder];
    [edu1 resignFirstResponder];
    [datebtn resignFirstResponder];
    [daysbtn resignFirstResponder];
    
    [loccollege1 resignFirstResponder];
    [statecollege1 resignFirstResponder];
    [loccurrent1 resignFirstResponder];
    [statecurrent1 resignFirstResponder];
    [ideashared1 resignFirstResponder];
    
    [meetnext1 resignFirstResponder];
    [phot1 resignFirstResponder];
    [conferencelocation1 resignFirstResponder];
    [notebrief1 resignFirstResponder];
    [customPickerViewTime1 setHidden:YES];
    [customPickerViewTime2 setHidden:YES];
  [customPickerView setHidden:YES];
    customPickerViewTime = [[UIView alloc] initWithFrame:CGRectMake(0,650,320,300)];
	customPickerViewTime.tag = 200;
	[self.view addSubview:customPickerViewTime];
	
	//Adding toolbar
	UIToolbar *toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
	UIBarButtonItem *barButtonDone =[[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(daysbtn:)];
    
	UIBarButtonItem *barButtonSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
	toolBar.items = [[NSArray alloc] initWithObjects:barButtonSpace,barButtonDone,nil];
	[customPickerViewTime addSubview:toolBar];
    //Adding picker view
	dayspicker=[[UIPickerView alloc]initWithFrame:CGRectMake(0, 44, 320, 250)];
    dayspicker.showsSelectionIndicator = YES;
    [dayspicker setDataSource: self];
    [dayspicker setDelegate: self];
    dayspicker.tag=2;
    [customPickerViewTime addSubview:dayspicker];
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.5];
	customPickerViewTime.center =CGPointMake(160,310);
	[UIView commitAnimations];
	[self.view bringSubviewToFront:customPickerViewTime];
    
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
            [customPickerViewTime setFrame:CGRectMake(0,1200,768,300)];
             [toolBar setBackgroundImage:[UIImage imageNamed:@"tab bar5.png"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
            [toolBar setFrame:CGRectMake(0, 0, 768, 44)];
            [dayspicker setFrame:CGRectMake(0, 44, 768, 250)];
             [dayspicker setBackgroundColor:[UIColor whiteColor]];
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.5];
            customPickerViewTime.center =CGPointMake(385,768);
            [UIView commitAnimations];
            
        }else{
            [customPickerViewTime setFrame:CGRectMake(0,1200,768,300)];
            [toolBar setBackgroundImage:[UIImage imageNamed:@"tab bar5.png"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
            [dayspicker setBackgroundColor:[UIColor whiteColor]];
            [customPickerViewTime setBackgroundColor:[UIColor whiteColor]];

            [toolBar setFrame:CGRectMake(0, 0, 768, 44)];
            [dayspicker setFrame:CGRectMake(0, 44, 768, 250)];
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.5];
            customPickerViewTime.center =CGPointMake(385,768);
            [UIView commitAnimations];        }
    }else{
        CGRect screen=[[UIScreen mainScreen]bounds];
        if (screen.size.height==568) {
            if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
                [customPickerViewTime setFrame:CGRectMake(0,650,320,300)];
                [toolBar setFrame:CGRectMake(0, 0, 320, 44)];
                [toolBar setBackgroundImage:[UIImage imageNamed:@"tab bar5.png"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
                [dayspicker setBackgroundColor:[UIColor whiteColor]];
                [dayspicker setFrame:CGRectMake(0, 44, 320, 250)];
                dayspicker.layer.borderColor = [UIColor blueColor].CGColor;
                customPickerViewTime.center =CGPointMake(160,350);
            }else{
                [customPickerViewTime setFrame:CGRectMake(0,650,320,300)];
                [toolBar setFrame:CGRectMake(0, 0, 320, 44)];
                [dayspicker setFrame:CGRectMake(0, 44, 320, 250)];
                customPickerViewTime.center =CGPointMake(160,350);
                [toolBar setBackgroundImage:[UIImage imageNamed:@"tab bar5.png"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
                [dayspicker setBackgroundColor:[UIColor whiteColor]];
                [customPickerViewTime setBackgroundColor:[UIColor whiteColor]];

            }
        }else{
            [customPickerViewTime setFrame:CGRectMake(0,650,320,300)];
            [toolBar setFrame:CGRectMake(0, 0, 320, 44)];
             [toolBar setBackgroundImage:[UIImage imageNamed:@"tab bar5.png"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
            [dayspicker setBackgroundColor:[UIColor whiteColor]];
            [customPickerViewTime setBackgroundColor:[UIColor whiteColor]];
            [dayspicker setFrame:CGRectMake(0, 44, 320, 250)];
            customPickerViewTime.center =CGPointMake(160,350);
        }
    }
}
-(IBAction)datebutton1:(id)sender
{
    
    
   
    
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
            [mem1 setBackground:[UIImage imageNamed:@"blue bare for ios7.png"]];
        }else{
            [mem1 setBackground:[UIImage imageNamed:@"bar blue.png"]];
        }
    }else{
        CGRect screen=[[UIScreen mainScreen]bounds];
        if (screen.size.height==568) {
            if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
                [mem1 setBackground:[UIImage imageNamed:@"blue bare for ios7.png"]];
            }else{
                [mem1 setBackground:[UIImage imageNamed:@"bar blue.png"]];
            }
        }else{
            [mem1 setBackground:[UIImage imageNamed:@"bar blue.png"]];
        }
    }
    
    [namel1 resignFirstResponder];
    [numphone1 resignFirstResponder];
    [idemail1 resignFirstResponder];
   
    [stat1 resignFirstResponder];
    [edu1 resignFirstResponder];
    [datebtn resignFirstResponder];
    [daysbtn resignFirstResponder];
    
    [loccollege1 resignFirstResponder];
    [statecollege1 resignFirstResponder];
    [loccurrent1 resignFirstResponder];
    [statecurrent1 resignFirstResponder];
    [ideashared1 resignFirstResponder];
    [dec1 resignFirstResponder];
    [meetnext1 resignFirstResponder];
    [phot1 resignFirstResponder];
    [conferencelocation1 resignFirstResponder];
    [notebrief1 resignFirstResponder];
    [customPickerViewTime2 setHidden:YES];
    [customPickerViewTime setHidden:YES];
    [customPickerView setHidden:YES];
    customPickerViewTime1 = [[UIView alloc] initWithFrame:CGRectMake(0,650,320,300)];
	customPickerViewTime1.tag = 200;
	[self.view addSubview:customPickerViewTime1];
	
	//Adding toolbar
	UIToolbar *toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
	UIBarButtonItem *barButtonDone =[[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(daysbtn:)];
    
	UIBarButtonItem *barButtonSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
	toolBar.items = [[NSArray alloc] initWithObjects:barButtonSpace,barButtonDone,nil];
	[customPickerViewTime1 addSubview:toolBar];
    //Adding picker view
	dayspicker=[[UIPickerView alloc]initWithFrame:CGRectMake(0, 44, 320, 250)];
    dayspicker.showsSelectionIndicator = YES;
    [dayspicker setDataSource: self];
    [dayspicker setDelegate: self];
    dayspicker.tag=1;
    [customPickerViewTime1 addSubview:dayspicker];
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.5];
	
	[UIView commitAnimations];
	[self.view bringSubviewToFront:customPickerViewTime1];
     mm=YES;
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
            [customPickerViewTime1 setFrame:CGRectMake(0,1200,768,300)];
             [toolBar setBackgroundImage:[UIImage imageNamed:@"tab bar5.png"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];            [toolBar setFrame:CGRectMake(0, 0, 768, 44)];
            [dayspicker setFrame:CGRectMake(0, 44, 768, 250)];
             [dayspicker setBackgroundColor:[UIColor whiteColor]];
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.5];
            customPickerViewTime1.center =CGPointMake(385,768);
            [UIView commitAnimations];
            
        }else{
            [customPickerViewTime1 setFrame:CGRectMake(0,1200,768,300)];
            [toolBar setBackgroundImage:[UIImage imageNamed:@"tab bar5.png"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
            [dayspicker setBackgroundColor:[UIColor whiteColor]];
            [customPickerViewTime1 setBackgroundColor:[UIColor whiteColor]];

            [toolBar setFrame:CGRectMake(0, 0, 768, 44)];
            [dayspicker setFrame:CGRectMake(0, 44, 768, 250)];
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.5];
            customPickerViewTime1.center =CGPointMake(385,768);
            [UIView commitAnimations];        }
    }else{
        CGRect screen=[[UIScreen mainScreen]bounds];
        if (screen.size.height==568) {
            if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
                [customPickerViewTime1 setFrame:CGRectMake(0,650,320,300)];
                [toolBar setFrame:CGRectMake(0, 0, 320, 44)];
                 [toolBar setBackgroundImage:[UIImage imageNamed:@"tab bar5.png"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
                [dayspicker setFrame:CGRectMake(0, 44, 320, 250)];
                 [dayspicker setBackgroundColor:[UIColor whiteColor]];
                customPickerViewTime1.center =CGPointMake(160,350);
            }else{
                [customPickerViewTime1 setFrame:CGRectMake(0,650,320,300)];
                [toolBar setFrame:CGRectMake(0, 0, 320, 44)];
                [dayspicker setFrame:CGRectMake(0, 44, 320, 250)];
                [toolBar setBackgroundImage:[UIImage imageNamed:@"tab bar5.png"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
                [dayspicker setBackgroundColor:[UIColor whiteColor]];
                [customPickerViewTime1 setBackgroundColor:[UIColor whiteColor]];

                customPickerViewTime1.center =CGPointMake(160,350);
            }
        }else{
            [customPickerViewTime1 setFrame:CGRectMake(0,650,320,300)];
            [toolBar setFrame:CGRectMake(0, 0, 320, 44)];
            [dayspicker setFrame:CGRectMake(0, 44, 320, 250)];
            [toolBar setBackgroundImage:[UIImage imageNamed:@"tab bar5.png"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
            [dayspicker setBackgroundColor:[UIColor whiteColor]];
            [customPickerViewTime1 setBackgroundColor:[UIColor whiteColor]];

            customPickerViewTime1.center =CGPointMake(160,350);
        }
    }
}
-(IBAction)datebutton2:(id)sender
{
    
    
    
    
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
            [ideashared1 setBackground:[UIImage imageNamed:@"blue bare for ios7.png"]];
        }else{
            [ideashared1 setBackground:[UIImage imageNamed:@"bar blue.png"]];
        }
    }else{
        CGRect screen=[[UIScreen mainScreen]bounds];
        if (screen.size.height==568) {
            if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
                [ideashared1 setBackground:[UIImage imageNamed:@"blue bare for ios7.png"]];
            }else{
                [ideashared1 setBackground:[UIImage imageNamed:@"bar blue.png"]];
            }
        }else{
            [ideashared1 setBackground:[UIImage imageNamed:@"bar blue.png"]];
        }
    }
    
    [namel1 resignFirstResponder];
    [numphone1 resignFirstResponder];
    [idemail1 resignFirstResponder];
    [mem1 resignFirstResponder];
    [stat1 resignFirstResponder];
    [edu1 resignFirstResponder];
    [datebtn resignFirstResponder];
    [daysbtn resignFirstResponder];
    
    [loccollege1 resignFirstResponder];
    [statecollege1 resignFirstResponder];
    [loccurrent1 resignFirstResponder];
    [statecurrent1 resignFirstResponder];
        [dec1 resignFirstResponder];
    [meetnext1 resignFirstResponder];
    [phot1 resignFirstResponder];
    [conferencelocation1 resignFirstResponder];
    [notebrief1 resignFirstResponder];

    [customPickerView setHidden:YES];
    [customPickerViewTime1 setHidden:YES];
    [customPickerViewTime setHidden:YES];
    customPickerViewTime2 = [[UIView alloc] initWithFrame:CGRectMake(0,650,320,300)];
	customPickerViewTime2.tag = 200;
	[self.view addSubview:customPickerViewTime2];
	
	//Adding toolbar
	UIToolbar *toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
	UIBarButtonItem *barButtonDone =[[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(daysbtn:)];
    
	UIBarButtonItem *barButtonSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
	toolBar.items = [[NSArray alloc] initWithObjects:barButtonSpace,barButtonDone,nil];
	[customPickerViewTime2 addSubview:toolBar];
    //Adding picker view
	dayspicker=[[UIPickerView alloc]initWithFrame:CGRectMake(0, 44, 320, 250)];
    dayspicker.showsSelectionIndicator = YES;
    [dayspicker setDataSource: self];
    [dayspicker setDelegate: self];
    dayspicker.tag=3;
    [customPickerViewTime2 addSubview:dayspicker];
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.5];
	
	[UIView commitAnimations];
	[self.view bringSubviewToFront:customPickerViewTime2];
    mm=YES;
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
            [customPickerViewTime2 setFrame:CGRectMake(0,1200,768,300)];
            [toolBar setBackgroundImage:[UIImage imageNamed:@"tab bar5.png"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
            [toolBar setFrame:CGRectMake(0, 0, 768, 44)];
            [dayspicker setFrame:CGRectMake(0, 44, 768, 250)];
             [dayspicker setBackgroundColor:[UIColor whiteColor]];
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.5];
            customPickerViewTime2.center =CGPointMake(385,768);
            [UIView commitAnimations];
            
        }else{
            [customPickerViewTime2 setFrame:CGRectMake(0,1200,768,300)];
            [toolBar setBackgroundImage:[UIImage imageNamed:@"tab bar5.png"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
            [dayspicker setBackgroundColor:[UIColor whiteColor]];
            [customPickerViewTime2 setBackgroundColor:[UIColor whiteColor]];

            [toolBar setFrame:CGRectMake(0, 0, 768, 44)];
            [dayspicker setFrame:CGRectMake(0, 44, 768, 250)];
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.5];
            customPickerViewTime2.center =CGPointMake(385,768);
            [UIView commitAnimations];        }
    }else{
        CGRect screen=[[UIScreen mainScreen]bounds];
        if (screen.size.height==568) {
            if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
                [customPickerViewTime2 setFrame:CGRectMake(0,650,320,300)];
                [toolBar setFrame:CGRectMake(0, 0, 320, 44)];
                 [toolBar setBackgroundImage:[UIImage imageNamed:@"tab bar5.png"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
                [dayspicker setFrame:CGRectMake(0, 44, 320, 250)];
                 [dayspicker setBackgroundColor:[UIColor whiteColor]];
                customPickerViewTime2.center =CGPointMake(160,350);
            }else{
                [customPickerViewTime2 setFrame:CGRectMake(0,650,320,300)];
                [toolBar setFrame:CGRectMake(0, 0, 320, 44)];
                [dayspicker setFrame:CGRectMake(0, 44, 320, 250)];
                [toolBar setBackgroundImage:[UIImage imageNamed:@"tab bar5.png"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
                [dayspicker setBackgroundColor:[UIColor whiteColor]];
                [customPickerViewTime2 setBackgroundColor:[UIColor whiteColor]];

                customPickerViewTime2.center =CGPointMake(160,350);
            }
        }else{
            [customPickerViewTime2 setFrame:CGRectMake(0,650,320,300)];
            [toolBar setFrame:CGRectMake(0, 0, 320, 44)];
            [dayspicker setFrame:CGRectMake(0, 44, 320, 250)];
            [toolBar setBackgroundImage:[UIImage imageNamed:@"tab bar5.png"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
            [dayspicker setBackgroundColor:[UIColor whiteColor]];
            [customPickerViewTime2 setBackgroundColor:[UIColor whiteColor]];

            customPickerViewTime2.center =CGPointMake(160,350);
            
        }
    }
}

-(IBAction)daysbtn:(id)sender
{
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
            [dec1 setBackground:[UIImage imageNamed:@"bar.png"]];
            [mem1 setBackground:[UIImage imageNamed:@"bar.png"]];
            [ideashared1 setBackground:[UIImage imageNamed:@"bar.png"]];
        }else{
            [dec1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
            [mem1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
            [ideashared1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
        }
    }else{
        CGRect screen=[[UIScreen mainScreen]bounds];
        if (screen.size.height==568) {
            if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
                [dec1 setBackground:[UIImage imageNamed:@"bar.png"]];
                [mem1 setBackground:[UIImage imageNamed:@"bar.png"]];
                [ideashared1 setBackground:[UIImage imageNamed:@"bar.png"]];
            }else{
               [dec1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
                [mem1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
                [ideashared1 setBackground:[UIImage imageNamed:@"bbbb.png"]];

            }
        }else{
            [dec1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
            [mem1 setBackground:[UIImage imageNamed:@"bbbb.png"]];
            [ideashared1 setBackground:[UIImage imageNamed:@"bbbb.png"]];

        }
    }
   [customPickerViewTime2 setHidden:YES];
    [customPickerViewTime1 setHidden:YES];
    [customPickerViewTime setHidden:YES];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
	
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
	
	return [decissionarray count];
    
}
- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	
	return [decissionarray objectAtIndex:row];
   
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
        NSString *str1=@"   ";
	if (dayspicker.tag==1) {
        mem1.text=[decissionarray objectAtIndex:row];
        mem1.text=[str1 stringByAppendingString:mem1.text];
  
    }
    if(dayspicker.tag==2){
       
       dec1.text=[decissionarray objectAtIndex:row];
    dec1.text=[str1 stringByAppendingString:dec1.text];
    
    }
    if(dayspicker.tag==3){
        ideashared1.text=[decissionarray objectAtIndex:row];
        ideashared1.text=[str1 stringByAppendingString:ideashared1.text];
        
    }
    
}

-(void)saveinformation{
    

    app=[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context=[app managedObjectContext];
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
       if ([[namef1.text stringByReplacingOccurrencesOfString:@"   " withString:@""] length] ==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Enter First Name " delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return;
       
        
    }
//    if ([[namel1.text stringByReplacingOccurrencesOfString:@"   " withString:@""] length] ==0)
//    {
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Enter Last Name " delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        [alert show];
//        return;
//        
//        
//    }

    
    if (![emailTest evaluateWithObject:[idemail1.text stringByReplacingOccurrencesOfString:@"   " withString:@""]]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Enter valid email address (ex:- abcd @domainname.com) " delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return;
    }

    if ([[loccurrent1.text stringByReplacingOccurrencesOfString:@"   " withString:@""] length] ==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Enter location " delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return;
    }
    if ([[dec1.text stringByReplacingOccurrencesOfString:@"   " withString:@""] length] ==0) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Enter decision " delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        return;
            
    }
    
    else
    {

        cust=[NSEntityDescription insertNewObjectForEntityForName:@"Customerdetails" inManagedObjectContext:context];
    
        cust.fname=namef1.text;
        cust.lname=namel1.text;
        cust.phonenumber=numphone1.text;
        cust.emilid=idemail1.text;
        cust.member=mem1.text;
        cust.status=stat1.text;
        cust.education=edu1.text;
        cust.collegelocation=loccollege1.text;
        cust.collegestate=statecollege1.text;
        cust.currentlocation=loccurrent1.text;
        cust.state=statecurrent1.text;
        cust.sharedidea=ideashared1.text;
        cust.decision=dec1.text;
        cust.nextmeet=meetnext1.text;
        cust.photo=phot1.text;
        cust.nearestconferencelocation=conferencelocation1.text;
        cust.breafnote=notebrief1.text;
        
        NSLog(@"%@",cust);
        UIAlertView  *alert=[[UIAlertView alloc]initWithTitle:@"Sucess" message:@"Your Details Has Been Saved" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
             NSError *error = nil;
      
              if (![context save:&error]) {
                 NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
               }
        
        
        
    }

}
- (BOOL)validateEmail:(NSString *)emailStr
{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
    
}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    notebrief1.text = @"Note:";
    notebrief1.textColor = [UIColor blackColor];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSString *str=@"   ";
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
            [textField setBackground:[UIImage imageNamed:@"blue bare for ios7.png"]];
        }else{
            [textField setBackground:[UIImage imageNamed:@"bar blue.png"]];

        }
    }else{
        CGRect screen=[[UIScreen mainScreen]bounds];
        if (screen.size.height==568) {
            if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {

                [textField setBackground:[UIImage imageNamed:@"blue bare for ios7.png"]];
            }else{
                [textField setBackground:[UIImage imageNamed:@"bar blue.png"]];
            }
        }else{
            [textField setBackground:[UIImage imageNamed:@"bar blue.png"]];
        }
    }
    
    textField.text=str;


      return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
            [textField setBackground:[UIImage imageNamed:@"bar.png"]];
        }else{
           [textField setBackground:[UIImage imageNamed:@"bbbb.png"]];
            
        }
    }else{
        CGRect screen=[[UIScreen mainScreen]bounds];
        if (screen.size.height==568) {
            if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
                [textField setBackground:[UIImage imageNamed:@"bar.png"]];
            }else{
                [textField setBackground:[UIImage imageNamed:@"bbbb.png"]];
            }
        }else{
            [textField setBackground:[UIImage imageNamed:@"bbbb.png"]];
        }
    }
 
    [textField resignFirstResponder];

    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.placeholder = nil;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
if ([textField.text isEqualToString:@""] || [[textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0)
    {
        [textField setText:@""];
        namef1.placeholder= @"  First name and last name";
//        namel1.placeholder = @"  Last name";
        numphone1.placeholder = @"  Contact number";
        idemail1.placeholder = @"  Email address";
        mem1.placeholder = @"  Member";
        stat1.placeholder = @"  Job/Student";
        edu1.placeholder = @"  Qualification";
        loccollege1.placeholder = @"  College location";
        statecollege1.placeholder = @"  College state";
        loccurrent1.placeholder = @"  Current location";
        statecurrent1.placeholder = @"  Current state";
        ideashared1.placeholder = @"  Share your ideas";
        dec1.placeholder = @"  Your decision";
        meetnext1.placeholder = @"  Next meet date";
        conferencelocation1.placeholder = @"   Nearest conference location";

    }
   }
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [namef1 resignFirstResponder];
    [namel1 resignFirstResponder];
    [numphone1 resignFirstResponder];
    [idemail1 resignFirstResponder];
    [mem1 resignFirstResponder];
    [stat1 resignFirstResponder];
    [edu1 resignFirstResponder];
    [datebtn resignFirstResponder];
    [daysbtn resignFirstResponder];
    
    [loccollege1 resignFirstResponder];
    [statecollege1 resignFirstResponder];
    [loccurrent1 resignFirstResponder];
    [statecurrent1 resignFirstResponder];
    [ideashared1 resignFirstResponder];
    [dec1 resignFirstResponder];
    [meetnext1 resignFirstResponder];
    [phot1 resignFirstResponder];
    [conferencelocation1 resignFirstResponder];
    [notebrief1 resignFirstResponder];
    
    return YES;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [numphone1 resignFirstResponder];
//    [numberField resignFirstResponder];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
