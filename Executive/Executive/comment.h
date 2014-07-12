//
//  comment.h
//  Executive
//
//  Created by sji on 6/23/14.
//  Copyright (c) 2014 sji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomClass.h"
@interface comment : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIAlertViewDelegate>{
    NSString *user;
    NSString *store1;
    UILabel *label;
}
@property (strong, nonatomic) IBOutlet UITextField *addcomment;
@property (strong, nonatomic) IBOutlet UITableView *tab2;
- (IBAction)checklist:(id)sender;
- (IBAction)comment:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *immm;
@property(nonatomic,strong)NSMutableData *listData;
@property(nonatomic,strong)NSMutableArray *listDataArray;
@property(nonatomic,strong)CustomClass *customClassObj;
@end
