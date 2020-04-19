//
//  Deck.h
//  Matchismo
//
//  Created by Qian on 4/17/20.
//  Copyright © 2020 Stella Xu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end

NS_ASSUME_NONNULL_END
