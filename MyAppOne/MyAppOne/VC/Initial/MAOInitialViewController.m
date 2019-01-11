//
//  MAOInitialViewController.m
//  MyAppOne
//
//  Created by Julio Castillo on 9/1/19.
//  Copyright © 2019 iOS-accelerator. All rights reserved.
//

#import "MAOInitialViewController.h"
#import "MAOListViewController.h"
#import "../../Services/MARequestService.h"
#import "../List/MAOListViewController.h"
#import "../List/MAOListViewControllerModel.h"

@interface MAOInitialViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIView *okICon;
@property (nonatomic, strong) NSMutableArray<MAOListViewControllerModel *> *arrayModels;

@end

@implementation MAOInitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.activityIndicator setHidden:TRUE];
}

- (IBAction)onClickSelection:(id)sender {
    [self.activityIndicator startAnimating];
    [self.activityIndicator setHidden:FALSE];
    
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/search?term=jack+johnson"];
    [[MARequestService sharedInstance] fetchData:^(NSArray *dataArray, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.activityIndicator stopAnimating];
            [self.activityIndicator setHidden:TRUE];
       });
        
        if (!error) {
            NSLog(@"Data: %@",dataArray);
            dataArray = [dataArray valueForKey:@"results"];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.arrayModels = [[NSMutableArray<MAOListViewControllerModel *> alloc] init];
                for (id itemArray in dataArray) {
                    MAOListViewControllerModel *item = [[MAOListViewControllerModel alloc] initFromDictionary:itemArray];
                    [self.arrayModels addObject:item];
                }
            });
        }
        else
        {
            NSLog(@"Error request %@", error);
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Atención"
                                                                           message:[error localizedDescription]
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    } fromURL:url];
}

- (IBAction)btnShowASC:(UIButton *)sender {
    [self goToListShowDesc:FALSE];
}

- (IBAction)btnShowDESC:(UIButton *)sender {
    [self goToListShowDesc:TRUE];
}

-(void) goToListShowDesc:(BOOL) showDesc {
    NSArray *sortedArray = [_arrayModels sortedArrayUsingComparator: ^(MAOListViewControllerModel* obj1, MAOListViewControllerModel* obj2) {
        NSNumber *obj1TrackId = [obj1 trackId];
        NSNumber *obj2TrackId = [obj2 trackId];
        
        if(showDesc) {
            return [obj2TrackId compare:obj1TrackId];
        } else {
            return [obj1TrackId compare:obj2TrackId];
        }
    }];
    
    MAOListViewController *listView = [[MAOListViewController alloc] initWithModel:sortedArray];
    [self.navigationController pushViewController:listView animated:YES];
}

@end
