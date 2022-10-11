

#import <Foundation/Foundation.h>

@interface Adder : NSObject
//@property(nonatomic, readonly) NSInteger total;

- (id)initWithInitialNumber:(NSInteger)initialNumber;
- (void)addNumber:(NSInteger)newNumber;
- (NSInteger)getTotal;

@end

@implementation Adder {
    NSInteger total;
}

//@synthesize total;

- (id)initWithInitialNumber:(NSInteger)initialNumber {
    self = [super init];
    total = initialNumber;
    return self;
}

- (void)addNumber:(NSInteger)newNumber {
    total = total + newNumber;
}

- (NSInteger)getTotal {
    return total;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Adder *adder = [[Adder alloc] initWithInitialNumber:10];
        [adder addNumber:5];
        [adder addNumber:4];
        
//        NSLog(@"The total is %ld", adder.total);
        NSLog(@"The total is %ld", [adder getTotal]);
    }
    return 0;
}