package capacitor.plugin.unity;

import android.content.Intent;
import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "Unity")
public class UnityPlugin extends Plugin {

    private Unity implementation = new Unity();

    @PluginMethod
    public void echo(PluginCall call) {
        String value = call.getString("value");

        JSObject ret = new JSObject();
        ret.put("value", implementation.echo(value));
        call.resolve(ret);
    }

    @PluginMethod
    public void launch(PluginCall call) {
        try {
            // Use reflection to avoid compile-time dependency on Unity classes
            Class<?> unityPlayerGameActivityClass = Class.forName("com.unity3d.player.UnityPlayerGameActivity");
            Intent intent = new Intent(getContext(), unityPlayerGameActivityClass);
            getContext().startActivity(intent);
            call.resolve();
        } catch (ClassNotFoundException e) {
            call.reject("Unity library not found. Please ensure Unity library is properly integrated.", e);
        } catch (Exception e) {
            call.reject("Failed to launch Unity", e);
        }
    }
}
