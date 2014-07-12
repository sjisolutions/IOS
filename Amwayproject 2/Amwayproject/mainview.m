//
//  mainview.m
//  Amwayproject
//
//  Created by sji on 3/14/14.
//  Copyright (c) 2014 Sjisolutions. All rights reserved.
//

#import "mainview.h"
#import "Addcontactview.h"
#import "serachcontactview.h"

@interface mainview ()

@end

@implementation mainview
@synthesize bv,bv1;
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
    
    nav=self.navigationController.navigationBar;
    UIImage *imm=[UIImage imageNamed:@"tab bar1"];
    [nav setBackgroundImage:imm forBarMetrics:UIBarMetricsDefault];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font =[UIFont fontWithName:@"Helvetica" size:30];
    label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    
    label.text = @"Home";
    self.navigationItem.titleView = label;
    [label sizeToFit];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(5, 350, 155, 25)];
    label1.backgroundColor = [UIColor clearColor];
       label1.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    label1.textAlignment = UITextAlignmentCenter;
    label1.textColor = [UIColor blackColor];
    
    label1.text = @"Add new customer";
//    self.navigationItem.titleView = label;
//    [label sizeToFit];
    [self.view addSubview:label1];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(160, 350, 160, 25)];
    label2.backgroundColor = [UIColor clearColor];
    
    label2.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    label2.textAlignment = UITextAlignmentCenter;
    label2.textColor = [UIColor blackColor];
    
    label2.text = @"Search customer ";
    //    self.navigationItem.titleView = label;
    //    [label sizeToFit];
    [self.view addSubview:label2];

    b1=[UIButton buttonWithType:UIButtonTypeCustom];
    
//    [b1 setBackgroundColor:[UIColor colorWithRed:0 green:190 blue:250 alpha:0.5]];
    [b1 addTarget:self action:@selector(addcontact:) forControlEvents:UIControlEventTouchUpInside];

    [b1 setTintColor:[UIColor blackColor]];
    
    [self.view addSubview:b1];
    b2=[UIButton buttonWithType:UIButtonTypeCustom];
    
        [b2 addTarget:self action:@selector(searchcontactslist:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b2];
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
//        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg1ipad"]]];
        
        label.font =[UIFont fontWithName:@"Arial" size:45];
        [b1 setImage:[UIImage imageNamed:@"customer dataipad.png"] forState:UIControlStateNormal];
        [b2 setImage:[UIImage imageNamed:@"Customer HIstoryipad.png"] forState:UIControlStateNormal];
        [label1 setFrame:CGRectMake(50, 800, 300, 50)];
        [label2 setFrame:CGRectMake(430, 800, 300, 50)];
        label1.font =[UIFont fontWithName:@"Arial" size:35];
        label2.font =[UIFont fontWithName:@"Arial" size:35];
        if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
            [b1 setFrame:CGRectMake(0, -40, 384, 1024)];
            [b2 setFrame:CGRectMake(384, -20, 384, 1024)];
        }else{
            [b1 setFrame:CGRectMake(0, -40, 384, 1024)];
            [b2 setFrame:CGRectMake(384, -20, 384, 1024)];        }
    }else{
        CGRect screen=[[UIScreen mainScreen]bounds];
        if (screen.size.height==568) {
//            [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg15"]]];
            [b1 setImage:[UIImage imageNamed:@"customer data1.png"] forState:UIControlStateNormal];
            [b2 setImage:[UIImage imageNamed:@"Customer HIstory1.png"] forState:UIControlStateNormal];

            if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
                [b1 setFrame:CGRectMake(0, 0, 160, 520)];
                [b2 setFrame:CGRectMake(160, 0, 160, 520)];
                [label1 setFrame:CGRectMake(5, 400, 155, 25)];
                [label2 setFrame:CGRectMake(160, 400, 160, 25)];
                label1.font =[UIFont fontWithName:@"Arial" size:15];
                label2.font =[UIFont fontWithName:@"Arial" size:15];
            }else{
                [b1 setFrame:CGRectMake(0, 0, 160, 520)];
                [b2 setFrame:CGRectMake(160, 0, 160, 520)];
                [label1 setFrame:CGRectMake(5, 400, 155, 25)];
                [label2 setFrame:CGRectMake(160, 400, 160, 25)];
                label1.font =[UIFont fontWithName:@"Arial" size:15];
                label2.font =[UIFont fontWithName:@"Arial" size:15];
            }
        }else{
//            [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg11"]]];
            [b1 setImage:[UIImage imageNamed:@"customer data1.png"] forState:UIControlStateNormal];
            [b2 setImage:[UIImage imageNamed:@"Customer HIstory1.png"] forState:UIControlStateNormal];
            [label1 setFrame:CGRectMake(5, 350, 155, 25)];
            [label2 setFrame:CGRectMake(160, 350, 160, 25)];
            label1.font =[UIFont fontWithName:@"Arial" size:15];
            label2.font =[UIFont fontWithName:@"Arial" size:15];
            [b1 setFrame:CGRectMake(0, 0, 160, 418)];
            [b2 setFrame:CGRectMake(160, 0, 160, 415)];
        }
    }
}
-(void)addcontact:(id)sender{
        Addcontactview *add=[[Addcontactview alloc]init];
    [self.navigationController pushViewController:add animated:YES];
}
-(void)searchcontactslist:(id)sender{
   
    
    serachcontactview *search=[[serachcontactview alloc]init];
    [self.navigationController pushViewController:search animated:YES];
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
