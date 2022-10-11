#import <Foundation/Foundation.h>

struct Books {
    NSString *title;
    NSString *author;
    NSString *subject;
    int bookId;
};

@interface SampleClass : NSObject
- (void)updateBookInfoTitle:(struct Books)books;
- (void)printBookInfo:(struct Books)books;

- (void)updateBookTitle:(struct Books *)book;
- (void)descriptionBookInfo:(struct Books *)book;
@end

@implementation SampleClass

- (void)updateBookInfoTitle:(struct Books)books {
    books.title = @"Hello World";
}

- (void)printBookInfo:(struct Books)books {
    NSLog(@"%@", books.title);
    NSLog(@"%@", books.author);
    NSLog(@"%@", books.subject);
    NSLog(@"%d", books.bookId);
}

- (void)updateBookTitle:(struct Books *)books {
    books->title = @"Hello Objective-C";
}

- (void)descriptionBookInfo:(struct Books *)books {
    NSLog(@"%@", books->title);
    NSLog(@"%@", books->author);
    NSLog(@"%@", books->subject);
    NSLog(@"%d", books->bookId);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        struct Books book1;
        
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