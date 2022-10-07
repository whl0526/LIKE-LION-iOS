#import <Foundation/Foundation.h>

@interface MyNumber: NSObject
- (int)getMaxiumNumberWithFirstNumber:(int)num1 secondNumber:(int)num2;
@end

@implementation MyNumber
- (int)getMaxiumNumberWithFirstNumber:(int)num1 secondNumber:(int)num2 {
    
    int result;
    
    if (num1 > num2) {
        result = num1;
    } else {
        result = num2;
    }
    
    return result;
}
@end

int main (int argc, const char * argv[])
{
    MyNumber *num = [[MyNumber alloc] init];
    int maxNum = [num getMaxiumNumberWithFirstNumber:13 secondNumber:10];
    printf("%d", maxNum);
   return 0;
}