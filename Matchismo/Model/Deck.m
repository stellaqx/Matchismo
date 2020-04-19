//
//  Deck.m
//  Matchismo
//
//  Created by Qian on 4/17/20.
//  Copyright © 2020 Stella Xu. All rights reserved.
//

#import "Deck.h"

@interface Deck ()

@property (strong, nonatomic)NSMutableArray *cards;

@end

@implementation Deck

- (NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop {
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (void)addCard:(Card *)card {
    [self addCard:card atTop:NO];
}

- (Card *)drawRandomCard {
    Card *randCard = nil;
    
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randCard;
}

@end
