import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(UnityPlugin)
public class UnityPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "UnityPlugin"
    public let jsName = "Unity"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "launch", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = Unity()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }

    @objc func launch(_ call: CAPPluginCall) {
        do {
            try implementation.launch()
            call.resolve()
        } catch {
            call.reject("Failed to launch Unity", error)
        }
    }
}
