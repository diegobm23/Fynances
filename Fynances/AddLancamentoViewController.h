//
//  AddLancamentoViewController.h
//  Fynances
//
//  Created by Diego Moreira on 11/09/14.
//  Copyright (c) 2014 Diego Moreira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddLancamentoViewController : UIViewController

@property UITextField *activeField;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *lancTitulo;
@property (weak, nonatomic) IBOutlet UITextField *lancDescricao;
@property (weak, nonatomic) IBOutlet UIDatePicker *lancData;
@property (weak, nonatomic) IBOutlet UITextField *lancValor;
@property (weak, nonatomic) IBOutlet UILabel *addMsg;

- (IBAction)salvarLancamento:(id)sender;
- (IBAction)didBeginEditing:(UITextField *)sender;
- (IBAction)didEndEditing:(UITextField *)sender;
- (IBAction)controlarValor:(UISegmentedControl *)sender;

- (void)mudarCorValor;

@end