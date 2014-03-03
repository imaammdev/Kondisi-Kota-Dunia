//
//  hasilCekViewController.h
//  Kondisi Kota Dunia
//
//  Created by Herman Tolle on 2/27/14.
//  Copyright (c) 2014 Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface hasilCekViewController : UIViewController <MKMapViewDelegate>


@property (strong, nonatomic) NSString *alamat;
@property (strong, nonatomic) IBOutlet UILabel *posisikota;
@property (strong, nonatomic) IBOutlet UILabel *keadaanCuaca;
@property (strong, nonatomic) IBOutlet UILabel *temperatureKota;
@property (strong, nonatomic) IBOutlet UILabel *kecepatanAngin;

@property (strong, nonatomic) IBOutlet UILabel *pressureudara;


@property (weak, nonatomic) IBOutlet MKMapView *petagambar;


@property (strong, nonatomic) IBOutlet UIImageView *logoCuaca;




- (void) jenisCuaca: (NSString *)idCuacanya, ...;

@end
