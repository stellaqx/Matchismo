//
//  PlayingCard.h
//  Matchismo
//
//  Created by Qian on 4/17/20.
//  Copyright © 2020 Stella Xu. All rights reserved.
//

#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuites;
+ (NSUInteger)maxRank;

@end

NS_ASSUME_NONNULL_END
