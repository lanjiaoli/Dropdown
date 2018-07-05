//
//  DropdownView.h
//  LDropdownMenu
//
//  Created by L on 2018/7/5.
//  Copyright © 2018年 L. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropdownView : UIView
@property (nonatomic, copy) void (^dropdownMenuSelectBlock)(NSString *str);
@property (nonatomic, copy) NSArray *dataArray;
@end
