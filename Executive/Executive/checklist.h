//
//  checklist.h
//  Executive
//
//  Created by sji on 6/23/14.
//  Copyright (c) 2014 sji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomClass.h"
@interface checklist : UIViewController<UITabBarControllerDelegate,UITabBarDelegate,UITableViewDataSource,UITableViewDelegate>{
    UIViewController *tab1vc;  // view controller of first tab
    UIViewController *tab2vc;
    NSString *user;
    NSString *store2;
}
@property (strong, nonatomic) IBOutlet UIImageView *imag;
- (IBAction)checklist:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tab1;
- (IBAction)comment:(id)sender;
@property(nonatomic,strong)NSMutableData *listData;
@property(nonatomic,strong)NSMutableArray *listDataArray,*listDataArray1;
@property(nonatomic,strong)CustomClass *customClassObj;
@property (nonatomic, retain) UIViewController *tab1vc;
@property (nonatomic, retain) UIViewController *tab2vc;
@property(nonatomic,retain) NSString *str_key_value;
@end
