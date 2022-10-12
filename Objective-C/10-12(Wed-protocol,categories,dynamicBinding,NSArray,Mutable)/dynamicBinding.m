#import <Foundation/Foundation.h>

// 정사각형 정보를 담은 클래스
@interface Square : NSObject {
    float area; // 면적 정보를 담은 내부 변수(클래스 밖에서는 접근 불가)
}

- (void)calculateAreaOfSide:(CGFloat)side;  // 네 변의 길이가 같으므로 하나의 길이만 가져와도 면적 계산 가능
- (void)printArea; // 계산된 면적을 출력하는 메서드
@end

@implementation Square

- (void)calculateAreaOfSide:(CGFloat)side {
    area = side * side;
}

- (void)printArea {
    NSLog(@"The area of square is %f", area);
}
@end

// 가로 세로 길이가 별개인 일반적인 직사각형 정보의 클래스
@interface Reactangle : NSObject {
    float area; // 면적 정보를 담은 내부 변수(클래스 밖에서는 접근 불가)
}

- (void)calculateAreaOfLength:(CGFloat)length andBreadth:(CGFloat)breadth;
- (void)printArea; // 계산된 면적을 출력하는 메서드
@end

@implementation Reactangle

- (void)calculateAreaOfLength:(CGFloat)length andBreadth:(CGFloat)breadth {
    area = length * breadth;
}

- (void)printArea {
    NSLog(@"The area of reactangle is %f", area);
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Square *square = [[Square alloc] init];
        [square calculateAreaOfSide:10.0];
//        [square printArea];
        
        Reactangle *reactangle = [[Reactangle alloc] init];
        [reactangle calculateAreaOfLength:10.0 andBreadth:5.0];
//        [reactangle printArea];
        
        // [object printArea] 메소드 실행은
        // 매번 object에 printArea 메소드가 각각 무엇인지 확인하고
        // 해당 매소드로 실행해서, 서로 다른 결과가 나올 수 있다.
        id object = square;
        [object printArea]; // The area of square is 100.000000
        
        object = reactangle;
        [object printArea]; // The area of reactangle is 50.000000
        
        object = square;
        [object printArea]; // The area of reactangle is 50.000000
    }
    return 0;
}