//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Qian on 4/18/20.
//  Copyright © 2020 Stella Xu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardMatchingGame : NSObject

- (instancetype)initWithCardCount: (NSUInteger)count usingDeck:(Deck *) deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;

@end

NS_ASSUME_NONNULL_END
