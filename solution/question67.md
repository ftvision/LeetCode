---
title: Question 20
category: [Ad hoc]
tags: [Array]
---

![Description](../Assets/Figure/question20.png)

## Algorithm 

- 这个题目主要就是字符串作为数字的加法，本质上和大整数加法是一样的，主要是麻烦在边界条件的判断上。

## Comment

- 用C写的时候还需要重新分配一下内存空间，不然的话在最后要进一位的时候就没法写。
- 但是好像C++的字符串运算更加方便了，虽然我没有用C++写过。
 

## Code

```c
char* addBinary(char* a, char* b) {
  int scan1 = strlen(a) - 1;
  int scan2 = strlen(b) - 1;
  int scan3 = (scan1 > scan2) ? scan1 : scan2;
  int tmp = 0;
  char * ans = strlen(a) > strlen(b) ? a : b;
  for (;scan1>=0 || scan2>=0;scan1--,scan2--,scan3--){
      tmp += (scan1 < 0) ? 0 : a[scan1] - '0';
      tmp += (scan2 < 0) ? 0 : b[scan2] - '0';
      ans[scan3] = (tmp % 2) + '0';
      tmp /= 2;
  }
  if (tmp){ //have one more digit position
      ans = realloc(ans, (strlen(ans) + 2) * sizeof(ans[0]));
      for (scan3 = strlen(ans); scan3 >= 0; scan3--) ans[scan3 + 1] = ans[scan3];
      ans[0] = tmp + '0';
  }
  return ans;
}
```
