//
//  main.m
//  Algorithm
//
//  Created by 花 晨 on 13-3-13.
//  Copyright (c) 2013年 花 晨. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <math.h>
#include <stdio.h>
void PRINTF_ARRAY (int *A,int n){
    for (int i = 0; i<n; i++) {
        printf("%d\n",A[i]);
        
    }
    
}

#pragma mark-- 插入排序
//降序
//void INSERTION_SORT (int *A,int n ){
//    for (int j = 1; j<n; j++) {
//        int key = A[j];
//        int i = j-1;
//        while (i>=0&&key>A[i]) {
//            A[i+1] = A[i];
//            A[i] = key;
//            i--;
//        }
//    }
//}


//递归法
void INSERTION (int *A,int n,int l){
    int key = l;
    int j = n-1;
    while (j>=0&&key<A[j]) {
        A[j+1]=A[j];
        j--;
    }
    A[j+1]=key;
}

void INSERTION_SORT (int *A,int n ){
    if (n>1) {
        n--;
        INSERTION_SORT(A, n);
        INSERTION(A,n+1,A[n+1]);
    }
}

#pragma mark-- 分治法排序
void MERGE(int *A,int p,int q,int r){
    int n = q-p+1;
    int m = r-q;
    
    int L[n];
    for (int i = 0; i<n ; i++) {
        L[i]=A[p+i];
    }
    int R[m];
    for (int j = 0; j<m; j++) {
        R[j]=A[q+1+j];
    }
    
    int i = 0;
    int j = 0;
    for (int k = p; k<=r; k++) {
        if (i>=n) {
            A[k]=R[j++];
            continue;
        }
        else if (j>=m) {
            A[k]=L[i++];
            continue;
        }
        
        if (L[i]<=R[j]) {
            A[k]=L[i++];
        }
        else{
            A[k]=R[j++];
        }
    }
    
}

void MERGE_SORT(int *A,int p,int r){
    if(p<r){
        int q = ((p+r)/2);
        MERGE_SORT(A, p, q);
        MERGE_SORT(A, q+1, r);
        MERGE(A, p, q, r);
    }
}
#pragma mark--冒泡排序

void BUBBLESORT(int *A,int n){
    for (int i = 0; i<n; i++) {
        for (int j = n-1; j>i; j--) {
            if (A[j]<A[j-1]) {
                int key = A[j];
                A[j]=A[j-1];
                A[j-1]=key;
            
            }
        }
    }
}

#pragma mark--二分法查找

int BINARY_SEARCH(int *A,int p,int r,int k){
    if (k<A[p ]||k>A[r]) {
        return -1;
    }
    
    
    int q=(p+r)/2;
    if (A[q]==k) {
        return q;
    }
    else {
        if (k<A[q]) {
            r=q;
        }
        else{
            p=q;
        }
        if (r-p ==1) {
            if (A[r]==k) {
                return r;
            }
            else{
                return -1;
            }
        }
        return BINARY_SEARCH(A, p, r , k);
    }
    
}


#pragma mark--main

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        //        int A[9]={6,9,11,16,1,7,10,13,15};
        //        MERGE(A, 0, 3, 8);
        int A[20]={1,5,13,245,2,4,8,21,3,6,35,346,56,24,678,24,563,784,987,43,};
        //        MERGE_SORT(A, 0, 19);
        //        INSERTION_SORT(A,20);
        //        PRINTF_ARRAY(A, 20);
        
        //        printf("%d",BINARY_SEARCH(A, 678));
        int B[10] = {1,2,3,4,5,6,7,8,9,10};
        BINARY_SEARCH(B , 0, 9, 5);
        printf("%d",BINARY_SEARCH(B,0,9 ,11));
        
        //        BUBBLESORT(A, 20);
        //        PRINTF_ARRAY(A, 20);
        
    }
    return 0;
}


