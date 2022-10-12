#import <Foundation/Foundation.h>

// BMI 계산

@interface Person : NSObject {
    float heightInMeter;
    int weightInKilos;
}
@property(nonatomic, readwrite) float heightInMeter;
@property(nonatomic, readwrite) int weightInKilos;

- (float)bodyMassIndex;
@end

@implementation Person

@synthesize heightInMeter;
@synthesize weightInKilos;

- (float)bodyMassIndex {
    // self는 메소드의 실행 주체가 되는 객체의 포인터다.
    // 객체가 자신에게 메시지를 보내야할 때 이 self가 사용된다.
    float height = [self heightInMeter];
    return [self weightInKilos] / ( height * height);
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [[Person alloc] init];
        person.heightInMeter = 1.5;
        person.weightInKilos = 50;
        NSLog(@"%f", [person bodyMassIndex]);
    }
    return 0;
}