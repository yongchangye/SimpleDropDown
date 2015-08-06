//
//  ListView.m
//  SimpleDropDown
//
//  Created by 叶永长 on 8/6/15.
//  Copyright (c) 2015 YYC. All rights reserved.
//

#import "ListView.h"

@implementation ListView


-(instancetype)initWithFrame:(CGRect)frame withDataArray:(NSMutableArray *)array{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatListView:array];
    }
    return self;
}

-(void)creatListView:(NSMutableArray *)array{
    
    
    dataArray = [[NSMutableArray alloc]init];
    dataArray = array;
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 50, 20);
    button.layer.borderWidth = 0.5;
    button.selected = NO;
    [button setTitle:@"京B" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.layer.borderColor = [UIColor blackColor].CGColor;
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    
    
    listTableView = [[UITableView alloc]init];
    listTableView.backgroundColor = [UIColor redColor];
    listTableView.frame = CGRectMake(0, button.bounds.size.height+button.frame.origin.y, 50, 20);
    listTableView.hidden = YES;
    listTableView.dataSource = self;
    listTableView.delegate = self;
    listTableView.showsHorizontalScrollIndicator = NO;
    listTableView.showsVerticalScrollIndicator = NO;
    listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    listTableView.tableFooterView = [[UIView alloc]init];
    listTableView.layer.borderWidth = 0.5;
    listTableView.layer.borderColor = [UIColor blackColor].CGColor;
    [self addSubview:listTableView];
}

-(void)btnClick:(UIButton *)sender{
    
    if (sender.selected) {
        [UIView animateWithDuration:0.2 animations:^{
            listTableView.frame = CGRectMake(0, button.bounds.size.height+button.frame.origin.y, 50, 25);
        } completion:^(BOOL finished) {
            listTableView.hidden = YES;
        }];
        sender.selected = NO;
    }else{
        listTableView.hidden = NO;
        [UIView animateWithDuration:0.25 animations:^{
            if (dataArray.count<=5) {
                listTableView.frame = CGRectMake(0, button.bounds.size.height+button.frame.origin.y, 50, dataArray.count*20);
            }else{
                listTableView.frame = CGRectMake(0, button.bounds.size.height+button.frame.origin.y, 50, 100);
            }
            
        } completion:^(BOOL finished) {
            
        }];
        
        sender.selected = YES;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 20;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellDefine = @"define";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDefine];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDefine];
    }
    
    for (UIView *view in cell.subviews) {
        if ([view isKindOfClass:[UILabel class]] || [view isKindOfClass:[UIView class]]) {
            [view removeFromSuperview];
        }
    }
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 0, 50, 20);
    label.text = dataArray [indexPath.row];
    label.font = [UIFont systemFontOfSize:13];
    [cell addSubview:label];
    
    
    
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 19.5, 50, 0.5)];
    line.backgroundColor = [UIColor grayColor];
    [cell addSubview:line];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [button setTitle:dataArray[indexPath.row] forState:UIControlStateNormal];
    
    [UIView animateWithDuration:0.2 animations:^{
        listTableView.frame = CGRectMake(0, button.bounds.size.height+button.frame.origin.y, 50, 25);
    } completion:^(BOOL finished) {
        listTableView.hidden = YES;
    }];
    button.selected = NO;
    
    if ([self.delegate respondsToSelector:@selector(changeCarNumber:)]) {
        [self.delegate changeCarNumber:button.titleLabel.text];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
