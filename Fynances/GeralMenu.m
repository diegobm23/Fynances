//
//  GeralMenu.m
//  Fynances
//
//  Created by Diego Moreira on 09/09/14.
//  Copyright (c) 2014 Diego Moreira. All rights reserved.
//

#import "GeralMenu.h"

@implementation GeralMenu

- (id) initWithTitulo:(NSString *) titulo andSegue:(NSString *) segue
{
    if ((self = [super init])) {
        self.titulo = titulo;
        self.segue = segue;
    }
    
    return self;
}

@end
