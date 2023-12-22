package com.fpoly.poly121.constant;

import java.util.Arrays;

public enum InvoiceStatus {
    DA_THANH_TOAN(6L),
    CHO_THANH_TOAN(8L),;
    public final Long value;

    InvoiceStatus(Long value) {
        this.value = value;
    }

    public static InvoiceStatus get(long value) {
        return Arrays.stream(InvoiceStatus.values()).filter(s -> s.value == value)
                .findFirst().orElse(null);
    }
}
