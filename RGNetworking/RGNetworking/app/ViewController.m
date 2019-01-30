#import "ViewController.h"
#import "RGNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)buttonTest:(UIButton *)sender {
    [RGNetworking show];
}
@end
