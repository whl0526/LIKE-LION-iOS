#import <Foundation/Foundation.h>

// Objective-C에서는 이런 일을 해줄 클래스를 찾는다면서 Delegate라고 표현한다.
// (Delegate: 위임자, 대행자)
@protocol PrintProtocolDelegate
@optional
- (void)processCompleted;
@end

@interface PrintClass : NSObject {
    // 내가 위임자로서 그 일을 하겠다는 데가 있으면 그게 바로 delegate
    // id는 "어떤 Objective-C 객체를 가리키는 포인터"
    id delegate;
}

// 이 클래스가 원하는 일을 대신 해줄 delegate 객체를 지정하는 메서드
- (void)setDelegate:(id)newDelegate;
- (void)printDetails;
@end

@implementation PrintClass

- (void)setDelegate:(id)newDelegate {
    delegate = newDelegate;
}

- (void)printDetails {
    NSLog(@"Print Details");
    
    // deleage 객체가 PrintProtocolDelegate 프로토콜을 잘 따른다면
    // processCompleted 메서드가 있기 때문에 호출 가능하다
    // 더 확실히 하기위해 해당 메서드가 실행가능한지 체크해보는 습관이 좋다.
    if ([delegate respondsToSelector:@selector(processCompleted)]) {
        [delegate processCompleted];
//        [delegate performSelector:@selector(processCompleted)];
    }
}

@end

@interface SampleClass : NSObject<PrintProtocolDelegate>
- (void)startAction;
@end

@implementation SampleClass

- (void)startAction {
    PrintClass *printClass = [[PrintClass alloc] init];
    
    // PrintClass 클래스로 만들어진 printClass 인스턴스 객체에게
    // 내가 너의 delegate가 되어줄께 라고 말해준다.
    // PrintProtocolDelegate 프로토콜을 따라주니까
    // PrintClass 클래스에서 요구하는 delegate 역할을 잘 해줄거라 기대한다.
    [printClass setDelegate:self];
    
    [printClass printDetails];
}

- (void)processCompleted {
    NSLog(@"Printing Process Completed");
}
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SampleClass *sampleClass = [[SampleClass alloc] init];
        [sampleClass startAction];
    }
    return 0;
}