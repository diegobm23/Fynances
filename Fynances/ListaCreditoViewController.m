//
//  ListaCreditoViewController.m
//  Fynances
//
//  Created by Diego Moreira on 27/08/14.
//  Copyright (c) 2014 Diego Moreira. All rights reserved.
//

#import "ListaCreditoViewController.h"
#import "DAOLancamento.h"
#import "Lancamento.h"

@interface ListaCreditoViewController ()

@end

@implementation ListaCreditoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self carregarCreditos];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) carregarCreditos
{
    DAOLancamento *dao = [[DAOLancamento alloc] init];
    arrayCreditos = [dao carregarCreditos];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayCreditos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CelulaCacheID;
    CelulaCacheID = @"CelulaGeralID";
    UITableViewCell *cell = [self.listaCreditos dequeueReusableCellWithIdentifier:CelulaCacheID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CelulaCacheID];
    }
    
    Lancamento *l = [arrayCreditos objectAtIndex:indexPath.row];
    cell.textLabel.text = l.titulo;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"R$ %.2f em %@", l.valor.floatValue, [NSDateFormatter localizedStringFromDate:l.data dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle]];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
