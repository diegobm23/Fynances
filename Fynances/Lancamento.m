//
//  Lancamento.m
//  Fynances
//
//  Created by Diego Moreira on 17/09/14.
//  Copyright (c) 2014 Diego Moreira. All rights reserved.
//

#import "Lancamento.h"

@implementation Lancamento

- (id) initWithTitle:(NSString *) titulo andDescription:(NSString *) descricao andDate:(NSDate *) data andValue:(NSDecimalNumber *) valor
{
    if ((self = [super init])) {
        self.titulo = titulo;
        self.descricao = descricao;
        self.data = data;
        self.valor = valor;
    }
    
    return self;
}

@end
