//
//  checklist.m
//  Executive
//
//  Created by sji on 6/23/14.
//  Copyright (c) 2014 sji. All rights reserved.
//

#import "checklist.h"
#import "comment.h"
#import "store.h"
#import "SBJson.h"
#import "Chicklistdetailview.h"
#import "CustomClass.h"
@interface NSURLRequest (DummyInterface)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host;
+ (void)setAllowsAnyHTTPSCertificate:(BOOL)allow forHost:(NSString*)host;
@end

@implementation checklist
@synthesize tab1,tab1vc,tab2vc;
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
    tab1.delegate=self;
    tab1.dataSource=self;
    user=[[NSUserDefaults standardUserDefaults]objectForKey:@"userid"];
    store2=[[NSUserDefaults standardUserDefaults]objectForKey:@"storeid"];
    NSLog(@"%@%@",user,store2);
    NSString *post = [NSString stringWithFormat:@"userid=%@&storeid=%@",user,store2];
    
    NSURL *url=[NSURL URLWithString:@"http://www.executeview.com/ci/member/checklist"];
    
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
        NSLog(@"hello the data:%@",jsonData);
        NSArray *arr1=[[NSArray alloc]init];
        
        arr1=[jsonData objectForKey:@"store"];

         arr1 = [jsonData valueForKey:@"checklistdata"] ;
        NSLog(@"hello the data:%@",arr1);
        for (int i=0; i<[arr1 count]; i++) {
            NSDictionary *dic=arr1[i];
       
         self.listDataArray=[[NSMutableArray alloc]init];
        self.customClassObj=[[CustomClass alloc]init];
        self.customClassObj.checklistdis = [dic valueForKey:@"checklisttitle"];
        self.customClassObj.checkid = [dic valueForKey:@"checklistID"];

        [self.listDataArray addObject:self.customClassObj];
        [tab1 reloadData];
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listDataArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdetif=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdetif];
     CustomClass *ccClass=[self.listDataArray objectAtIndex:indexPath.row];
    if (cell==nil) {
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdetif];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"%@",ccClass.checklistdis];
 cell.textLabel.text=[cell.textLabel.text stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
    cell.accessoryView = [[UIImageView alloc]initWithImage:
                          [UIImage imageNamed:@"backbutton4.png"]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str_key_value=[NSString stringWithFormat:@"%@",[[self.listDataArray valueForKey:@"checklistdis"] objectAtIndex:indexPath.row]];
    NSString *str_key_value1=[NSString stringWithFormat:@"%@",[[self.listDataArray valueForKey:@"checkid"] objectAtIndex:indexPath.row]];
    [[NSUserDefaults standardUserDefaults]setObject:str_key_value forKey:@"checklisttitle"];
    [[NSUserDefaults standardUserDefaults]setObject:str_key_value1 forKey:@"checklistID"];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    Chicklistdetailview *check = (Chicklistdetailview *)[storyboard instantiateViewControllerWithIdentifier:@"Chicklistdetailview"];
//    check.str_key_value=str_key_value;
    [self.navigationController pushViewController:check animated:YES];
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
    [self viewDidLoad];

}
- (IBAction)comment:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    comment *sttor = (comment *)[storyboard instantiateViewControllerWithIdentifier:@"comment"];
    [self.navigationController pushViewController:sttor animated:NO];

}
@end
