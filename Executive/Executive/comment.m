//
//  comment.m
//  Executive
//
//  Created by sji on 6/23/14.
//  Copyright (c) 2014 sji. All rights reserved.
//

#import "comment.h"
#import "SBJson.h"
#import "store.h"
@interface NSURLRequest (DummyInterface)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host;
+ (void)setAllowsAnyHTTPSCertificate:(BOOL)allow forHost:(NSString*)host;
@end


@implementation comment
@synthesize tab2,immm,listData,listDataArray,addcomment;
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
    UIBarButtonItem *backButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"BackWithTitle@2x.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(home)];
    self.navigationItem.leftBarButtonItem=backButton;

    tab2.delegate=self;
    tab2.dataSource=self;
    addcomment.delegate=self;
    NSString *storename=[[NSUserDefaults standardUserDefaults]objectForKey:@"storename"];
    label = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, 220, 40)];
    label.backgroundColor = [UIColor clearColor];
    label.font =[UIFont fontWithName:@"Arial" size:18];
    label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    label.text=storename;
    label.text=[label.text stringByAppendingString:@"Comments"];
    [label sizeToFit];
    user=[[NSUserDefaults standardUserDefaults]objectForKey:@"userid"];
    store1=[[NSUserDefaults standardUserDefaults]objectForKey:@"storeid"];
   NSString *post = [NSString stringWithFormat:@"userid=%@&storeid=%@",user,store1];
    
    NSURL *url=[NSURL URLWithString:@"http://www.executeview.com/ci/member/Getcomments"];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *response = nil;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSLog(@"Response code: %d", [response statusCode]);
    if ([response statusCode] >=200 && [response statusCode] <300)
    {
        NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
        NSLog(@"Response ==> %@", responseData);
        
        SBJsonParser *jsonParser = [SBJsonParser new];
        NSDictionary *jsonData = (NSDictionary *) [jsonParser objectWithString:responseData error:nil];
        self.listDataArray=[[NSMutableArray alloc]init];
        NSArray *array=[[NSArray alloc]init];
        array=[jsonData objectForKey:@"commentlist"];
        for (int i=0; i<[array count]; i++) {
            NSDictionary *dict=array[i];
            self.customClassObj=[[CustomClass alloc]init];
            self.customClassObj.storeid=[dict objectForKey:@"storeid"];
            self.customClassObj.name=[dict objectForKey:@"storename"];
            self.customClassObj.userid=[dict objectForKey:@"userid"];
            self.customClassObj.dateandtime=[dict objectForKey:@"Dateandtime"];
            self.customClassObj.commentdescription=[dict objectForKey:@"Description"];
            self.customClassObj.checklistdescription=[dict objectForKey:@"checklistdescription"];
            self.customClassObj.name1=[dict objectForKey:@"username"];
            
            [self.listDataArray addObject:self.customClassObj];
            [tab2 reloadData];
        }
    }
}
-(void)home{
    for (int i = 0; i<[[self.navigationController viewControllers] count]; i++) {
        
        UIViewController *ctrl = [self.navigationController.viewControllers objectAtIndex:i];
        if ([ctrl isKindOfClass:[store class]]) {
            
            [self.navigationController popToViewController:ctrl animated:YES];
            break;
            
        }
    }
    
}

