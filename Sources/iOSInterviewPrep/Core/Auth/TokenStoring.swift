import Foundation

public protocol TokenStoring {
    func get() async -> String?
    func set(_ token: String) async
    func clear() async
}
