//
//  Card.h
//  Matchismo
//
//  Created by Qian on 4/17/20.
//  Copyright © 2020 Stella Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

/* the integer is 0, if the two card does not match
 Other values means they match
 */
// No method overloading... sad!
//- (int)match:(Card *)card;

- (int)match:(NSArray *)otherCards;

@end

NS_ASSUME_NONNULL_END
