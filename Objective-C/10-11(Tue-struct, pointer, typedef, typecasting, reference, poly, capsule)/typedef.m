#import <Foundation/Foundation.h>

/*
struct Books {
    NSString *title;
    NSString *author;
    NSString *subject;
    int bookId;
};

typedef struct Books BOOK;
 
이렇게 나눠서 쓸 걸 한번에 쓰자면...
*/
typedef struct Books {
    NSString *title;
    NSString *author;
    NSString *subject;
    int bookId;
} BOOK;

@interface SampleClass : NSObject
- (void)updateBookInfoTitle:(BOOK)books;
- (void)printBookInfo:(BOOK)books;

- (void)updateBookTitle:(BOOK *)book;
- (void)descriptionBookInfo:(BOOK *)book;
@end

@implementation SampleClass

- (void)updateBookInfoTitle:(BOOK)books {
    books.title = @"Hello World";
}

- (void)printBookInfo:(BOOK)books {
    NSLog(@"%@", books.title);
    NSLog(@"%@", books.author);
    NSLog(@"%@", books.subject);
    NSLog(@"%d", books.bookId);
}

- (void)updateBookTitle:(BOOK *)books {
    books->title = @"Hello Objective-C";
}

- (void)descriptionBookInfo:(BOOK *)books {
    NSLog(@"%@", books->title);
    NSLog(@"%@", books->author);
    NSLog(@"%@", books->subject);
    NSLog(@"%d", books->bookId);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BOOK book1;
        
        book1.title = @"C언어 프로그래밍";
        book1.author = @"데니스 리치";
        book1.subject = @"C언어 학습 공식도서";
        book1.bookId = 1234567;
        
        SampleClass *sampleClass = [[SampleClass alloc] init];
        
        // 값으로 복제시킬 매개변수 - call by value
        [sampleClass updateBookInfoTitle:book1];
        [sampleClass printBookInfo:book1];
        
        // 포인터 참조값으로 알려주고 직접 건드리게 할 매개변수 - call by reference
        [sampleClass updateBookTitle:&book1];
        [sampleClass descriptionBookInfo:&book1];
    }
    return 0;
}