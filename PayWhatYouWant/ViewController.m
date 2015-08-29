//
//  ViewController.m
//  PayWhatYouWant
//
//  Created by Jon Como on 8/28/15.
//  Copyright (c) 2015 Jon Como. All rights reserved.
//

#import "ViewController.h"

#import "PayWhatYouWantViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    PayWhatYouWantViewController *payWhatYouWantVC = [[PayWhatYouWantViewController alloc] initWithMessages:@[@"Every user pays what they want", @"How much would you like to pay?"] payment:^(BOOL madePayment, NSNumber *amount) {
        
    }];
    
    [self presentViewController:payWhatYouWantVC animated:YES completion:nil];
}

@end
