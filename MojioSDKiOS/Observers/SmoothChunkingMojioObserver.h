//
//  SmoothChunkingMojioObserver.h
//  VirtualMechanic
//
//  Created by Ashish Agarwal on 2015-03-31.
//  Copyright (c) 2015 Mojio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "ConditionalObserverBase.h"

@interface SmoothChunkingMojioObserver : ConditionalObserverBase

@property (nonatomic) float InterpolationRate;

@end
