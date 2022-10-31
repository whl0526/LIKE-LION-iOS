![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5a3932b3-761b-4d11-b26c-ea6b3fd52068/Untitled.png)

```swift
//
//  ContentView.swift
//  ActivityStar
//
//  Created by 이원형 on 2022/10/27.
//
import SwiftUI

struct Star: Shape {
    // store how many corners the star has, and how smooth/pointed it is
    let corners: Int

    func path(in rect: CGRect) -> Path {
        guard corners >= 2 else { return Path() }

        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)

        var currentAngle = -CGFloat.pi / 2

        let angleAdjustment = .pi * 2 / Double(corners * 2)

        let innerX = center.x * 0.45
        let innerY = center.y * 0.45

        var path = Path()
        path.move(to: CGPoint(x: center.x * cos(currentAngle), y: center.y * sin(currentAngle)))

        var bottomEdge: Double = 0

        for corner in 0..<corners * 2  {
            let sinAngle = sin(currentAngle)
            let cosAngle = cos(currentAngle)
            let bottom: Double

            if corner.isMultiple(of: 2) {
                bottom = center.y * sinAngle
                path.addLine(to: CGPoint(x: center.x * cosAngle, y: bottom))
            } else {
                bottom = innerY * sinAngle
                path.addLine(to: CGPoint(x: innerX * cosAngle, y: bottom))
            }
            if bottom > bottomEdge {
                bottomEdge = bottom
            }
            currentAngle += angleAdjustment
        }
        let unusedSpace = (rect.height / 2 - bottomEdge) / 2
        let transform = CGAffineTransform(translationX: center.x, y: center.y + unusedSpace)
        return path.applying(transform)
    }
}

struct ContentView: View {
    var body: some View {
        Star(corners: 5)
            .frame(width: 200, height: 200)
         

    }
}
```
