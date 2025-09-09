package capacitor.plugin.unity;

import com.getcapacitor.Logger;

public class Unity {

    public String echo(String value) {
        Logger.info("Echo", value);
        return value;
    }
}
