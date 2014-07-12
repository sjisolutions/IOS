//
//  Customerdetails.h
//  Amwayproject
//
//  Created by sji on 3/14/14.
//  Copyright (c) 2014 Sjisolutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Customerdetails : NSManagedObject

@property (nonatomic, retain) NSString * fname;
@property (nonatomic, retain) NSString * lname;
@property (nonatomic, retain) NSString * phonenumber;
@property (nonatomic, retain) NSString * emilid;
@property (nonatomic, retain) NSString * member;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * education;
@property (nonatomic, retain) NSString * collegelocation;
@property (nonatomic, retain) NSString * collegestate;
@property (nonatomic, retain) NSString * currentlocation;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * sharedidea;
@property (nonatomic, retain) NSString * decision;
@property (nonatomic, retain) NSString * nextmeet;
@property (nonatomic, retain) NSString * photo;
@property (nonatomic, retain) NSString * nearestconferencelocation;
@property (nonatomic, retain) NSString * breafnote;

@end
