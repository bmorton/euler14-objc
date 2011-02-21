//
//  main.m
//  euler14
//
//  Created by Brian Morton on 2/21/11.
//

#import <Foundation/Foundation.h>

@interface Collatz : NSObject {
    long startingTerm;
    int numberOfTerms;
}
-(Collatz*)initWithStartingTerm:(long)number;
-(int)numberOfTerms;
-(void)setStartingTerm:(long)number;
-(long)startingTerm;
-(void)generateTerms;

//@property (retain) NSArray *terms;
@property (assign) int numberOfTerms;

@end

@implementation Collatz

@synthesize numberOfTerms;

-(Collatz*)initWithStartingTerm:(long)number {
    self = [super init];
    
    if (self) {
        numberOfTerms = 0;
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
        long currentNumber = startingTerm;
        numberOfTerms = 1;
        
        while (currentNumber != 1) {
            if (currentNumber % 2 == 0) {
                currentNumber = (currentNumber/2);
            } else {
                currentNumber = ((3*currentNumber)+1);
            }
            numberOfTerms++;
        }
    } else {
        numberOfTerms = 0;
    }
}

-(void)dealloc {
    [super dealloc];
}

@end

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    int highestTermCount = 0;
    long startingTermForHighest = 0;

    Collatz *testForLength = [[Collatz alloc] initWithStartingTerm:0];
    
    for (long i = 1; i <= 1000000; i++) {

        testForLength.startingTerm = i;
        
        if ([testForLength numberOfTerms] > highestTermCount) {
            highestTermCount = [testForLength numberOfTerms];
            startingTermForHighest = i;
        }
        
        printf("%i: %i\n", i, [testForLength numberOfTerms]);
    }
    
    [testForLength release];
    
    printf("Highest term and count was %i with %i terms.", startingTermForHighest, highestTermCount);

    [pool drain];
    return 0;
}

