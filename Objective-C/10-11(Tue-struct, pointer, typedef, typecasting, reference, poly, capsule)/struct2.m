//
//  main.m
//  HelloObjC
//
//  Created by 이원형 on 2022/10/11.
//

#import <Foundation/Foundation.h>


struct Books{
    NSString *title;
    NSString *author;
    NSString *subject;
    int bookId;
    
};

@interface SampleClass : NSObject
-(void)printBookinfo:(struct Books)book;
@end

@implementation SampleClass
-(void)printBookinfo:(struct Books)book;{
    NSLog(@"%@", book.title);
    NSLog(@"%@", book.author);
    NSLog(@"%@", book.subject);
    NSLog(@"%d", book.bookId);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        struct Books book1;
       // struct Books book2;
        
        book1.title = @"C언어 프로그래밍";
        book1.author = @"데니스 리치";
        book1.subject = @"c언어 학습 공식도서";
        book1.bookId = 1234567;
        
//        NSLog(@"%@",book1.title);
//        NSLog(@"%@",book1.author);
//        NSLog(@"%@",book1.subject);
//        NSLog(@"%d",book1.bookId);
        
        SampleClass *sampleClass = [[SampleClass alloc]init];
        [sampleClass printBookinfo:book1];
        
        
            }
    return 0;
}