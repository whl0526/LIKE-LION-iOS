#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int sum = 17;
        int count = 5;
        
        // int와 int의 나눗셈이라 int라고 결과를 생각할 수 있음
        NSLog(@"Value of mean : %d", (sum / count));
        
        // 강제로 위 계산 결과를 float값으로 각각 타입캐스팅 변환처리해준다면? 결과는 float 타입이 된다.
        NSLog(@"Value of mean : %f", ((float)sum / (float)count));
    }
    return 0;
}