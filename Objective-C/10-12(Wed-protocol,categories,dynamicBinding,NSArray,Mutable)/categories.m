#import <Foundation/Foundation.h>

// 문자열 안의 모음 문자의 갯수를 알아보려는 카테고리
@interface NSString(VowelCounting)
- (int)vowelCount;
@end

@implementation NSString(VowelCounting)

- (int)vowelCount {
    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouyAEIOUY"];
    NSUInteger count = [self length];
    
    int sum = 0;
    int index = 0;
    
    for (index = 0; index < count; index++) {
        unichar charactor = [self characterAtIndex:index];
        if ([charSet characterIsMember: charactor]) {
            sum++;
        }
    }
    
    return sum;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *string = @"I'm your father";
        NSLog(@"%@ has %d vowels", string, [string vowelCount]);
    }
    return 0;
}