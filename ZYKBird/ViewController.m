//
//  ViewController.m
//  ZYKBird
//
//  Created by qianfeng on 15/11/10.
//  Copyright (c) 2015年 yuankaizhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSTimer *_timer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"back2.jpg"]];
    //要求图片大小合适
    // Do any additional setup after loading the view, typically from a nib.
    [self createBird];
    [self createAnimation];
    [self createTimer];
















}
#pragma  - mark - UIImageView
//创建鸟
-(void)createBird
{
    //这种创建方式适合小图片尤其是素材图片。如果图片过大容易内存泄漏。因为这样创建的图片是不释放的，是单例。

    UIImage *image = [UIImage imageNamed:@"DOVE 1"];
    UIImageView *birdview = [[UIImageView alloc]initWithImage:image];
    birdview.center = CGPointMake(100, 150);

    birdview.bounds = CGRectMake(0, 0, 100  , 100);

    //图片的填充模式
    birdview.contentMode = UIViewContentModeScaleAspectFit;
    birdview.tag = 1;

    [self.view addSubview:birdview];
}


-(void)createAnimation
{
    //找到🐦
    UIImageView *birdView = (id)[self.view viewWithTag:1];
//设置动画
    //先将所有的动画图片放入到一个数组中
    NSMutableArray *animatImages = [[NSMutableArray alloc]init];
    for (int i = 1; i <=18 ; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"DOVE %d.png",i]];
        [animatImages addObject:image];
        }
    //2.设置图片视图的动画数组属性

    birdView.animationImages = animatImages;
    //3.设置动画时间,即切换所有图片一次所用时间
    birdView.animationDuration = 2;
    //4.设置动画的执行次数
    birdView.animationRepeatCount = 0;
    //0表示无限循环

    //5.启动动画
    [birdView startAnimating];

}

-(void)createTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(fly) userInfo:nil repeats:YES];

}
-(void)fly
{
    UIImageView *birdview = (id)[self.view viewWithTag:1];
    CGPoint point = birdview.center;
    point.x++;
    point.y+= 0.5;
    if (point.x > 400) {
        point.x = -100;
        point.y = -50;
    }
    birdview.center = point;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
