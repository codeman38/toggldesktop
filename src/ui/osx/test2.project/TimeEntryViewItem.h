//
//  TimeEntryViewItem.h
//  kopsik_ui_osx
//
//  Created by Tanel Lebedev on 25/09/2013.
//  Copyright (c) 2013 kopsik developers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "kopsik_api.h"

@interface TimeEntryViewItem : NSObject
- (void)load:(KopsikTimeEntryViewItem *)data;
+ (TimeEntryViewItem *)findByGUID:(NSString *)guid;
@property int duration_in_seconds;
@property (strong) NSString *Description; // uppercase to avoid clash with [NSObject description]
@property (strong) NSString *ProjectAndTaskLabel;
@property (strong) NSString *duration;
@property (strong) NSString *color;
@property (strong) NSString *GUID;
@property BOOL billable;
@property (strong) NSDate *started;
@property (strong) NSDate *ended;
@property (strong) NSArray *tags;
@property (strong) NSString *updatedAt;
@property (strong) NSString *formattedDate;
@property BOOL durOnly;
// If this is set to YES, a date header is displayed on top of
// the time entry cell in the time entry list view:
@property BOOL isHeader;
// If it's a header, this is useful:
@property (strong) NSString *dateDuration;
@end
