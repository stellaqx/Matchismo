//
//  PlayingCard.m
//  Matchismo
//
//  Created by Qian on 4/17/20.
//  Copyright © 2020 Stella Xu. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

+ (NSArray *)validSuites {
    return @[@"♠︎", @"♣︎", @"♥︎", @"♦︎"];
}

+ (NSArray *)rankStrings {
    return @[@"?", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank {
    return [[PlayingCard rankStrings] count] - 1;
}

- (NSString *)contents {
    NSArray *symbols = [PlayingCard rankStrings];
    return [NSString stringWithFormat:@"%@%@", symbols[self.rank], self.suit];
}

- (void)setSuit:(NSString *)suit {
    if ([[PlayingCard validSuites] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit {
    return _suit? _suit : @"?";
}

- (void)setRank:(NSUInteger) rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

- (int)match:(NSArray *)otherCards {
    int score = 0;
    for (PlayingCard *otherCard in otherCards) {
        if ([self.contents isEqualToString:otherCard.contents]) score+= 100;
        else if ([self.suit isEqualToString:otherCard.suit]) score += 1;
        else if (self.rank == otherCard.rank) score += 4;
    }
    return score;
}

@end
