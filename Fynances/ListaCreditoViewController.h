//
//  ListaCreditoViewController.h
//  Fynances
//
//  Created by Diego Moreira on 27/08/14.
//  Copyright (c) 2014 Diego Moreira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListaCreditoViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *arrayCreditos;
}

@property (weak, nonatomic) IBOutlet UITableView *listaCreditos;

@end
