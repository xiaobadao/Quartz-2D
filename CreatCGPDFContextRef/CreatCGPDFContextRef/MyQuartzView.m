//
//  MyQuartzView.m
//  CreatCGPDFContextRef
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
CFStringRef pdfPath(){

    CFStringRef path = NULL;
    NSString *homePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    homePath = [homePath stringByAppendingPathComponent:@"test.pdf"];
    path = (__bridge CFStringRef)homePath;
    return path;
}
- (void)drawRect:(CGRect)rect {
    
    CGContextRef myPDfContext ;
    CGRect mediaBox;
    mediaBox = CGRectMake(0, 0, 500, 500);
    myPDfContext = MyPDFContextCreat(&mediaBox, pdfPath());
    CFStringRef myKeys[1];
    CFTypeRef myValues[1];
    myKeys[0] = kCGPDFContextMediaBox;
    myValues[0] = CFDataCreate(NULL, (const UInt8 *)&mediaBox, sizeof(CGRect));
    CFDictionaryRef pageDictionary = CFDictionaryCreate(NULL, (const void **) myKeys, (const void **)myValues, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CGPDFContextBeginPage(myPDfContext, pageDictionary);
    
    CGContextSetRGBFillColor(myPDfContext, 1, 0, 0, 1);
    CGContextFillRect(myPDfContext, CGRectMake(10, 20, 200, 100));
    
    CGContextSetRGBFillColor(myPDfContext, 0, 10, 1, 0.5);
    CGContextFillRect(myPDfContext, CGRectMake(10, 20, 100, 200));
    
    CGPDFContextEndPage(myPDfContext);
    CFRelease(myValues[0]);
    CFRelease(pageDictionary);
    CGContextRelease(myPDfContext);
}

CGContextRef MyPDFContextCreatWithURL(const CGRect *inMediaBox,CFStringRef url){
    CGContextRef myOutConetext = NULL;
    CFURLRef webUrl;
    webUrl = CFURLCreateWithFileSystemPath(NULL, url, kCFURLPOSIXPathStyle, false);
    if (webUrl != NULL) {
        myOutConetext = CGPDFContextCreateWithURL(webUrl, inMediaBox, NULL);
        CFRelease(webUrl);
    }
    return  myOutConetext;
}

CGContextRef MyPDFContextCreat(const CGRect * inMediaBox, CFStringRef cfUrl){
    CGContextRef myContextRef = NULL;
    CFURLRef webUrl;
    CGDataConsumerRef dataConsumerRef;
    webUrl = CFURLCreateWithFileSystemPath(NULL, cfUrl, kCFURLPOSIXPathStyle, false);
    if (webUrl != NULL) {
        dataConsumerRef = CGDataConsumerCreateWithURL(webUrl);
        if (dataConsumerRef != NULL) {
            myContextRef = CGPDFContextCreate(dataConsumerRef, inMediaBox, NULL);
            CFRelease(dataConsumerRef);
        }
        CFRelease(webUrl);
    }
    return myContextRef;
}


@end
