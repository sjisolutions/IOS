//
//  store.h
//  Executive
//
//  Created by sji on 6/23/14.
//  Copyright (c) 2014 sji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomClass.h"
@interface store : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *arr;
    NSString *username;
    UILabel *label;
    NSDictionary *dict1;
}
@property(nonatomic,strong)NSMutableData *listData;
@property(nonatomic,strong)NSMutableArray *listDataArray,*listDataArray1,*listDataArray2;
@property(nonatomic,strong)CustomClass *customClassObj;
@property (strong, nonatomic) IBOutlet UITableView *tab;

@end
