#import <Foundation/Foundation.h>

@interface MyNumber: NSObject
- (int)getMaxiumNumberWithFirstNumber:(int)num1 secondNumber:(int)num2;
- (NSString *)getHello;
@end

@implementation MyNumber
- (int)getMaxiumNumberWithFirstNumber:(int)num1 secondNumber:(int)num2 {
    
    int result = num1 > num2 ? num1: num2;
    
    return result; // call by value
}

- (NSString *)getHello {
    NSString *hello = @"Hello World";
    return hello; // call by reference
}
@end

int main (int argc, const char * argv[])
{
    MyNumber *num = [[MyNumber alloc] init];
    int maxNum = [num getMaxiumNumberWithFirstNumber:13 secondNumber:20];
    NSLog(@"%d", maxNum);
    
    NSString *hello = [num getHello];
    NSLog(@"%@", hello);
   return 0;
}