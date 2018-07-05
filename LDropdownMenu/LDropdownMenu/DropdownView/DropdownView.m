//
//  DropdownView.m
//  LDropdownMenu
//
//  Created by L on 2018/7/5.
//  Copyright © 2018年 L. All rights reserved.
//

#define kCellHeight 40.0
#import "DropdownView.h"
@interface DropdownView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end
@implementation DropdownView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
      
        self.tableView.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
        self.tableView.layer.borderWidth = 0.5;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
#pragma mark - Set UI
- (void)setupUI{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = kCellHeight;
    [self addSubview:self.tableView];
}
- (void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    self.tableView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self.tableView reloadData];
}
#pragma mark - tableView Delegate With DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dropdownMenuSelectBlock) {
        self.dropdownMenuSelectBlock(self.dataArray[indexPath.row]);
    }
    
}
@end
