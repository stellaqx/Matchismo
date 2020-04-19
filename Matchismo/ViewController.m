//
//  ViewController.m
//  Matchismo
//
//  Created by Qian on 4/17/20.
//  Copyright © 2020 Stella Xu. All rights reserved.
//

#import "ViewController.h"
#import "Card.h"
#import "Deck.h"
#import "PlayCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic) int flipsCount;
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;
@end

@implementation ViewController

- (CardMatchingGame *)game {
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:self.deck];
        
    return _game;
}

- (Deck *)deck {
    if (!_deck) _deck = [[PlayCardDeck alloc] init];
    return _deck;
}

// target - action IBAction is purely Xcode thing, but compiler ignores
- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        self.flipsCount++;
    } else {
        Card *card = [self.deck drawRandomCard];
        NSLog(@"Card: %@", card);
        if (card) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
            [sender setTitle: card.contents forState:UIControlStateNormal];
            self.flipsCount++;
        }
    }
    
    [self setFlipCount:_flipsCount];
}

- (void)setFlipCount:(int)flipCnt {
    _flipsCount = flipCnt;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipsCount];
    NSLog(@"flipsCount = %d", self.flipsCount);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
