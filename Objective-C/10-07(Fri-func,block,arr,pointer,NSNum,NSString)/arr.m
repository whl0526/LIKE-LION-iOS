#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int myArray[10];    // 10개의 int값이 들어갈 배열 선언
        int i, j;           // for 반복문에 활용
        
        for (i = 0; i < 10; i++) { // i는 0..<10 구간으로 증가하며 반복
            myArray[i] = i + 100;
        }
        
        for (j = 0; j < 10; j++) {
            NSLog(@"Element[%d] = %d\n", j, myArray[j]);
        }
        
    }
    return 0;
}