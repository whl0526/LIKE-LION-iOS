// 임의로 상황들을 만들어보는 예제
let connectionOK: Bool = true
let connectionSpeed: Double = 40.00
let fileFound: Bool = true
let fileSize: Int = 50

// Error 프로토콜을 따르는 나만의 에러 타입(열거형)
enum FileTransferError: Error {
    // 에러가 갖게 될 상황들을 값으로 정리함
    case noConnection
    case lowBandwidth
    case fileNotFound
    case tooBigSize
}

// 이 함수는 실행중에 오류가 발생할 수 있음
func transferFile() throws {
    // 함수 안에서는 최대한 모든 오류 상황들을 throw로 알려줄 수 있도록 만들어야 한다.
    
    // connectionOK가 false이면 else 구문 실행되고 함수 종료
    guard connectionOK else {
        throw FileTransferError.noConnection
    }
    
    guard connectionSpeed > 30 else {
        throw FileTransferError.lowBandwidth
    }
    
    guard fileFound else {
        throw FileTransferError.fileNotFound
    }
    
    guard fileSize < 20 else {
        throw FileTransferError.tooBigSize
    }
}

// transferFile 함수를 호출하는 응용 코드
// 파일 전송을 "시도"하고 결과를 문자열로 반환해서 안내함
func sendFile() -> String {
    // 오류가 발생할 수 있는 함수를 사용하는 쪽에서는 모든 오류 내용에 대응을 못하더라도 최대한 많이 대응 가능하도록 해줄 필요가 있다.
    
    do {
        try transferFile()
    } catch FileTransferError.noConnection {
        return "No Network Connection"
    } catch FileTransferError.lowBandwidth {
        return "File Transfer Speed too low"
    } catch FileTransferError.fileNotFound {
        return "File not Found"
    } catch let error {
        // 아직 챙기지 못한 오류상황 확인용 함수 내부 출력
        print("error: \(error)")
        return "Unknown error"
    }
    
    return "Successful transfer"
}

print("\(sendFile())")