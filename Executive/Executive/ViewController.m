//
//  ViewController.m
//  Executive
//
//  Created by sji on 6/23/14.
//  Copyright (c) 2014 sji. All rights reserved.
//

#import "ViewController.h"
#import "store.h"
#import "SBJson.h"
@interface NSURLRequest (DummyInterface)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host;
+ (void)setAllowsAnyHTTPSCertificate:(BOOL)allow forHost:(NSString*)host;
@end


@implementation ViewController
@synthesize userid,passwd1;
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
     [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Untitled-1.png"]]];
userid.delegate=self;
    passwd1.delegate=self;
    NSString *stt=[[NSUserDefaults standardUserDefaults]objectForKey:@"sucesss"];
    NSString *stt1=[[NSUserDefaults standardUserDefaults]objectForKey:@"iduser"];
    NSString *stt2=[[NSUserDefaults standardUserDefaults]objectForKey:@"password"];
    NSLog(@"the email is:%@",stt);
    if ([stt isEqualToString:@"success"]) {
        NSString *post = [NSString stringWithFormat:@"email=%@&password=%@",stt1,stt2];
        NSURL *url=[NSURL URLWithString:@"http://www.executeview.com/ci/login/welcomepage"];
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
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
            store *sttor = (store *)[storyboard instantiateViewControllerWithIdentifier:@"store"];
            [self.navigationController pushViewController:sttor animated:YES];
        }

    }

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(id)sender {
    NSString *post = [NSString stringWithFormat:@"email=%@&password=%@",userid.text,passwd1.text];
    
    
    NSURL *url=[NSURL URLWithString:@"http://www.executeview.com/ci/login/welcomepage"];
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
        NSLog(@"hai123456789%@",jsonData);
        NSString *strytty=[NSString stringWithFormat:@"%@",[jsonData objectForKey:@"status"]];
        NSInteger success = [(NSNumber *) [jsonData objectForKey:@"User_id"] integerValue];
        [[NSUserDefaults standardUserDefaults]setObject:strytty forKey:@"sucesss"];
        NSLog(@"userid is:%d",success);
        [[NSUserDefaults standardUserDefaults]setObject:userid.text forKey:@"iduser"];
        [[NSUserDefaults standardUserDefaults]setObject:passwd1.text forKey:@"password"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        if([strytty isEqualToString:@"failed"])
        {
            UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please enter valid Username and Password" delegate:self cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
            [alt show];
            

            
        } else {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
            store *sttor = (store *)[storyboard instantiateViewControllerWithIdentifier:@"store"];
            [self.navigationController pushViewController:sttor animated:YES];
            
        }
        
    }

   
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [userid resignFirstResponder];
    [passwd1 resignFirstResponder];
    return YES;
}
@end
