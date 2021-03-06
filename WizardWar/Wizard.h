//
//  Player.h
//  WizardWar
//
//  Created by Sean Hess on 5/17/13.
//  Copyright (c) 2013 The LAB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Units.h"
#import "Objectable.h"
#import "PlayerEffect.h"
#import "Simulated.h"

#define WIZARD_TYPE_ONE @"1"
#define WIZARD_TYPE_TWO @"2"
#define WIZARD_TYPE_DUMMY @"wizard-dummy"
#define MAX_HEALTH 5

typedef enum WizardStatus {
    WizardStatusReady,
    WizardStatusCast,
    WizardStatusHit,
    WizardStatusDead,
    WizardStatusWon,
} WizardStatus;

@interface Wizard : NSObject <Objectable>
@property (nonatomic, strong) NSString * name;
@property (nonatomic) WizardStatus state;
@property (nonatomic) NSInteger updatedTick;
@property (nonatomic) float position; // in units (not pixels)
@property (nonatomic) NSInteger health;
@property (nonatomic, strong) NSString * wizardType;
@property (nonatomic, strong) PlayerEffect * effect; // current effect applied
@property (nonatomic) NSInteger effectStartTick;
@property (nonatomic) float altitude; // how high you are. 0 = normal
@property (readonly) NSInteger direction;
@property (nonatomic) NSUInteger colorRGB; // hex rgb value
@property (nonatomic, strong) UIColor * color;
@property (nonatomic, strong) NSString * message;

-(BOOL)isFirstPlayer;
-(void)setStatus:(WizardStatus)status atTick:(NSInteger)tick;
+(NSString*)randomWizardType;
-(Wizard*)evilClone;
-(void)copyStateFrom:(Wizard*)wizard;
- (BOOL)simulateTick:(NSInteger)currentTick interval:(NSTimeInterval)interval;
@end
