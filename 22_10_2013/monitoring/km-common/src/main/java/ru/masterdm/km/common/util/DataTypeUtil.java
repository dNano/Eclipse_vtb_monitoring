package ru.masterdm.km.common.util;

/**
 * 
 * @author Alexey Chalov
 */
public final class DataTypeUtil {

    private DataTypeUtil() {
    }

    public static boolean isEmpty(String param) {
        if (param == null || param.trim().length() == 0) {
            return true;
        }
        for (int i = 0; i < param.length(); ++i) {
            if (param.charAt(i) > ' ') {
                return false;
            }
        }
        return true;
    }

    public static boolean stringsEqual(String str1, String str2) {
        return (str1 == null ? "" : str1).equals(str2 == null ? "" : str2);
    }
}