//
//  ViewController.m
//  CreateWindowContext
//
//  Created by apple on 2017/4/18.
//  Copyright © 2017年 Chuckie. All rights reserved.
//

#import "ViewController.h"
#import "MyQuartzView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    MyQuartzView *myView = [[MyQuartzView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:myView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
