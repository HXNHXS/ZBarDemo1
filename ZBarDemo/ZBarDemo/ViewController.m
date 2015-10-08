//
//  ViewController.m
//  ZBarDemo
//
//  Created by lzxuan on 15/9/29.
//  Copyright (c) 2015年 lzxuan. All rights reserved.
//

#import "ViewController.h"
#import "ZCZBarViewController.h"
//获取屏幕大小
#define kScreenSize [UIScreen mainScreen].bounds.size

@interface ViewController ()
@property (nonatomic,strong)UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //点击扫描二维码
    [self createButton];
    
    //生成二维码
    UIImageView*imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    //Scale数值越高越清晰
    //[ZCZBarViewController createImageWithImageView:imageView String:@"http://www.baidu.com"Scale:4];
    [ZCZBarViewController createImageWithImageView:imageView String:@"I Love you" Scale:5];
    imageView.center=self.view.center;
    [self.view addSubview:imageView];
}

-(void)createButton{
    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"二维码扫描" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.frame=CGRectMake(100, kScreenSize.height-100, 100, 60);
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, kScreenSize.width, 100)];
    self.label.backgroundColor = [UIColor redColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
}
-(void)buttonClick:(UIButton*)button{
    
    
    ZCZBarViewController*vc=[[ZCZBarViewController alloc]initWithIsQRCode:NO Block:^(NSString *result, BOOL isFinish) {
        if (isFinish) {
            NSLog(@"最后的结果%@",result);
            self.label.text = result;
        }
        
    }];
    
    [self presentViewController:vc animated:YES completion:nil];
    
}


@end
