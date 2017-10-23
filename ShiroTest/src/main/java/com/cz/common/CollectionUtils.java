package com.cz.common;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class CollectionUtils {

    public static  <T> Set<T> listToSet(List<T> tLsit){
        Set<T> set =new HashSet<T>();
        for(T st:tLsit){
            set.add(st);
        }
        return set;
    }
}
