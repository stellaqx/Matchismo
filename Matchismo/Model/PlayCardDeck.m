//
//  PlayCardDeck.m
//  Matchismo
//
//  Created by Qian on 4/17/20.
//  Copyright © 2020 Stella Xu. All rights reserved.
//

#import "PlayCardDeck.h"
#import "PlayingCard.h"

@implementation PlayCardDeck

// someone is going to call this
- (instancetype)init {
    self = [super init];
    if (self) {
        for (NSString *suit in [PlayingCard validSuites]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card];
            }
        }
    }
    
    return self;
}

@end
