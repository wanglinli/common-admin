package com.common.system.util;

public class SafeDouble {

    private static ThreadLocal pi = new ThreadLocal();

    @SuppressWarnings("unchecked")
    public Double pi(String value) {
        pi.set(new Double(value));
        return (Double) pi.get();
    }

}
