#import <Foundation/Foundation.h>

// Foundation이 제공하는 NSObject를 상속받은 SampleClass는 이러한 내용을 구현합니다.
@interface SampleClass : NSObject
- (NSNumber *)multiplyA:(NSNumber *)a withB:(NSNumber *)b;
@end


// SampleClass의 구체적인 내용은 다음과 같습니다.
@implementation SampleClass

- (NSNumber *)multiplyA:(NSNumber *)a withB:(NSNumber *)b {
    
    // NSNumber 타입으로 받은 a와 b로부터 float 값들을 꺼내서 곱셈한 후
    float number1 = [a floatValue];
    float number2 = [b floatValue];
    float product = number1 * number2;
    
    // 결과를 NSNumber로 다시 만들어 반환한다.
    NSNumber *result = [NSNumber numberWithFloat:product];
    return result;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, World!");
        
        // swift였다면 ... var sampleClass: SampleClass = SampleClass()
        SampleClass *sampleClass = [[SampleClass alloc] init];
        
        NSNumber *a = [NSNumber numberWithFloat:10.5];
        NSNumber *b = [NSNumber numberWithFloat:10.0];
        NSNumber *result = [sampleClass multiplyA:a withB:b];
        
        // 결과의 NSNumber로부터 NSString를 만들어 활용한다.
        NSString *resultString = [result stringValue];
        NSLog(@"The product is %@", resultString);
    }
    return 0;
}