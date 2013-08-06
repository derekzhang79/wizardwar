//
//  PracticeModeAIService.m
//  WizardWar
//
//  Created by Sean Hess on 5/31/13.
//  Copyright (c) 2013 The LAB. All rights reserved.
//

#import "PracticeModeAIService.h"
#import "Spell.h"
#import "SpellFireball.h"
#import "SpellEarthwall.h"
#import "SpellBubble.h"
#import "SpellMonster.h"
#import "SpellVine.h"
#import "SpellWindblast.h"
#import "SpellIcewall.h"
#import "SpellFirewall.h"
#import "SpellInvisibility.h"
#import "SpellFist.h"
#import "SpellHelmet.h"
#import "SpellSleep.h"
#import "NSArray+Functional.h"

@interface PracticeModeAIService ()
@property (nonatomic) NSInteger lastSpellTick;
@property (nonatomic) NSArray * allSpells;

@property (nonatomic) BOOL stop;
@end

@implementation PracticeModeAIService

-(id)init {
    self = [super init];
    if (self) {
        
        self.allSpells = @[[SpellFireball class], [SpellEarthwall class], [SpellWindblast class], [SpellMonster class], [SpellBubble class], [SpellVine class], [SpellFist class], [SpellHelmet class], [SpellFireball class]];
        self.stop = YES;
//        self.allSpells = @[[SpellEarthwall class]];
    }
    return self;
}

-(void)simulateTick:(NSInteger)currentTick interval:(NSTimeInterval)interval {
    if (self.stop) return;
    // interval is seconds per tick
    float ticksPerSecond = 1/interval;
    NSInteger castTickInterval = 3*ticksPerSecond;
    
    if (self.lastSpellTick + castTickInterval < currentTick) {
        self.lastSpellTick = currentTick;
        [self.delegate aiDidCastSpell:[self randomSpell]];
//        self.stop = YES;
    }
}

-(Spell*)randomSpell {
    Class SpellType = [self.allSpells randomItem];
    return [SpellType new];
}

@end
