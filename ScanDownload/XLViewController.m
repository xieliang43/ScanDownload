//
//  XLViewController.m
//  ScanDownload
//
//  Created by xie liang on 6/14/12.
//  Copyright (c) 2012 pretang. All rights reserved.
//

#import "XLViewController.h"

@interface XLViewController ()

@end

@implementation XLViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)presentOtherController:(id)sender
{
    XLOtherViewController *otherController = [[XLOtherViewController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:otherController animated:YES];
    [otherController release];
}

- (IBAction)scan:(id)sender
{
    if ([ZBarReaderViewController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]&&
        [ZBarReaderViewController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]) {
        // ADD: present a barcode reader that scans from the camera feed
        ZBarReaderViewController *reader = [[ZBarReaderViewController alloc] init];
        reader.readerDelegate = self;
        reader.showsZBarControls = NO;
        reader.supportedOrientationsMask = ZBarOrientationMaskAll;
        UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
        v.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        reader.cameraOverlayView = v;
        [v release];
        
        ZBarImageScanner *scanner = reader.scanner;
        // TODO: (optional) additional reader configuration here
        
        // EXAMPLE: disable rarely used I2/5 to improve performance
        [scanner setSymbology: ZBAR_I25
                       config: ZBAR_CFG_ENABLE
                           to: 0];
        
        // present and release the controller
        [self presentModalViewController:reader animated: YES];
        [reader release];
    }else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"您的设备摄像头不可用！"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}

- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    // ADD: get the decode results
    id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        // EXAMPLE: just grab the first barcode
        break;
    
    // EXAMPLE: do something useful with the barcode data
    NSString *str = symbol.data;
    NSURL *url = [NSURL URLWithString:str];
    
    // EXAMPLE: do something useful with the barcode image
    //resultImage.image = [info objectForKey: UIImagePickerControllerOriginalImage];
    
    // ADD: dismiss the controller (NB dismiss from the *reader*!)
    [reader dismissModalViewControllerAnimated: YES];
    
    if (!url) {
        [[UIApplication sharedApplication] openURL:url];
    }else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"url地址不正确！"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    
}

@end
