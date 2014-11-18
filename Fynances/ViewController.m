//
//  ViewController.m
//  Fynances
//
//  Created by Diego Moreira on 26/08/14.
//  Copyright (c) 2014 Diego Moreira. All rights reserved.
//

#import "ViewController.h"
#import "GeralMenu.h"
#import "DAOLancamento.h"
#import "Lancamento.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self carregarMenus];
    [self carregarlancamentos];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self carregarlancamentos];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)carregarMenus
{
    NSString *plistCaminho = [[NSBundle mainBundle] pathForResource:@"Menu" ofType:@"plist"];
    NSDictionary *pl = [NSDictionary dictionaryWithContentsOfFile:plistCaminho];
    NSArray *dados = [pl objectForKey:@"menu"];
    
    arrayMenus = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in dados) {
        GeralMenu *m = [[GeralMenu alloc] initWithTitulo:[item objectForKey:@"titulo"] andSegue:[item objectForKey:@"segue"]];
        [arrayMenus addObject:m];
    }
}

- (void) carregarlancamentos
{
    DAOLancamento *dao = [[DAOLancamento alloc] init];
    arrayLancGerais = [dao carregarLancamentos];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.tabelaMenu) {
        return [arrayMenus count];
    }
    else {
        return [arrayLancGerais count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CelulaCacheID;
    
    if (tableView == self.tabelaMenu) {
        CelulaCacheID = @"CelulaMenuID";
        UITableViewCell *cell = [self.tabelaMenu dequeueReusableCellWithIdentifier:CelulaCacheID];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CelulaCacheID];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        GeralMenu *m = [arrayMenus objectAtIndex:indexPath.row];
        cell.textLabel.text = m.titulo;
        
        return cell;
    }
    else  {
        CelulaCacheID = @"CelulaGeralID";
        UITableViewCell *cell = [self.tabelaMenu dequeueReusableCellWithIdentifier:CelulaCacheID];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CelulaCacheID];
        }
        
        Lancamento *l = [arrayLancGerais objectAtIndex:indexPath.row];
        cell.textLabel.text = l.titulo;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"R$ %.2f em %@", l.valor.floatValue, [NSDateFormatter localizedStringFromDate:l.data dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle]];
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.tabelaMenu) {
        GeralMenu *m = [arrayMenus objectAtIndex:indexPath.row];
        [self performSegueWithIdentifier:m.segue sender:nil];
    }
    
    if (tableView == self.tabelaLancamentos) {
        
    }
}

@end
