//
//  RGInitialViewController.m
//  RGBankAccount
//
//  Created by Roman Guarino on 31/01/2019.
//  Copyright © 2019 Román Guarino. All rights reserved.
//

#import "RGInitialViewController.h"
#import <RGBankAccountLib/RGBankAccountLib-Swift.h>
#import "ProgressHUD.h"

@interface RGInitialViewController ()
    @property (weak, nonatomic) IBOutlet UITextField *txtAmount;
    @property (weak, nonatomic) IBOutlet UILabel *lblAmount;
    @property RGBankAccount *account;
@end

@implementation RGInitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Cuenta Bancaria";
    //_account = [[RGBankAccount alloc] ge];

    
    UIBarButtonItem *moreButtom = [[UIBarButtonItem alloc] initWithTitle:@"Mas" style:UIBarButtonItemStylePlain target:self action:@selector(showOption)];
    self.navigationItem.rightBarButtonItem = moreButtom;
}

- (void)showOption {
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Movimientos detallados" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:^{}];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Editar colores" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:^{}];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Eliminar cuenta" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        if([self.account clearAccount]) {
            [ProgressHUD showSuccess:@"Cuenta eliminada con éxito"];
            [self refreshBalance];
        } else {
            [ProgressHUD showError:@"Ocurrió un error"];
        }
        [self dismissViewControllerAnimated:YES completion:^{}];
    }]];
    
    [self presentViewController:actionSheet animated:YES completion:nil];
}

- (IBAction)btnOperar:(UIButton *)sender {
    NSString *valueString = self.txtAmount.text;
    if([valueString length] == 0) {
        [ProgressHUD showError:@"Primero debes ingresar un valor"];
    } else {
        [_account doMovementAccountWithValue: [self.txtAmount.text floatValue]];
        [self refreshBalance];
    }
}

- (void) refreshBalance {
    self.lblAmount.text = [NSString stringWithFormat:@"$%.02f",[_account getAccountBalance]];
}

@end
