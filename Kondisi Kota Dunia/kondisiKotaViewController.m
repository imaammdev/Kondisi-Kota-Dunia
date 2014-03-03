//
//  kondisiKotaViewController.m
//  Kondisi Kota Dunia
//
//  Created by Herman Tolle on 2/27/14.
//  Copyright (c) 2014 Lab. All rights reserved.
//

#import "kondisiKotaViewController.h"

@interface kondisiKotaViewController ()

@end

@implementation kondisiKotaViewController
@synthesize fieldKota;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
         
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)cekCuaca:(id)sender {
    
    if ([fieldKota.text isEqualToString:@""]) {
        
    }else{
        hasilCekViewController *hcvc = [self.storyboard instantiateViewControllerWithIdentifier:@"hasilCekViewController"];
    
        hcvc.alamat = fieldKota.text;
        [self presentViewController:hcvc animated:YES completion:nil];
    }
}
@end
