//
//  XLViewController.h
//  ScanDownload
//
//  Created by xie liang on 6/14/12.
//  Copyright (c) 2012 pretang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"
#import "XLOtherViewController.h"
#import "XLMaskView.h"

@interface XLViewController : UIViewController
<ZBarReaderDelegate>

- (IBAction)scan:(id)sender;
- (IBAction)presentOtherController:(id)sender;

@end
