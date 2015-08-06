//
//  ListView.h
//  SimpleDropDown
//
//  Created by 叶永长 on 8/6/15.
//  Copyright (c) 2015 YYC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CarNumberDelegate <NSObject>

-(void)changeCarNumber:(NSString *)sender;

@end

@interface ListView : UIView<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *listTableView;
    
    UIButton *button;
    
    NSMutableArray *dataArray;
}
@property (nonatomic,assign) id<CarNumberDelegate> delegate;

-(instancetype)initWithFrame:(CGRect)frame withDataArray:(NSMutableArray *)array;
@end
