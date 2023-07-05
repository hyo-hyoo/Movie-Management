package top.duangboss.dogemovie.util;

import java.util.regex.Pattern;

public class HasChinese {
	public boolean hasChinese(CharSequence content) {
        if (null == content) {
            return false;
        }
        
        String regex = "[\u2E80-\u2EFF\u2F00-\u2FDF\u31C0-\u31EF\u3400-\u4DBF\u4E00-\u9FFF\uF900-\uFAFF\uD840\uDC00-\uD869\uDEDF\uD869\uDF00-\uD86D\uDF3F\uD86D\uDF40-\uD86E\uDC1F\uD86E\uDC20-\uD873\uDEAF\uD87E\uDC00-\uD87E\uDE1F]+";
        
        Pattern pattern = Pattern.compile(regex);
        
        return pattern.matcher(content).find();
    }
}
