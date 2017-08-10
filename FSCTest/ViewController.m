//
//  ViewController.m
//  FSCTest
//
//  Created by jing on 2017/8/10.
//  Copyright © 2017年 jing. All rights reserved.
//

#import "ViewController.h"
#import "FSCalendar.h"

@interface ViewController ()<FSCalendarDelegate, FSCalendarDataSource>

@property (nonatomic, strong) FSCalendar *cal;

@end

@implementation ViewController

-(void)loadView{
    UIView *view  = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.view = view;
    
    self.cal = [[FSCalendar alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 350)];
    self.cal.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.cal];
    self.cal.dataSource = self;
    
    
    
}

//日期的title,一般不需要改动
-(NSString *)calendar:(FSCalendar *)calendar titleForDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd"];//默认格式是“d”
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}
-(NSString *)calendar:(FSCalendar *)calendar subtitleForDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd"];//默认格式是“d”
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}
//-(UIImage *)calendar:(FSCalendar *)calendar imageForDate:(NSDate *)date{
//    NSLog(@"%@",date);
//    return [UIImage imageNamed:@"calendar"];
//}
-(NSDate *)minimumDateForCalendar:(FSCalendar *)calendar{
    return [[NSDate date] dateByAddingTimeInterval:- 60 * 60 * 24 * 15];
}
-(NSDate *)maximumDateForCalendar:(FSCalendar *)calendar{
    return [[NSDate date] dateByAddingTimeInterval: 60 * 60 * 24 * 15];
}
-(NSInteger)calendar:(FSCalendar *)calendar numberOfEventsForDate:(NSDate *)date{
    return 2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
