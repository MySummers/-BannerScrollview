//
//  ViewController.m
//  STBannerView
//
//  Created by AG_TigerNong on 17/1/7.
//  Copyright © 2017年 Saftop. All rights reserved.
//

#import "ViewController.h"
#import "STBannerView.h"

#define screenWidth ([UIScreen mainScreen].bounds.size.width)
#define screenHeight ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()<STBannerViewDelegate>

@property (nonatomic,strong) STBannerView *lcoalBannerView;

@property (nonatomic, strong) STBannerView *netBannerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //加载本地图片
    self.lcoalBannerView.hidden = NO;
    NSArray *arr = @[@"banner1",@"banner2",@"banner3",@"banner4"];
    self.lcoalBannerView.images = [arr mutableCopy];
    
    //网络图片
    NSArray *netArr = @[@"http://img15.3lian.com/2015/h1/280/d/5.jpg",@"http://img4.duitang.com/uploads/item/201510/27/20151027172830_Ch4Sc.jpeg",@"http://a.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=3e57409dab6eddc426b2bcff0ceb9acb/9c16fdfaaf51f3de842cd71c92eef01f3a29792f.jpg",@"http://d.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=5e1addbab4fb43161a4a727e15946a15/72f082025aafa40f288c73acad64034f78f0197c.jpg"];
    
    self.netBannerView.hidden = NO;
    
    self.netBannerView.images = [netArr mutableCopy];
}

- (STBannerView *)lcoalBannerView{
    if (!_lcoalBannerView) {
        _lcoalBannerView = [STBannerView bannerView];
        _lcoalBannerView.frame = CGRectMake(0, 20, screenWidth, 160);
        [self.view addSubview:_lcoalBannerView];
        _lcoalBannerView.delegate = self;
        _lcoalBannerView.interval = 5;
        [_lcoalBannerView creatTimer];
    }
    
    return _lcoalBannerView;
}

- (STBannerView *)netBannerView{
    if (!_netBannerView) {
        _netBannerView = [STBannerView bannerView];
        _netBannerView.frame = CGRectMake(0, 200, screenWidth, 160);
        [self.view addSubview:_netBannerView];
        _netBannerView.delegate = self;
        _netBannerView.interval = 5;
        
        [_netBannerView creatTimer];
    }
    
    return _netBannerView;
}

#pragma mark - delegate

- (void)bannerView:(STBannerView *)view didSelectImageView:(UIImageView *)imageView{
    
    NSLog(@"点击：%ld",imageView.tag);
    
}
@end
