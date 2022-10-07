#import <Foundation/Foundation.h>

@interface SampleClass : NSObject
- (void)sayHello;
@end

@implementation SampleClass
- (void)sayHello {
    NSLog(@"Hello World");
}
@end

int main(int argc, const char * argv[]) {
    // 포인터 정보 = 해당 데이터의 메모리 주소 + 메모리를 차지하는 크기
    // 토지대장 = 주소지(경상북도 울릉군...) + 몇 평수 정보(임야 13평)

    int age = 17;
    
    // 변수 age의 주소를 확인해서, int 타입이 담길 거라고 생각하는 포인터 변수 만들기
    int *infoOfAge = &age;
    
    NSLog(@"age는 %p 주소에 위치했습니다.", infoOfAge);
    // age는 0x16fdff3ac 주소에 위치했습니다.
    
    NSLog(@"int 타입의 메모리 크기는 %zu 바이트입니다.", sizeof(int));
    // int 타입의 메모리 크기는 4 바이트입니다.
    NSLog(@"변수 age의 메모리 크기는 %zu 바이트입니다.", sizeof(age));
    // 변수 age의 메모리 크기는 4 바이트입니다.
    NSLog(@"처음 %p 주소에 가보니 %d 값이 들어있습니다.", infoOfAge, *infoOfAge);
    // 처음 0x16fdff3ac 주소에 가보니 17 값이 들어있습니다.
    
    *infoOfAge = 32;
    NSLog(@"다시 %p 주소에 가보니 %d 값이 들어있습니다.", infoOfAge, *infoOfAge);
    // 다시 0x16fdff3ac 주소에 가보니 32 값이 들어있습니다.
    
    NSLog(@"int를 담은 데이터의 포인터정보 크기는 %zu 바이트입니다.", sizeof(int *));
    // int를 담은 데이터의 포인터정보 크기는 8 바이트입니다.
    NSLog(@"%p를 가르키는 정보의 메모리 크기는 %zu 바이트입니다.", infoOfAge, sizeof(infoOfAge));
    // 0x16fdff3ac를 가르키는 정보의 메모리 크기는 8 바이트입니다.
    
    
    // SampleClass의 인스턴스를 만들어서
    // 그 메모리의 위치 정보를 SampleClass클래스에 맞춘 포인터 변수 sampleClass에 할당한다
    // 클래스에 의해 만들어지는 인스턴스는 무조건 포인터 단위로 관리해야만 활용 가능하다.
    SampleClass *sampleClass = [[SampleClass alloc] init];
    
    // sampleClass 포인터 정보가 가르키는 인스턴스 데이터를 찾아가서
    // 데이터에 명시된 sayHello 메소드를 실행하라
    [sampleClass sayHello];
    
    
    return 0;
}