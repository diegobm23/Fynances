//
//  DAOLancamento.h
//  Fynances
//
//  Created by Diego Moreira on 17/09/14.
//  Copyright (c) 2014 Diego Moreira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Lancamento.h"

@interface DAOLancamento : NSObject

- (BOOL)salvarLancamento:(Lancamento *) lanc;
- (NSMutableArray *)carregarLancamentos;
- (NSMutableArray *)carregarCreditos;

@end
