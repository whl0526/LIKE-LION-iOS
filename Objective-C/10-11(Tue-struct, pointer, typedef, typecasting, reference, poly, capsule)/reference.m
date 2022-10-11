#import <Foundation/Foundation.h>

// Person 클래스 정의
@interface Person : NSObject {
    NSString *personName;
    NSInteger personAge;
}

- (id)initWithName:(NSString *)name andAge:(NSInteger)age;
- (void)print;
@end

@implementation Person

- (id)initWithName:(NSString *)name andAge:(NSInteger)age {
    self = [super init];
    
    personName = name;
    personAge = age;
    
    return self;
}

- (void)print {
    NSLog(@"Name: %@", personName);
    NSLog(@"Age: %ld", personAge);
}

@end

// Person을 상속받은 Employee 클래스 정의
@interface Employee : Person {
    NSString *employeeEducation;
}

- (id)initWithName:(NSString *)name andAge:(NSInteger)age andEducation:(NSString *)education;
- (void)print;

@end

@implementation Employee

- (id)initWithName:(NSString *)name andAge:(NSInteger)age andEducation:(NSString *)education {
    self = [super initWithName:name andAge:age];
    employeeEducation = education;
    return self;
}

- (void)print {
    [super print];
    NSLog(@"Educaiton: %@", employeeEducation);
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Person *person = [[Person alloc] initWithName:@"Ned" andAge:13];
        [person print];
        
        Employee *employee = [[Employee alloc] initWithName:@"홍길동" andAge:15 andEducation:@"서당"];
        [employee print];
    }
    return 0;
}