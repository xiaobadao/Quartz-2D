//
//  MyQuartzView.m
//  CreateWindowContext
//
//  Created by apple on 2017/4/18.
//  Copyright © 2017年 Chuckie. All rights reserved.
//

#import "MyQuartzView.h"

@implementation MyQuartzView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef myContextRef = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(myContextRef, 1, 0, 0, 1);
    CGContextFillRect(myContextRef, CGRectMake(10, 20, 200, 100));
    
    CGContextSetRGBFillColor(myContextRef, 0, 10, 1, 0.5);
    CGContextFillRect(myContextRef, CGRectMake(10, 20, 100, 200));

    
}
@end
