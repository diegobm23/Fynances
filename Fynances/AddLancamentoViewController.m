//
//  AddLancamentoViewController.m
//  Fynances
//
//  Created by Diego Moreira on 11/09/14.
//  Copyright (c) 2014 Diego Moreira. All rights reserved.
//

#import "AddLancamentoViewController.h"
#import "Lancamento.h"
#import "DAOLancamento.h"

@interface AddLancamentoViewController ()

@end

@implementation AddLancamentoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //Custom inicialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self registerForKeyboardNotifications];
    [self.lancValor setText:[NSString stringWithFormat:@"%.2f", 0.0]];
    [self.addMsg setText:@""];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWasShown:(NSNotification *)note
{
    NSDictionary* info = [note userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;

    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    
    if (!CGRectContainsPoint(aRect, self.activeField.frame.origin) ) {
        [self.scrollView scrollRectToVisible:self.activeField.frame animated:YES];
    }
}

- (void)keyboardWillBeHidden:(NSNotification *)note
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

- (IBAction)salvarLancamento:(id)sender
{
    [self.activeField resignFirstResponder];
    
    Lancamento *lanc = [[Lancamento alloc] initWithTitle:self.lancTitulo.text
                                          andDescription:self.lancDescricao.text
                                                 andDate:self.lancData.date
                                                andValue:[NSDecimalNumber decimalNumberWithString:self.lancValor.text]];
    
    DAOLancamento *dao = [[DAOLancamento alloc] init];
    
    if ([dao salvarLancamento:lanc]) {
        [self.addMsg setText:@"Lançamento salvo com sucesso."];
        [self.addMsg setTextColor: [UIColor blueColor]];
    }
    else {
        [self.addMsg setText:@"Erro ao salvar."];
        [self.addMsg setTextColor: [UIColor redColor]];
    }
    
    //Código para a animação do label com a msg de sucesso
    self.addMsg.alpha = 0;
    
    [UIView animateWithDuration:1 animations:^{
        self.addMsg.hidden = NO;
        self.addMsg.alpha = 1;
    } completion:^(BOOL finalizado) {
        [UIView animateWithDuration:1 delay:2 options:0 animations:^{
            self.addMsg.Alpha = 0;
        }completion:^(BOOL finished) {
            self.addMsg.hidden = YES;
        }];
    }];
}

- (IBAction)didBeginEditing:(UITextField *)sender
{
    self.activeField = (UITextField *)sender;
    
    if ((UITextField *)sender == self.lancValor) {
        if ([self.lancValor.text isEqualToString:[NSString stringWithFormat:@"%.2f", 0.0]]) {
            self.lancValor.text = @"";
        }
    }

}

- (IBAction)didEndEditing:(UITextField *)sender
{
    self.activeField = nil;
    [self mudarCorValor];
}

- (IBAction)controlarValor:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0) {
        [self.lancValor setText:[NSString stringWithFormat:@"%.2f", self.lancValor.text.doubleValue + 50]];
    }
    else if (sender.selectedSegmentIndex == 1) {
        [self.lancValor setText:[NSString stringWithFormat:@"%.2f", self.lancValor.text.doubleValue - 50]];
    }
    else {
        [self.lancValor setText:[NSString stringWithFormat:@"%.2f", self.lancValor.text.doubleValue * (-1)]];
    }
    
    [self mudarCorValor];
}

- (void)mudarCorValor
{
    if (self.lancValor.text.doubleValue < 0) {
        [self.lancValor setTextColor:[UIColor redColor]];
    }
    else if (self.lancValor.text.doubleValue > 0) {
        [self.lancValor setTextColor:[UIColor blueColor]];
    }
}

@end
