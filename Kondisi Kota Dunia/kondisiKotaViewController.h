//
//  kondisiKotaViewController.h
//  Kondisi Kota Dunia
//
//  Created by Herman Tolle on 2/27/14.
//  Copyright (c) 2014 Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "hasilCekViewController.h"

@interface kondisiKotaViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *fieldKota;
- (IBAction)cekCuaca:(id)sender;

@end
