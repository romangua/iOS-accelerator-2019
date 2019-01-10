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
                NSMutableArray<MAOListViewControllerModel*> *modelArray = [[NSMutableArray<MAOListViewControllerModel *> alloc] init];
                for (id itemArray in dataArray) {
                    MAOListViewControllerModel *item = [[MAOListViewControllerModel alloc] initFromDictionary:itemArray];
                    [modelArray addObject:item];
                }
                MAOListViewController *listView = [[MAOListViewController alloc] initWithModel:modelArray];
                [self.navigationController pushViewController:listView animated:YES];
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

@end
