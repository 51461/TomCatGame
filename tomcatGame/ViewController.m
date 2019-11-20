//
//  ViewController.m
//  tomcatGame
//
//  Created by 陈统帅 on 2019/8/13.
//  Copyright © 2019 陈统帅. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tomImageView;
- (IBAction)touchHeadOnClick:(UIButton *)sender;
- (IBAction)StomachOnClick:(UIButton *)sender;
- (IBAction)footLeftOnClick:(UIButton *)sender;
- (IBAction)footRightOnClick:(UIButton *)sender;
- (IBAction)eatOnclick:(id)sender;
- (IBAction)cymbalOnClick:(id)sender;
- (IBAction)drinkOnClick:(id)sender;
- (IBAction)fartOnClick:(id)sender;
- (IBAction)pieOnClick:(id)sender;
- (IBAction)scratchOnclick:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark - 动画执行方法
- (void)tomAnimateWith:(NSString *)fileName imageCount:(NSInteger)imageCount{
    // 0.如果动画正在执行,我们就直接不执行以下代码
    if (self.tomImageView.isAnimating) {
        return;
    }
    // 1.首先创建图片数组
    NSMutableArray *tomImages = [NSMutableArray array];
    for (int i = 0; i < imageCount; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%@_%02d.jpg", fileName, i];
        //        // 1.创建图片的第一种方法(不用)可能会内存溢出
        //        UIImage *image = [UIImage imageNamed:imageName];
        NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [tomImages addObject:image];
    }
    // 2.设置动画过程
    // 2.1添加动画执行的图片数组
    [self.tomImageView setAnimationImages:tomImages];
    // 2.2设置动画执行的时间
    [self.tomImageView setAnimationDuration:self.tomImageView.animationImages.count * 0.1];
    // 2.2设置动画执行的次数
    [self.tomImageView setAnimationRepeatCount:1];
    // 2.3设置动画开始执行
    [self.tomImageView startAnimating];
    // 3.在动画结束之后清空数组
    [self.tomImageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.tomImageView.animationDuration];
}
//摸头
- (IBAction)touchHeadOnClick:(UIButton *)sender {
/**    NSMutableArray *tomImages = [NSMutableArray array];
    for (int i=0;i<81;i++) {
        //%02d,长度为2，左边补0
        NSString *imageName= [NSString stringWithFormat:@"%@_%02d.jpg",@"knockout",i];
        NSLog(@"%@",imageName);
        NSString *path=[[NSBundle mainBundle] pathForResource:imageName ofType:nil];
        NSLog(@"%@",path);
        UIImage *image=[UIImage imageWithContentsOfFile:path];
        [tomImages addObject:image];
    }
    [self.tomImageView setAnimationImages:tomImages];
   //动画执行时间
    [self.tomImageView setAnimationDuration:self.tomImageView.animationImages.count * 0.1];
    //执行次数
    [self.tomImageView setAnimationRepeatCount:1];
    //开始执行
    [self.tomImageView startAnimating];
    //清空数组
    [self.tomImageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.tomImageView.animationDuration];*/
    [self tomAnimateWith:@"knockout" imageCount:81];
    NSLog(@"摸头");
}
//肚子
- (IBAction)StomachOnClick:(UIButton *)sender{
    [self tomAnimateWith:@"stomach" imageCount:33];
    NSLog(@"摸肚子");
}
//左脚
- (IBAction)footLeftOnClick:(UIButton *)sender {
    [self tomAnimateWith:@"footLeft" imageCount:29];
    NSLog(@"左脚");
}
//右脚
- (IBAction)footRightOnClick:(UIButton *)sender {
    [self tomAnimateWith:@"footRight" imageCount:29];
    NSLog(@"右脚");
}
//吃小鸟
- (IBAction)eatOnclick:(id)sender {
    [self tomAnimateWith:@"eat" imageCount:39];
    NSLog(@"吃小鸟");
}
//敲锣
- (IBAction)cymbalOnClick:(id)sender {
    [self tomAnimateWith:@"cymbal" imageCount:12];
    NSLog(@"敲锣");
}
//喝牛奶
- (IBAction)drinkOnClick:(id)sender {
    [self tomAnimateWith:@"drink" imageCount:80];
    NSLog(@"喝牛奶");
}
//放屁
- (IBAction)fartOnClick:(id)sender {
    [self tomAnimateWith:@"fart" imageCount:27];
    NSLog(@"放屁");
}
//丢东西
- (IBAction)pieOnClick:(id)sender {
    [self tomAnimateWith:@"pie" imageCount:23];
    NSLog(@"丢东西");
}
//抓屏幕
- (IBAction)scratchOnclick:(id)sender {
    [self tomAnimateWith:@"scratch" imageCount:55];
    NSLog(@"抓屏幕");
}
@end

