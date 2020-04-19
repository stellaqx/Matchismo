//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Qian on 4/18/20.
//  Copyright © 2020 Stella Xu. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()
// re-declare
@property (nonatomic, readwrite) NSUInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // NSMutableArray just holds a bunch of pointers, we need to make sure they are of type (Card *) indeed
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount: (NSUInteger)count usingDeck:(Deck *) deck {
    for (int i = 0; i < count; i++) {
        Card *card = [deck drawRandomCard];
        if (card) {
            [self.cards addObject:card];
        }
        else {
            return nil;
        }
    }
    return self;
}

// ENTIRE BUSINESS LOGIC HERE
static const int MISMATCH = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;
- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    if (!card) return;
    if (card.isMatched) return;
    
    // we only perform with cards that are not matched
    if (card.isChosen) {
        // if you choose a card, and you click it again, going to un-choose it
        card.chosen = NO;
    } else {
        for (Card *otherCard in self.cards) {
            // match against another card
            if (otherCard.isChosen && !otherCard.isMatched) {
                int matchScore = [card match:@[otherCard]];
                if (matchScore) {
                    self.score += matchScore * MATCH_BONUS;
                    card.matched = YES;
                    otherCard.matched = YES;
                } else {
                    self.score -= MISMATCH;
                    otherCard.chosen = NO;
                }
                break;
            }
        }
        self.score -= COST_TO_CHOOSE;
        card.chosen = YES;
    }
        
    
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return (index < [self.cards count]) ? self.cards[index] : nil;
}


@end
