//
//  DAOLancamento.m
//  Fynances
//
//  Created by Diego Moreira on 17/09/14.
//  Copyright (c) 2014 Diego Moreira. All rights reserved.
//

#import "DAOLancamento.h"
#import "AppDelegate.h"
#import "Lancamento.h"

@implementation DAOLancamento

-(BOOL)salvarLancamento:(Lancamento *) lanc
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSManagedObject *novoLancamento = [NSEntityDescription insertNewObjectForEntityForName:@"Lancamentos" inManagedObjectContext:context];
    
    [novoLancamento setValue:lanc.titulo forKeyPath:@"titulo"];
    [novoLancamento setValue:lanc.descricao forKeyPath:@"descricao"];
    [novoLancamento setValue:lanc.data forKeyPath:@"data"];
    [novoLancamento setValue:lanc.valor forKeyPath:@"valor"];
    
    NSError *error;
    return [context save:&error];
}

- (NSMutableArray *)carregarLancamentos
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Lancamentos" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDesc];
    
    NSManagedObject *matches = nil;
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];

    NSMutableArray *arrayLanc = [[NSMutableArray alloc] init];
    
    if ([objects count] > 0) {
        for (int i = 0; i < [objects count]; i++) {
            matches = objects[i];
            
            NSString *titulo = [matches valueForKey:@"titulo"];
            NSString *descricao = [matches valueForKey:@"descricao"];
            NSDate *data = [matches valueForKey:@"data"];
            NSDecimalNumber *valor = [matches valueForKey:@"valor"];
            
            Lancamento *lanc = [[Lancamento alloc] initWithTitle:titulo andDescription:descricao andDate:data andValue:valor];
            [arrayLanc addObject:lanc];
        }
    }
    
    return arrayLanc;
}

@end
