package com.gs.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Created by Administrator on 2017/12/1.
 */
public class CollectionUtils {

    public static <T> List<T> setToList(Set<T> set) {
        List<T> list = new ArrayList<>();
        list.addAll(set);
        return list;
    }
}
