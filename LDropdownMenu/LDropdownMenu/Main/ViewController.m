//
//  ViewController.m
//  LDropdownMenu
//
//  Created by L on 2018/7/5.
//  Copyright © 2018年 L. All rights reserved.
//

#import "ViewController.h"
#import "DropdownView.h"

@interface ViewController ()
@property (nonatomic, strong) DropdownView *menuView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)btnAction:(id)sender {
    UIButton *btn = sender;
    NSArray *titles =@[@"选择一",@"选择2",@"选择3",@"选4"];
    btn.selected = !btn.selected;
    self.menuView.frame = CGRectMake(btn.frame.origin.x, btn.frame.origin.y + btn.frame.size.height, btn.frame.size.width, 40*titles.count);
    self.menuView.dataArray = titles;
    __weak typeof (self)weekSelf = self;
    self.menuView.dropdownMenuSelectBlock = ^(NSString *str) {
        NSLog(@"%@",str);
        [btn setTitle:str forState:(UIControlStateNormal)];
        [weekSelf.menuView removeFromSuperview];
        btn.selected = !btn.selected;
    };
    if (btn.selected) {
        [self.view addSubview:self.menuView];
    }else{
        [self.menuView removeFromSuperview];
    }
    
}

- (DropdownView *)menuView{
    if (!_menuView) {
        _menuView = [[DropdownView alloc]initWithFrame:CGRectZero];
    }
    return _menuView;
}
@end