-(void)viewWillAppear:(BOOL)animated{
    NSString *post = [NSString stringWithFormat:@"userid=%@&storeid=%@",user,store1];
    
    NSURL *url=[NSURL URLWithString:@"http://www.executeview.com/ci/member/Getcomments"];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *response = nil;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSLog(@"Response code: %d", [response statusCode]);
    if ([response statusCode] >=200 && [response statusCode] <300)
    {
        NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
        NSLog(@"Response ==> %@", responseData);
        
        SBJsonParser *jsonParser = [SBJsonParser new];
        NSDictionary *jsonData = (NSDictionary *) [jsonParser objectWithString:responseData error:nil];
        NSLog(@"hai%@",jsonData);
        self.listDataArray=[[NSMutableArray alloc]init];
        NSArray *array=[[NSArray alloc]init];
        array=[jsonData objectForKey:@"commentlist"];
        for (int i=0; i<[array count]; i++) {
            NSDictionary *dict=array[i];
            self.customClassObj=[[CustomClass alloc]init];
            self.customClassObj.storeid=[dict objectForKey:@"storeid"];
            self.customClassObj.name=[dict objectForKey:@"storename"];
            self.customClassObj.userid=[dict objectForKey:@"userid"];
            self.customClassObj.dateandtime=[dict objectForKey:@"Dateandtime"];
            self.customClassObj.commentdescription=[dict objectForKey:@"Description"];
            self.customClassObj.checklistdescription=[dict objectForKey:@"checklistdescription"];
            self.customClassObj.name1=[dict objectForKey:@"username"];
            
            [self.listDataArray addObject:self.customClassObj];
            [tab2 reloadData];
        }
    }

    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    CustomClass *ccClass=[self.listDataArray objectAtIndex:indexPath.row];
    
    NSString * text = ccClass.commentdescription;
    
    NSLog(@"%d ",[text length]);
    
    if ([text length] < 30)
    {
        
        return 45;
    }
    else
    {
        NSString * aString = [NSString stringWithFormat:@"%@,%@",ccClass.dateandtime,ccClass.name1];
        
        UIFont * font = [UIFont systemFontOfSize:12 ];
        
        CGSize stringSize = [aString sizeWithFont:font];
        
        CGFloat height = stringSize.height;
        
        return [text length]+ height+height;
        
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listDataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdetif=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdetif];
    CustomClass *ccClass=[self.listDataArray objectAtIndex:indexPath.row];
    NSLog(@"hsdfhsdhff:%@",ccClass.commentdescription);

    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdetif];
        
    }
    
    UIFont * font = [UIFont systemFontOfSize:12 ];
    
    CGSize stringSize = [ccClass.commentdescription sizeWithFont:font];
    
    CGFloat height = stringSize.height;
    CGFloat width = stringSize.width;
    
    
    if ([ccClass.commentdescription length]<30)
    {
        
    }
    else
    {
        cell.textLabel.frame = CGRectMake(0, 0,width ,height );
        cell.detailTextLabel.frame = CGRectMake(0, cell.textLabel.frame.size.height + 100, 50, 30);
    }
    
    cell.textLabel.text=[NSString stringWithFormat:@"%@",ccClass.commentdescription];
    cell.textLabel.text=[cell.textLabel.text stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
    cell.textLabel.numberOfLines=0;
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@,%@",ccClass.dateandtime,ccClass.name1];
     cell.detailTextLabel.text=[cell.detailTextLabel.text stringByReplacingOccurrencesOfString:@"(null)," withString:@""];
    cell.detailTextLabel.text=[cell.detailTextLabel.text stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
    return cell;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [addcomment setFrame:CGRectMake(0, 323, 320, 30)];
    [tab2 setFrame:CGRectMake(0, 0, 320, 320)];
    
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
    [addcomment setFrame:CGRectMake(0, 476, 320, 30)];
    [tab2 setFrame:CGRectMake(0, 59, 320, 416)];
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (addcomment.text!=Nil) {
        [addcomment resignFirstResponder];
        
        //     add comment when i enter text in text field
        
        NSString *post = [NSString stringWithFormat:@"userid=%@&storeid=%@&description=%@",user,store1,addcomment.text];
        
        NSURL *url=[NSURL URLWithString:@"http://www.executeview.com/ci/member/addcomment"];
        
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        
        [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
        
        NSError *error = [[NSError alloc] init];
        NSHTTPURLResponse *response = nil;
        NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        NSLog(@"Response code: %d", [response statusCode]);
        if ([response statusCode] >=200 && [response statusCode] <300)
        {
            NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
            NSLog(@"Response ==> %@", responseData);
            
            SBJsonParser *jsonParser = [SBJsonParser new];
            NSDictionary *jsonData = (NSDictionary *) [jsonParser objectWithString:responseData error:nil];
            NSLog(@"hai%@",[jsonData objectForKey:@"status"]);
            [tab2 reloadData];
            [self viewWillAppear:YES];
            
            addcomment.text = @"";

        }

      
    }else{
          NSLog(@"sdfgswdgfhs");
        UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please enter valid Username and Password" delegate:self cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [alt show];
       [addcomment resignFirstResponder];
    }
    
    return YES;
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

- (IBAction)checklist:(id)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

- (IBAction)comment:(id)sender {
}
@end
