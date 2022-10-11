#import <Foundation/Foundation.h>

@interface Box : NSObject {
    double length;  // 길이
    double breadth; // 폭
    double height;  // 높이
}
//@property(nonatomic, readwrite) double length;
//@property(nonatomic, readwrite) double breadth;
@property(nonatomic, readwrite) double height;

- (double)volume;

@end

@implementation Box

// 선언된 프로퍼티를 가장 쉽게 구현부에서 만들어주는 방법
//@synthesize length;
//@synthesize breadth;
@synthesize height;

// 초기화 처리후 반환될 인스턴스는 id라고 통칭된다.
- (id)init {
    self = [super init];
    self->length = 1.0;
    self->breadth = 1.0;
    return self;
}

- (double)volume {
    return length * breadth * height;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Box *box1 = [[Box alloc] init];
        Box *box2 = [[Box alloc] init];
        
        box1.height = 5.0;
        box2.height = 10.0;
        
        NSLog(@"Volume of Box1 : %f", [box1 volume]);
        NSLog(@"Volume of Box2 : %f", [box2 volume]);
    }
    return 0;
}