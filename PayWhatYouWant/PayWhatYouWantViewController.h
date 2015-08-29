//
//  PayWhatYouWantViewController.h
//  PayWhatYouWant
//
//  Created by Jon Como on 8/28/15.
//  Copyright (c) 2015 Jon Como. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^PaymentHandler)(BOOL madePayment, NSNumber *amount);

@interface PayWhatYouWantViewController : UIViewController

- (instancetype)initWithMessages:(NSArray *)messages payment:(PaymentHandler)handler;

@end
