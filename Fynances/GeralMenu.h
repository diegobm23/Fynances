//
//  GeralMenu.h
//  Fynances
//
//  Created by Diego Moreira on 09/09/14.
//  Copyright (c) 2014 Diego Moreira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GeralMenu : NSObject

- (id) initWithTitulo:(NSString *) titulo andSegue:(NSString *) segue;

@property (nonatomic, retain) NSString *titulo;
@property (nonatomic, retain) NSString *segue;

@end
