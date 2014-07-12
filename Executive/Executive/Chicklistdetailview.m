//
//  Chicklistdetailview.m
//  Executive
//
//  Created by sji on 7/1/14.
//  Copyright (c) 2014 sji. All rights reserved.
//

#import "Chicklistdetailview.h"
#import "SBJson.h"
#import "comment.h"
#import "UIImageView+WebCache.h"
@interface NSURLRequest (DummyInterface)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host;
+ (void)setAllowsAnyHTTPSCertificate:(BOOL)allow forHost:(NSString*)host;
@end

@implementation Chicklistdetailview
@synthesize headline,discription;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
    UIBarButtonItem *backButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"BackWithTitle@2x.png"] style:UIBarButtonItemStylePlain target:self action:@selector(home)];
    self.navigationItem.leftBarButtonItem=backButton;
    NSString *storename=[[NSUserDefaults standardUserDefaults]objectForKey:@"storename"];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, 150, 40)];
    label.backgroundColor = [UIColor clearColor];
    label.font =[UIFont fontWithName:@"Arial" size:20];
    label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    label.text=storename;
    [label sizeToFit];
    

    user=[[NSUserDefaults standardUserDefaults]objectForKey:@"userid"];
    store2=[[NSUserDefaults standardUserDefaults]objectForKey:@"storeid"];
    checkdisc=[[NSUserDefaults standardUserDefaults]objectForKey:@"checklisttitle"];
    checkid=[[NSUserDefaults standardUserDefaults]objectForKey:@"checklistID"];
    NSLog(@"%@%@",user,store2);
    NSString *post = [NSString stringWithFormat:@"userid=%@&storeid=%@&checklistid=%@",user,store2,checkid];
    
    NSURL *url=[NSURL URLWithString:@"http://www.executeview.com/ci/member/checklistdetails"];
    
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
       NSLog(@"hello the data is:%@",jsonData);
        NSMutableDictionary *response = [jsonData valueForKey:@"checklistdata"];
        self.listDataArray=[[NSMutableArray alloc]init];
        self.customClassObj=[[CustomClass alloc]init];
        self.customClassObj.checklistdis = [response valueForKey:@"checklistdescription"];
        self.customClassObj.checkid = [response valueForKey:@"checklisttitle"];
      NSString *rtrt=[NSString stringWithFormat:@"%@",[response valueForKey:@"image"]];
         NSLog(@"hello the data is:%@",rtrt);
         NSURL *imageURL = [NSURL URLWithString:rtrt];
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
        dispatch_async(queue, ^{
//            NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
//            UIImage *image = [UIImage imageWithData:imageData];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.display setImageWithURL:[NSURL URLWithString:rtrt]
                             placeholderImage:[UIImage imageNamed:@"avatar-placeholder.png"]
                                      options:SDWebImageRefreshCached];
                
            });
           
        });
        
        NSString *str=[NSString stringWithFormat:@"%@",[response valueForKey:@"checklisttitle"]];
        headline.text=str;
        discription.text=[response valueForKey:@"checklistdescription"];
        [self.listDataArray addObject:self.customClassObj];
  NSLog(@"hello the data is:%@",self.customClassObj.image123);
        
    }
    
}
-(void)stop{
    [ai stopAnimating];
}
-(void)home{
    [self.navigationController popViewControllerAnimated:YES];
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
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    comment *sttor = (comment *)[storyboard instantiateViewControllerWithIdentifier:@"comment"];
    [self.navigationController pushViewController:sttor animated:NO];
}

- (IBAction)camera:(id)sender {
    UIImagePickerController *pick=[[UIImagePickerController alloc]init];
    pick.delegate=self;
    pick.sourceType=UIImagePickerControllerSourceTypeCamera;
    
     [self presentModalViewController:pick animated:YES];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [[[SDWebImageManager sharedManager] imageCache] clearDisk];
 [[[SDWebImageManager sharedManager] imageCache] clearMemory];

   yourImage=[info objectForKey:UIImagePickerControllerOriginalImage];
        self.display.image=yourImage;
   
    [self dismissModalViewControllerAnimated:YES];
    [self performSelector:@selector(uploadpic) withObject:nil afterDelay:0.0];

}
-(void)uploadpic
{
    
    CGRect frame = CGRectMake (120.0, 185.0, 80, 80);
    
    ai = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    ai.center=self.view.center;
    [ai startAnimating];
    [self.view addSubview:ai];
    NSData *imageData = UIImageJPEGRepresentation(self.display.image, 0.0);

    NSString *urlString = @"http://www.executeview.com/ci/member/do_upload";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    //    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    //    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    //     [request setHTTPBody:postData];
    NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"satish.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imageData]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
//    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError)
        {
            NSLog(@"sendAsynchronousRequest error=%@", connectionError);
            return;
        }
        
        NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        [ai stopAnimating];
        NSLog(@"Success: %@", string);
    }];
//    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
//    
//    NSLog(@"hello%@",returnString);
//    if (!returnString) {
//        [ai stopAnimating];
//    }
    
}
@end
