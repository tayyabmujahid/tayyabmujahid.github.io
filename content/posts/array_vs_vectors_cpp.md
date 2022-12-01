---
title: "Arrays vs Vectors in C++"
date: 2022-11-30T11:25:30+03:00
tags: ["C++","programming"]
draft: false
---

### **Implementation & Type**

- Vector is a *template class* which present in C++ only and not in C, C++ STL Vector is similar to python`list` , Arrays are built-in langauge construct present in C++ and C.



```c++
#include <iostream>
#include <vector>

using namespace std;

int main(){
    vector<int> g1;
    # adding elements to the vector
    for (int i=1; i <=5;i++){
        g1.push_back(i);
    }
    #Iterating through the vector
    for (auto i=g1.begin();i!=g1.end();++i)
        cout<<*i<<" ";    
    
}
```

- Vectors are implemented as *dynamic arrays* with a *list interface*  Arrays are implemented as statically or dynamically with primitive data-type interface

  ```c++
  using namespace std;
  int main(){
      int array[100]; //static implementation notice the interface is primitive datatype
      int* arr = new int[100] //dynamic implementation
      
  }
  ```

  ### **Size**

- Size of arrays are fixed and vectors are re-sizable i.e. they can grow and shrink as vectors are allocated on heap of memory.

  Allocation memory happens more than what is required by for a vector.

  **size vs capacity in a vector**: 

  `size()` ,`max_size()` and `empty()` deal with the number of elements in a vector but `capacity()` returns the number of members it can hold in memory. If the number of elements exceed this then re-allocation happens this has following implications:

  1. Reallocation invalidates all references, pointers, and iterators for elements of the vector.
  2. Reallocation takes time(see code example)

- Size of arrays cannot be determined if dynamically allocated whereas size of vector can be determined in O(1) time.

- When arrays are passed to a function separate parameter for size is also passed. Vectors maintains variables which keeps track of size of container at all times

  





### References:



https://blog.devgenius.io/10-mistakes-to-avoid-when-using-std-vector-274043ca157c
