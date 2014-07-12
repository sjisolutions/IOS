//
//  serachcontactview.h
//  Amwayproject
//
//  Created by sji on 3/14/14.
//  Copyright (c) 2014 Sjisolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h";
#import "Customerdetails.h"

@interface serachcontactview : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchDisplayDelegate>{
    UISearchBar *locasearc;
    NSMutableArray *corearray,*copyofloc,*mainDataArray,*corearray1,*mainDataArray1;
    UITableView *tableview;
    AppDelegate *app;
    Customerdetails *cust,*cust1,*cust2;
    UITableView *tab,*tab1,*tab2;
    UISegmentedControl *seg;
    BOOL change,Change1;
    UIButton  *btn_search;
    NSArray *arr;
    NSString *uoi;
    NSMutableArray *aty1,*aty2,*aty3;
    NSManagedObjectContext *context;
    NSArray *aty;
}
@property (nonatomic ,retain) NSMutableArray *corearray,*corearray1,*corearray2,*corearray3;
@property (nonatomic ,retain) NSMutableArray *mainDataArray;
@end
