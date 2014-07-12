//
//  ViewController.h
//  Executive
//
//  Created by sji on 6/23/14.
//  Copyright (c) 2014 sji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *userid;
@property (strong, nonatomic) IBOutlet UITextField *passwd1;
- (IBAction)submit:(id)sender;

@end
