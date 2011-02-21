//
//  main.m
//  euler14
//
//  Created by Brian Morton on 2/21/11.
//  Copyright 2011 The San Diego Reader. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Collatz : NSObject {
    NSArray *terms;
    long startingTerm;
}
-(Collatz*)initWithStartingTerm:(long)number;
-(int)numberOfTerms;
-(void)setStartingTerm:(long)number;
-(long)startingTerm;
-(void)generateTerms;

@property (retain) NSArray *terms;
//@property (assign) int startingTerm;

@end

@implementation Collatz

@synthesize terms;

-(Collatz*)initWithStartingTerm:(long)number {
    self = [super init];
    
    if (self) {
        [self setStartingTerm:number];
    }
    
    return self;
}

-(long)startingTerm {
    return startingTerm;
}

-(void)setStartingTerm:(long)number {
    if (number != startingTerm) {
        startingTerm = number;
        [self generateTerms];
    }
}

-(void)generateTerms {
    if (startingTerm > 0) {
        NSNumber *objectForStartingTerm = [[NSNumber alloc]initWithLong:startingTerm];
        NSMutableArray *workingArray = [[NSMutableArray alloc] initWithObjects:objectForStartingTerm, nil];
        [objectForStartingTerm release];
        long currentNumber = startingTerm;
        
        while (currentNumber != 1) {
            if (currentNumber % 2 == 0) {
                currentNumber = (currentNumber/2);
            } else {
                currentNumber = ((3*currentNumber)+1);
            }
            NSNumber *objectForCurrentNumber = [[NSNumber alloc]initWithLong:currentNumber];
            [workingArray addObject:objectForCurrentNumber];
            [objectForCurrentNumber release];
        }
        [terms release];
        terms = [NSArray arrayWithArray:workingArray];
        [workingArray release];
    } else {
        terms = nil;
    }
}

-(int)numberOfTerms {
    return (int)[terms count];
}

-(void)dealloc {
    [terms release];
    [super dealloc];
}

@end

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
    NSLog(@"Starting the run loop.");
    
    
    
    int highestTermCount = 0;
    long startingTermForHighest = 0;
    
    for (long i = 1; i <= 1000000; i++) {
        Collatz *testForLength = [[Collatz alloc] initWithStartingTerm:1];
        testForLength.startingTerm = i;
        
        if ([testForLength numberOfTerms] > highestTermCount) {
            highestTermCount = [testForLength numberOfTerms];
            startingTermForHighest = i;
        }
        
        printf("%i: %i\n", i, [testForLength numberOfTerms]);
        [testForLength release];
    }
    
    
    printf("Highest term and count was %i with %i terms.", startingTermForHighest, highestTermCount);

    [pool drain];
    return 0;
}

