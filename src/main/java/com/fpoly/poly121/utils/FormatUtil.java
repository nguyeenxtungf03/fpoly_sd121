package com.fpoly.poly121.utils;

import java.text.NumberFormat;
import java.util.Locale;

public class FormatUtil {
    public static String formatVND(Long amount) {
        Locale locale = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);
        return currencyFormatter.format(amount);
    }
}
