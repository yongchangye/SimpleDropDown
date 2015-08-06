//
//  ViewController.m
//  SimpleDropDown
//
//  Created by 叶永长 on 8/6/15.
//  Copyright (c) 2015 YYC. All rights reserved.
//

#import "ViewController.h"
#import "ListView.h"
@interface ViewController ()<CarNumberDelegate>
{
    UIButton *button;
    
    UITableView *listTableView;
    
    NSMutableArray *dataArray;///存数据数组
    ListView *listView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dataArray = [[NSMutableArray alloc]init];
    
    NSArray *array = @[@"京A",@"京B",@"京C",@"京D",@"京E",@"京F"];
    
    for (NSString *str in array) {
        [dataArray addObject:str];
    }
    
    listView = [[ListView alloc]initWithFrame:CGRectMake(20, 100, 50, dataArray.count*20+20) withDataArray:dataArray];
    if (dataArray.count <=5) {
        
    }else{
        listView.frame = CGRectMake(20, 100, 50, 120);
    }
    listView.delegate = self;
    [self.view addSubview:listView];
    
    
}

-(void)changeCarNumber:(NSString *)sender{
    NSLog(@"%@",sender);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
