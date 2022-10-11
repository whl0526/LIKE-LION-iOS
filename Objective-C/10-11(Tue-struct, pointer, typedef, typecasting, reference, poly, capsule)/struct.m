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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        struct Books book1;
        struct Books book2;
        
        book1.title = @"C언어 프로그래밍";
        book1.author = @"데니스 리치";
        book1.subject = @"c언어 학습 공식도서";
        book1.bookId = 1234567;
        
        NSLog(@"%@",book1.title);
        NSLog(@"%@",book1.author);
        NSLog(@"%@",book1.subject);
        NSLog(@"%@",book1.bookId);
        
        
        
        
            }
    return 0;
}