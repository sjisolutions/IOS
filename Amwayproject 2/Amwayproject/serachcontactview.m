//
//  serachcontactview.m
//  Amwayproject
//
//  Created by sji on 3/14/14.
//  Copyright (c) 2014 Sjisolutions. All rights reserved.
//

#import "serachcontactview.h"
#import "searchdetailview.h"
@interface serachcontactview ()

@end

@implementation serachcontactview
@synthesize corearray,mainDataArray;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{

    [locasearc resignFirstResponder];

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
    
    label.text = @"Customer list";
    self.navigationItem.titleView = label;
    [label sizeToFit];

    app=[[UIApplication sharedApplication]delegate];
context=[app managedObjectContext];
    
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Customerdetails" inManagedObjectContext:context];
    
    NSFetchRequest  *request=[[NSFetchRequest alloc]init];
    [request setEntity:entity];
    NSSortDescriptor *sort=[[NSSortDescriptor alloc]initWithKey:@"fname" ascending:YES];
    arr=[NSArray arrayWithObject:sort];
    
    [request setSortDescriptors:arr];
    NSError *error;
       self.corearray=[[context executeFetchRequest:request error:&error]mutableCopy];
    self.mainDataArray=[[context executeFetchRequest:request error:&error]mutableCopy];
    
    [tableview reloadData];
        locasearc=[[UISearchBar alloc]initWithFrame:CGRectMake(0,0,320,50)];
    locasearc.placeholder=@"Search Location ";
    [locasearc setBackgroundColor:[UIColor greenColor]];
    locasearc.delegate=self;
    [self.view addSubview:locasearc];
    tableview=[[UITableView alloc]initWithFrame:CGRectMake(0,50,320,400) style:UITableViewStylePlain];
    tableview.delegate=self;
    tableview.tag=143;
    tableview.separatorColor=[UIColor blackColor];
    tableview.dataSource=self;
    [self.view addSubview:tableview];
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        [nav setFrame:CGRectMake(0, 0, 768, 84)];
        [label setFrame:CGRectMake(200, 10, 300, 80)];
        label.font =[UIFont fontWithName:@"Arial" size:45];
    if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
        [locasearc setFrame:CGRectMake(0,0,768,80)];
        [tableview setFrame:CGRectMake(0,80,768,875)];
    }else{
        [locasearc setFrame:CGRectMake(0,0,768,80)];
        [tableview setFrame:CGRectMake(0,80,768,875)];
    }
        
    }else{
        CGRect screen=[[UIScreen mainScreen]bounds];
        if (screen.size.height==568) {
            if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
                [locasearc setFrame:CGRectMake(0,0,320,50)];
                [tableview setFrame:CGRectMake(0,50,320,450)];
            }else{
                [locasearc setFrame:CGRectMake(0,0,320,50)];
                [tableview setFrame:CGRectMake(0,50,320,450)];
            }
        }else{
            [locasearc setFrame:CGRectMake(0,0,320,50)];
            [tableview setFrame:CGRectMake(0,50,320,360)];
        }
    }
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    btn_search = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_search setTitle:@"Decission" forState:UIControlStateNormal];
    btn_search.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Decision.png"]];
    [btn_search addTarget:self action:@selector(Button_Search:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* deleteItem = [[UIBarButtonItem alloc] initWithCustomView:btn_search];
    self.navigationItem.rightBarButtonItem = deleteItem;
   
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
            
            [btn_search setFrame:CGRectMake(650,-30, 140, 40)];
            btn_search.titleLabel.font = [UIFont fontWithName:@"Arial" size:22.0];
           


        }else{
            UIBarButtonItem *barbutton2=[[UIBarButtonItem alloc]initWithTitle:@"Decission" style: UIBarButtonSystemItemDone target:self action:@selector(Button_Search:)];
            
            self.navigationItem.rightBarButtonItem=barbutton2;
        }
            }else{
                CGRect screen=[[UIScreen mainScreen]bounds];
                if (screen.size.height==568) {
                    if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
                        [btn_search setFrame:CGRectMake(255,0, 80, 30)];
                               btn_search.titleLabel.font = [UIFont fontWithName:@"Arial" size:14.0];
                    }else{
                        UIBarButtonItem *barbutton2=[[UIBarButtonItem alloc]initWithTitle:@"Decission" style: UIBarButtonSystemItemDone target:self action:@selector(Button_Search:)];
                        self.navigationItem.rightBarButtonItem=barbutton2;
                    }
                }else{
                    UIBarButtonItem *barbutton2=[[UIBarButtonItem alloc]initWithTitle:@"Decission" style:UIBarButtonSystemItemDone target:self action:@selector(Button_Search:)];
                    self.navigationItem.rightBarButtonItem=barbutton2;
                }

                
                
    }
    
    
    
        NSString *str_search_text1=[NSString stringWithFormat:@"%@",locasearc.text];
    NSString *str1=@"   ";
     NSString *str_search_text=[str1 stringByAppendingString:str_search_text1];
    
    [self.corearray removeAllObjects];
    [self.corearray addObjectsFromArray:self.mainDataArray];
    if (str_search_text.length) {
        NSString *query = [NSString stringWithFormat:@"currentlocation CONTAINS[cd] '%@'",str_search_text];
        NSArray* _filter_array = [self.corearray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:query]];
        if ([_filter_array count]) {
            [self.corearray removeAllObjects];
            [self.corearray addObjectsFromArray:_filter_array];
            [tableview reloadData];
            [tab reloadData];
            [tab1 reloadData];
            [tab2 reloadData];
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                            message:@"No data found" delegate:nil cancelButtonTitle: @"OK"
                                  
                                                  otherButtonTitles:nil, nil];
            
            [alert show];
            
        }
        
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                        message:@"Please Enter any location" delegate:nil cancelButtonTitle: @"OK"
                              
                                              otherButtonTitles:nil, nil];
        
        [alert show];
    }
    
    [locasearc reloadInputViews];
