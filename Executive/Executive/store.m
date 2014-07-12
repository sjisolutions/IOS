//
//  store.m
//  Executive
//
//  Created by sji on 6/23/14.
//  Copyright (c) 2014 sji. All rights reserved.
//

#import "store.h"
#import "checklist.h"
#import "SBJson.h"
@interface NSURLRequest (DummyInterface)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host;
+ (void)setAllowsAnyHTTPSCertificate:(BOOL)allow forHost:(NSString*)host;
@end

@implementation store
@synthesize tab;
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
     [self.navigationController.navigationBar setHidden:NO];
     self.navigationItem.hidesBackButton = YES;
    tab.delegate=self;
    tab.dataSource=self;
    NSString *urlString =@"http://www.executeview.com/ci/member/websitewelcome";
    NSURL *getCusUrl =[NSURL URLWithString:urlString];
    NSMutableURLRequest *request;
    request = [NSMutableURLRequest requestWithURL:getCusUrl];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [connection start];
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    float wsResponse = [((NSHTTPURLResponse *)response) statusCode];
    NSLog(@"Response is %f",wsResponse);
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    if(self.listData==nil){
        self.listData = [[NSMutableData alloc] init];
    }
    [self.listData appendData:data];
    NSString *aString  = [[NSString alloc] initWithData:self.listData encoding:NSUTF8StringEncoding]
    ;
    NSLog(@"Json data is  %@",aString);
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSError *error;
    NSString *aString  = [[NSString alloc] initWithData:self.listData encoding:NSUTF8StringEncoding]
    ;
    NSLog(@"Json data is  %@",aString);
    id object = [NSJSONSerialization JSONObjectWithData:self.listData options:kNilOptions error:&error];
    if(error){
        NSLog(@"Error:%@", [error description]);
    }else{
        NSLog(@"OBJect discription : %@",[object description]);
        NSLog(@"OBJect is  : %@",object);
        self.listData=nil;
        [self jsonParsedObject:object];
    }
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"the error message is%@", error);
}
-(void)jsonParsedObject:(id)object{
    self.listDataArray=[[NSMutableArray alloc]init];
    NSDictionary *dict=object;
    NSArray *array=[[NSArray alloc]init];
    array=[dict objectForKey:@"store"];
    for (int i=0; i<[array count]; i++) {
        NSDictionary *ci1=array[i];
                  self.customClassObj=[[CustomClass alloc]init];
                    self.customClassObj.name=[ci1 objectForKey:@"storename"];
                   self.customClassObj.userid=[ci1 objectForKey:@"userid"];
                    self.customClassObj.storeid=[ci1 objectForKey:@"storeid"];
                  [self.listDataArray addObject:self.customClassObj];
                 [tab reloadData];
    }
    self.customClassObj.username=[dict objectForKey:@"username"];
    label = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, 150, 40)];
    label.backgroundColor = [UIColor clearColor];
    label.font =[UIFont fontWithName:@"Arial" size:20];
    label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.text = self.customClassObj.username;
    NSString *sss=@"Store list-[";
    label.text=[sss stringByAppendingString:label.text];
    label.text=[label.text stringByAppendingString:@"]"];
    self.navigationItem.titleView = label;
    [label sizeToFit];
    [tab reloadData];
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
    cell.textLabel.text=[NSString stringWithFormat:@"%@",ccClass.name];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSUserDefaults standardUserDefaults]setInteger:indexPath.row forKey:@"sji"];
    
    NSString *str_key_value=[NSString stringWithFormat:@"%@",[[self.listDataArray valueForKey:@"name"] objectAtIndex:indexPath.row]];
    NSString *str_key_value1=[NSString stringWithFormat:@"%@",[[self.listDataArray valueForKey:@"storeid"] objectAtIndex:indexPath.row]];
    NSString *str_key_value2=[NSString stringWithFormat:@"%@",[[self.listDataArray valueForKey:@"userid"] objectAtIndex:indexPath.row]];
    [[NSUserDefaults standardUserDefaults]setObject:str_key_value forKey:@"storename"];
    [[NSUserDefaults standardUserDefaults]setObject:str_key_value1 forKey:@"storeid"];
    [[NSUserDefaults standardUserDefaults]setObject:str_key_value2 forKey:@"userid"];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    checklist *check = (checklist *)[storyboard instantiateViewControllerWithIdentifier:@"checklist"];
     check.str_key_value=str_key_value;
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

@end
