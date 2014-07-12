//
//  Chicklistdetailview.h
//  Executive
//
//  Created by sji on 7/1/14.
//  Copyright (c) 2014 sji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomClass.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import <MediaPlayer/MediaPlayer.h>
@interface Chicklistdetailview : UIViewController<UIImagePickerControllerDelegate>{
    NSString *user;
    NSString *store2;
    NSString *checkdisc;
    NSString *checkid;
    UIActivityIndicatorView *ai;
    UIImage *yourImage;
    BOOL y;
}
@property (strong, nonatomic) IBOutlet UILabel *headline;
@property (strong, nonatomic) IBOutlet UIImageView *immm;
- (IBAction)checklist:(id)sender;
- (IBAction)comment:(id)sender;
- (IBAction)camera:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *discription;
@property (strong, nonatomic) IBOutlet UIImageView *display;
@property (strong, nonatomic) IBOutlet UILabel *check;
@property (strong, nonatomic) IBOutlet UILabel *comm;
@property(nonatomic,retain) NSString *str_key_value;
@property(nonatomic,strong)NSMutableData *listData;
@property(nonatomic,strong)NSMutableArray *listDataArray,*listDataArray1;
@property(nonatomic,strong)CustomClass *customClassObj;

@end
