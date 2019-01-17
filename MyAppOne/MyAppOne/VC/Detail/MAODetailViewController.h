//
//  MAODetailViewController.h
//  MyAppOne
//
//  Created by Roman Guarino on 17/01/2019.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../Model/MAOListViewControllerModel.h"

@interface MAODetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblTrackName;
@property (weak, nonatomic) IBOutlet UILabel *lblAlbumName;
@property (weak, nonatomic) IBOutlet UILabel *lblAutorName;
@property (weak, nonatomic) IBOutlet UILabel *lblPriceTrack;
@property (weak, nonatomic) IBOutlet UIButton *btnBuy;
@property (weak, nonatomic) IBOutlet UIImageView *imgAlbum;
@property (weak, nonatomic) IBOutlet UIButton *btnDismiss;

- (instancetype) initWithModel:(MAOListViewControllerModel *) model;

@end
