//
//  XLViewController.h
//  ScanDownload
//
//  Created by xie liang on 6/14/12.
//  Copyright (c) 2012 pretang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface XLViewController : UIViewController
<ZBarReaderDelegate>

@property (nonatomic,retain) IBOutlet UITextField *addressField;

- (IBAction)doScan:(id)sender;

@end
