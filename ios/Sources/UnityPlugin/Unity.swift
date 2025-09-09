import Foundation

@objc public class Unity: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
