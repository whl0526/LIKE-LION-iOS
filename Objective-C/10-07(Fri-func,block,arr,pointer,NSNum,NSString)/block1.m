#import <Foundation/Foundation.h>

// C언어 스타일의 함수
double multiplyTwoValuesOrgin(double firstValue, double secondValue)
{
    return firstValue * secondValue;
}

// Block으로 다시 위 함수를 써본다면
// Block의 이름은 (^multiplyTwoValues)(double, double)
// Block의 실제 작동내용은 ^{ ... }으로 구현
double (^multiplyTwoValues)(double, double) = ^(double firstValue, double secondValue){
    return firstValue * secondValue;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        double myNum = multiplyTwoValues(2, 4);
        NSLog(@"%f", myNum);
    }
    return 0;
}