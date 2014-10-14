//
//  Lancamento.h
//  Fynances
//
//  Created by Diego Moreira on 17/09/14.
//  Copyright (c) 2014 Diego Moreira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lancamento : NSObject

@property (nonatomic, retain) NSString *titulo;
@property (nonatomic, retain) NSString *descricao;
@property (nonatomic, retain) NSDate *data;
@property (nonatomic, retain) NSDecimalNumber *valor;

- (id) initWithTitle:(NSString *) titulo andDescription:(NSString *) descricao andDate:(NSDate *) data andValue:(NSDecimalNumber *) valor;

@end
