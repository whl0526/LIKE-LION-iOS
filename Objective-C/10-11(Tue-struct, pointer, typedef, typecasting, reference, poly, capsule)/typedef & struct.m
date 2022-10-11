#import <Foundation/Foundation.h>

// Person 구조체를 정의해서 타입이름으로 쓰고 싶다면
typedef struct _Person {
    float height;
    int weight;
} Person;

// BMI 계산 함수
float calcBMI(Person person) {
    return person.weight / (person.height * person.height);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //struct _Person person;
        Person person;
        
        person.height = 1.65;
        person.weight = 55;
        
        
        NSLog(@"height : %f", person.height);
        NSLog(@"weight : %d", person.weight);
        NSLog(@"BMI : %f", calcBMI(person));
    }
    return 0;
}