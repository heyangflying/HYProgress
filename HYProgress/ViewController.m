//
//  ViewController.m
//  HYProgress
//
//  Created by heyang on 15/8/3.
//  Copyright (c) 2015年 com.scxingdun. All rights reserved.
//
#import "HYProgressView.h"
#import "ViewController.h"

@interface ViewController ()
@property(strong,nonatomic) HYProgressView *progressCircle;

@property (nonatomic) float   value;

@property (nonatomic,strong) NSTimer *timer;
@property (weak, nonatomic) IBOutlet HYProgressView *progress;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _progress.backgroundColor = [UIColor clearColor];
    _progress.progressWidth = 10.0;
    _progress.progressColor = [UIColor greenColor];
    _progress.textFont = 15.0;
    _progress.textColor = [UIColor whiteColor];
    
    self.progressCircle = _progress;
    [self.view addSubview:_progress];
    
  self.timer =   [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(showProgress) userInfo:nil repeats:YES];
}

- (void)showProgress{
 
    _value  += 0.05;
    self.progressCircle.progress = _value;
    

    
    if(_value >= 1.0){
        
        [self.timer invalidate];
        self.timer = nil;
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