//    change=YES;
    [tab reloadData];
    [tab1 reloadData];
    [tab2 reloadData];
    [tableview reloadData];
}
-(IBAction)Button_Search:(id)sender{
[tableview setHidden:YES];
    NSMutableArray *arraysegment = [NSMutableArray arrayWithObjects: @"Yes", @"No", @"Later", nil];
    seg = [[UISegmentedControl alloc] initWithItems:arraysegment];
    
    seg.segmentedControlStyle = UISegmentedControlStyleBar;
    seg.selectedSegmentIndex = 3;
    
    [seg addTarget:self action:@selector(Segmentaction:)
  forControlEvents:UIControlEventValueChanged];
    
    
   [seg setBackgroundImage:[UIImage imageNamed:@"tab bar1"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault ];
    seg.tintColor=[UIColor cyanColor];
    [self.view addSubview:seg];
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        UIFont *font = [UIFont boldSystemFontOfSize:30.0f];
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
                                                               forKey:UITextAttributeFont];
        [seg setTitleTextAttributes:attributes
                           forState:UIControlStateNormal];
        if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
            seg.frame = CGRectMake(0, 80, 768, 100);
        }else{
            seg.frame = CGRectMake(0, 80, 768, 100);
        }
    }else{
        CGRect screen=[[UIScreen mainScreen]bounds];
        if (screen.size.height==568) {
            UIFont *font = [UIFont boldSystemFontOfSize:18.0f];
            NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
                                                                   forKey:UITextAttributeFont];
            [seg setTitleTextAttributes:attributes
                               forState:UIControlStateNormal];
            if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
                seg.frame = CGRectMake(0, 50, 320, 50);
            }else{
                seg.frame = CGRectMake(0, 50, 320, 50);
            }
        }else{
            UIFont *font = [UIFont boldSystemFontOfSize:16.0f];
            NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
                                                                   forKey:UITextAttributeFont];
            [seg setTitleTextAttributes:attributes
                               forState:UIControlStateNormal];
            seg.frame = CGRectMake(0, 50, 320, 50);
        }
  
    }
    change=YES;
}

