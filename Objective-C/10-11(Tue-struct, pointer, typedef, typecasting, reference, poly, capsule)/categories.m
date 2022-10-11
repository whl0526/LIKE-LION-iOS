#import <Foundation/Foundation.h>

// 카테고리 만들기 예제
@interface NSString(MyAddtions)
+(NSString *)getCopyRightString;    // 저작권자 이름 알려주는 클래스 메서드
-(NSString *)getName;
@end

@implementation NSString(MyAddtions)

+(NSString *)getCopyRightString {
    return @"저작권자 멋쟁이사자처럼 2022";
}

-(NSString *)getName {
    return @"ned";
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%@", [NSString getCopyRightString]);
        
        NSString *temp = [[NSString alloc] init];
        NSLog(@"%@", [temp getName]);
    }
    return 0;
}