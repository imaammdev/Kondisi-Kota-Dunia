//
//  hasilCekViewController.m
//  Kondisi Kota Dunia
//
//  Created by Herman Tolle on 2/27/14.
//  Copyright (c) 2014 Lab. All rights reserved.
//

#import "hasilCekViewController.h"


@interface hasilCekViewController ()

@end
#define METERS_PER_MILE 1609.344
@implementation hasilCekViewController
@synthesize petagambar;
@synthesize alamat;
@synthesize posisikota;
@synthesize keadaanCuaca;
@synthesize temperatureKota;
@synthesize kecepatanAngin;
@synthesize pressureudara;



@synthesize logoCuaca;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/find?q=%@&mode=json", alamat]]];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    
    NSError *error = nil;
    NSDictionary *myDictionary = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:&error];
    NSArray *list = [myDictionary objectForKey:@"list"];
    
    NSDictionary *weather = [list objectAtIndex:0];
    NSString *namaKota = [weather objectForKey:@"name"];
    [posisikota setText:[NSString stringWithFormat:@"%@", namaKota]];
    
    
    
    
    //ini untuk ambil data weather
    NSArray *isiWeather = [weather objectForKey:@"weather"];
    NSDictionary *ambildata = [isiWeather objectAtIndex:0];
    NSString *deskripsi = [ambildata objectForKey:@"description"];
    
    //ini untuk ambil data angin
    NSDictionary *isiAngin = [weather objectForKey:@"wind"];
    NSString *speedangin = [isiAngin objectForKey:@"speed"];
    
    
    //ambil lat dan long
    NSDictionary *coord = [weather objectForKey:@"coord"];
    
    NSString *lat = [coord objectForKey:@"lat"];
    NSString *lon = [coord objectForKey:@"lon"];
    
    double lati = [lat doubleValue];
    double longi = [lon doubleValue];
    
    
    //ini buat ngeset lat dan long
    CLLocationCoordinate2D location;
    location.latitude = lati;
    location.longitude = longi;
    
    MKCoordinateRegion region;
    
    //ini buat mengatur zoom dari lokasi yang ditampilkan
    MKCoordinateSpan span;
    span.latitudeDelta = 0.4;
    span.longitudeDelta = 0.4;
    
    region.span = span;
    region.center = location;
    
    
    [petagambar setRegion:region animated:YES];
    [petagambar regionThatFits:region];
    
    
    
    //ini untuk ambil data main
    NSDictionary *isiMain = [weather objectForKey:@"main"];
    
    NSString *tempKota = [isiMain objectForKey:@"temp"];
    double suhu = [tempKota doubleValue];
    suhu = suhu - 273.15;
    
    NSString *preessKota = [isiMain objectForKey:@"pressure"];
    
    
    [keadaanCuaca setText:[NSString stringWithFormat:@"%@", deskripsi]];
    [temperatureKota setText:[NSString stringWithFormat:@"%g° C", suhu]];
    [kecepatanAngin setText:[NSString stringWithFormat:@"%@ Mps", speedangin]];
    [pressureudara setText:[NSString stringWithFormat:@"%@ hPa", preessKota]];
    
    NSLog(@"%@", list);
    
    
    NSString *nilaiId = [ambildata objectForKey:@"id"];
    [self jenisCuaca:nilaiId];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (void) jenisCuaca: (NSString *)idCuacanya, ...{
    NSArray *arrayIdCuaca = [NSArray arrayWithObjects: @"200",@"201",@"202",@"210",@"211",@"212",@"221",@"230",@"231",@"232",@"300",@"301",@"302",@"310",@"311",@"312",@"313",@"314",@"321",@"500",@"501",@"502",@"503",@"504",@"511",@"520",@"521",@"522",@"531",@"600",@"601",@"602",@"611",@"612",@"615",@"616",@"620",@"621",@"622",@"701",@"711",@"721",@"731",@"741",@"751",@"761",@"762",@"771",@"781",@"800",@"801",@"802",@"803",@"804", nil];
    
    
    
    NSArray *arrayLogo = [NSArray arrayWithObjects:@"11d.png",@"11d.png",@"11d.png",@"11d.png",@"11d.png",@"11d.png",@"11d.png",@"11d.png",@"11d.png",@"11d.png",@"09d.png",@"09d.png",@"09d.png",@"09d.png",@"09d.png",@"09d.png",@"09d.png",@"09d.png",@"09d.png",@"10d.png",@"10d.png",@"10d.png",@"10d.png",@"10d.png",@"10d.png",@"10d.png",@"10d.png",@"10d.png",@"10d.png",@"13d.png",@"13d.png",@"13d.png",@"13d.png",@"13d.png",@"13d.png",@"13d.png",@"13d.png",@"13d.png",@"13d.png",@"50d.png",@"50d.png",@"50d.png",@"50d.png",@"50d.png",@"50d.png",@"50d.png",@"50d.png",@"50d.png",@"50d.png", @"01d.png",@"02d.png",@"03d.png",@"04d.png",@"04d.png", nil];
    
    NSUInteger numb = 0;
    
    for (NSString *ambil in arrayIdCuaca){
        if ([ambil isEqualToString: [NSString stringWithFormat:@"%@",idCuacanya]]) {
            break;
        }else{
            numb = numb + 1;
        }
    }
    
    NSString *alamatLogo = [arrayLogo objectAtIndex:numb];
    
    logoCuaca.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@",alamatLogo]]]];
}











@end