-(IBAction)Segmentaction:(id)sender{
    [tableview setHidden:YES];
    if (seg.selectedSegmentIndex == 0)
    {
        [seg setBackgroundColor:[UIColor cyanColor]];
        NSString *str1=@"   ";
        NSString *str_search_text1=@"Yes";
        NSString *str_search_text=[str1 stringByAppendingString:str_search_text1];;
        NSPredicate *sPredicate = [NSPredicate predicateWithFormat:@"decision CONTAINS[cd] %@", str_search_text];
        
        aty = [self.corearray filteredArrayUsingPredicate:sPredicate];
       aty1=[[NSMutableArray alloc]initWithArray:aty];
        
        [tab reloadData];
       [tableview setHidden:YES];
        tab=[[UITableView alloc]init];
        tab.delegate=self;
        tab.dataSource=self;
        tab.separatorColor=[UIColor blackColor];
        [self.view addSubview:tab];
        tab.tag=000;
        [tab1 setHidden:YES];
        [tab2 setHidden:YES];
        if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
            if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
               [tab setFrame:CGRectMake(0,180,768,900)];
            }else{
               [tab setFrame:CGRectMake(0,180,768,907)];
            }
        }else{
            CGRect screen=[[UIScreen mainScreen]bounds];
            if (screen.size.height==568) {
                if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
                    [tab setFrame:CGRectMake(0,100,320,500)];
                }else{
                    [tab setFrame:CGRectMake(0,100,320,400)];
                }
            }else{
                [tab setFrame:CGRectMake(0,100,320,300)];
            }
        }

        
    }
    else if(seg.selectedSegmentIndex == 1)
    {
        [tableview setHidden:YES];
        NSString *str1=@"   ";
        NSString *str_search_text1=@"No";
        NSString *str_search_text=[str1 stringByAppendingString:str_search_text1];;
        NSPredicate *sPredicate = [NSPredicate predicateWithFormat:@"decision CONTAINS[cd] %@", str_search_text];
        
        aty = [self.corearray filteredArrayUsingPredicate:sPredicate];
        
           aty1=[[NSMutableArray alloc]initWithArray:aty];
            tab1=[[UITableView alloc]initWithFrame:CGRectMake(0,90,320,287) style:UITableViewStylePlain];
        tab1.delegate=self;
        tab1.dataSource=self;
        tab1.separatorColor=[UIColor blackColor];
        [self.view addSubview:tab1];
      
        tab1.tag=111;
        [tab setHidden:YES];
        [tab2 setHidden:YES];
        if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
            if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
                [tab1 setFrame:CGRectMake(0,180,768,900)];
            }else{
                [tab1 setFrame:CGRectMake(0,180,768,907)];
            }
        }else{
            CGRect screen=[[UIScreen mainScreen]bounds];
            if (screen.size.height==568) {
                if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
                    [tab1 setFrame:CGRectMake(0,100,320,500)];
                }else{
                    [tab1 setFrame:CGRectMake(0,100,320,400)];
                }
            }else{
                [tab1 setFrame:CGRectMake(0,100,320,300)];
            }
        }

    }
    
    else if(seg.selectedSegmentIndex == 2)
    {
        [tableview setHidden:YES];
        NSString *str1=@"   ";
        NSString *str_search_text1=@"Later";
        NSString *str_search_text=[str1 stringByAppendingString:str_search_text1];;        NSPredicate *sPredicate = [NSPredicate predicateWithFormat:@"decision CONTAINS[cd] %@", str_search_text];
        
        aty = [self.corearray filteredArrayUsingPredicate:sPredicate];
        aty1=[[NSMutableArray alloc]initWithArray:aty];
        tab2=[[UITableView alloc]initWithFrame:CGRectMake(0,90,320,287) style:UITableViewStylePlain];
        tab2.delegate=self;
        tab2.dataSource=self;
        tab2.separatorColor=[UIColor blackColor];
        [self.view addSubview:tab2];
        tab2.tag=222;
        [tab1 setHidden:YES];
        [tab setHidden:YES];
        if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
            if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
                [tab2 setFrame:CGRectMake(0,180,768,900)];
            }else{
                [tab2 setFrame:CGRectMake(0,180,768,907)];
            }
        }else{
            CGRect screen=[[UIScreen mainScreen]bounds];
            if (screen.size.height==568) {
                if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7) {
                    [tab2 setFrame:CGRectMake(0,100,320,500)];
                }else{
                    [tab2 setFrame:CGRectMake(0,100,320,400)];
                }
            }else{
                [tab2 setFrame:CGRectMake(0,100,320,300)];
            }
        }

    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        if (change==YES) {
    
    
       if (tableView==tab2)
        {
            return [aty1 count];
        }
        else if (tableView==tab1)
        {
            return [aty1 count];
            
        }
        else if(tableView==tab)
       {
            return [aty1 count];
        }
        }else{
    return [corearray count];
        }
    return [corearray count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
    return 100;

}else{
    CGRect screen=[[UIScreen mainScreen]bounds];
    if (screen.size.height==568) {
        return 50;
    }else{
        return 50;
    }
}

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]init];
    cust=[self.corearray objectAtIndex:indexPath.row];

    if (tableView.tag==143) {
      

        cust.fname = [cust.fname stringByReplacingOccurrencesOfString:@"   "
                                                                              withString:@""];
        
        cell.textLabel.text=cust.fname;
      
}
        if (change==YES) {
           
        if (tableView.tag==000)
            
        {
            
            cust=[aty1 objectAtIndex:indexPath.row];

            cell.textLabel.text=cust.fname;

        }
        if (tableView.tag==111)
        {


             cust=[aty1 objectAtIndex:indexPath.row];
            cell.textLabel.text=cust.fname;


        }
        if (tableView.tag==222)
        {
             cust=[aty1 objectAtIndex:indexPath.row];
            cell.textLabel.text=cust.fname;

       }
  }

    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
         cell.textLabel.font=[UIFont fontWithName:@"Arial" size:30];
    }else{
        CGRect screen=[[UIScreen mainScreen]bounds];
        if (screen.size.height==568) {
             cell.textLabel.font=[UIFont fontWithName:@"Arial" size:20];
        }else{
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:18];
            
        }
    }
    cell.textLabel.textColor=[UIColor blackColor];
   
    cell.textLabel.backgroundColor=[UIColor clearColor];

    return cell;
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [btn_search setHidden:YES];
    [[NSUserDefaults standardUserDefaults]setInteger:indexPath.row forKey:@"sji"];
    if (change==YES) {
        NSString *str_key_value=[NSString stringWithFormat:@"%@",[[aty1 valueForKey:@"fname"] objectAtIndex:indexPath.row]];
        
        searchdetailview *goal=[[searchdetailview alloc]init];
        goal.str_key_value=str_key_value;
        [self.navigationController pushViewController:goal animated:YES];
    }else{
    NSString *str_key_value=[NSString stringWithFormat:@"%@",[[corearray valueForKey:@"fname"]objectAtIndex:indexPath.row]];
        
    searchdetailview *goal=[[searchdetailview alloc]init];
    goal.str_key_value=str_key_value;
    [self.navigationController pushViewController:goal animated:YES];
    }
    
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
       context=[app managedObjectContext];
        [context deleteObject:[corearray objectAtIndex:indexPath.row]];
        [context save:nil];
        
        
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Customerdetails" inManagedObjectContext:context];
        NSFetchRequest  *request=[[NSFetchRequest alloc]init];
        [request setEntity:entity];
        NSSortDescriptor *sort=[[NSSortDescriptor alloc]initWithKey:@"fname" ascending:YES];
       arr=[NSArray arrayWithObject:sort];
        [request setSortDescriptors:arr];
        NSError *error;
        corearray=[[context executeFetchRequest:request error:&error]mutableCopy];
        [tableView reloadData];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
 
   
    }
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [locasearc resignFirstResponder];
    // Do the search...
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
