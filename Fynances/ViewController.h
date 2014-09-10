//
//  ViewController.h
//  Fynances
//
//  Created by Diego Moreira on 26/08/14.
//  Copyright (c) 2014 Diego Moreira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *arrayMenus;
    NSMutableArray *arrayLancGerais;
}

@property (weak, nonatomic) IBOutlet UITableView *tabelaMenu;

@end
