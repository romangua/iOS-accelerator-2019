//
//  MAODetailViewController.m
//  MyAppOne
//
//  Created by Roman Guarino on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAODetailViewController.h"
#import "../../Model/MAOListViewControllerModel.h"

@interface MAODetailViewController ()
@property (nonatomic, strong) MAOListViewControllerModel *model;
@end

@implementation MAODetailViewController

- (instancetype) initWithModel:(MAOListViewControllerModel *) model {
    self = [super init];
    if(self){
        _model = model;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (IBAction)btnClose:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnBuy:(UIButton *)sender {
}

@end
