//
//  Card.m
//  Matchismo
//
//  Created by Qian on 4/17/20.
//  Copyright © 2020 Stella Xu. All rights reserved.
//

#import "Card.h"

@implementation Card

//- (int)match:(Card *)card {
//    if ([_contents isEqualToString:card.contents]) {
//        return 1;
//    }
//    return 0;
//}

- (int)match:(NSArray *)otherCards {
    
    for (Card *card in otherCards) {
        if ([_contents isEqualToString:card.contents]) return 1;
    }
    return 0;
}

@end
