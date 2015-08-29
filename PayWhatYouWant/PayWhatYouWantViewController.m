//
//  PayWhatYouWantViewController.m
//  PayWhatYouWant
//
//  Created by Jon Como on 8/28/15.
//  Copyright (c) 2015 Jon Como. All rights reserved.
//

#import "PayWhatYouWantViewController.h"

#import "PayWhatYouWantManager.h"

const CGFloat viewPadding = 20.f;
const CGFloat animationTiming = .8f;
const CGFloat animationDistance = 40.f;

@interface PayWhatYouWantViewController ()

@property (nonatomic, copy) NSArray *messages;
@property (nonatomic, assign) NSUInteger currentMessage;

@property (nonatomic, copy) PaymentHandler paymentHandler;

// Interface
@property (nonatomic, strong) UILabel *labelMessage;
@property (nonatomic, strong) UIButton *buttonContinue;

@end

@implementation PayWhatYouWantViewController

- (instancetype)initWithMessages:(NSArray *)messages payment:(PaymentHandler)handler {
    if (self = [super init]) {
        // init
        self.view.backgroundColor = [UIColor whiteColor];
        
        self.messages = messages;
        self.paymentHandler = handler;
        self.currentMessage = 0;
    }
    
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self displayMessage:self.currentMessage];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // Finish transaction
    if (self.currentMessage == self.messages.count - 1) {
        
        if (self.paymentHandler) {
            self.paymentHandler(YES, @.99);
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    // Display the next message
    [self displayMessage:self.currentMessage + 1];
}

- (void)displayMessage:(NSUInteger)messageIndex {
    if (messageIndex > self.messages.count - 1) {
        return;
    }
    
    self.currentMessage = messageIndex;
    NSString *newMessage = self.messages[messageIndex];
    
    __weak PayWhatYouWantViewController *weakSelf = self;
    
    [UIView animateWithDuration:animationTiming animations:^{
        
        weakSelf.labelMessage.alpha = 0.f;
        weakSelf.labelMessage.layer.transform = CATransform3DMakeTranslation(0.f, -animationDistance, 0.f);
        
    } completion:^(BOOL finished) {
        
        weakSelf.labelMessage.layer.transform = CATransform3DIdentity;
        weakSelf.labelMessage.layer.transform = CATransform3DMakeTranslation(0.f, animationDistance, 0.f);
        weakSelf.labelMessage.text = newMessage;
        
        [UIView animateWithDuration:animationTiming animations:^{
            weakSelf.labelMessage.alpha = 1.f;
            weakSelf.labelMessage.layer.transform = CATransform3DIdentity;
        } completion:nil];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.labelMessage = [[UILabel alloc] initWithFrame:CGRectMake(viewPadding, viewPadding, self.view.bounds.size.width - viewPadding * 2.f, self.view.bounds.size.height - viewPadding * 2.f)];
    self.labelMessage.font = [UIFont systemFontOfSize:22.f];
    self.labelMessage.textColor = [UIColor darkGrayColor];
    [self.view addSubview:self.labelMessage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
