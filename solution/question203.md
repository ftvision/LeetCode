---
title: Question 203
category: [Data Structure]
tags: [Linked List]
---

![Description](../Assets/Figure/question203.png)

## Algorithm 

- 这个题目也没什么特别的，就是在实现的时候，要不就是用pointer注意记录一下前后之类的，要不就是用pointer to pointer
- 我个人认为c++中的pointer to pointer这个技术是解决Linked List删除的最好方法，但是唯一的问题是这个方法不好写，经常写错。

## Comment

- C++的`for`循环有一个问题，就是有可能至少执行一次循环，哪怕在中间的判断条件不是完全满足的时候。
- C++的`for`循环的执行条件和执行次数，这个问题已经干扰了我很多次边界条件的处理了，每一次都是我认为`for`循环不会执行某个判断，但是每一次for循环都在边界条件的时候执行了循环内部的一个判断，非常不爽。
- 这个程序值得反复思考一下，因为很难一次写对。反正我是没有一次写对过。

## Code

```c++
class Solution {
public:
    ListNode* removeElements(ListNode* head, int val) {
        ListNode ** pointer = &head;
        while (*pointer != NULL){
            if ((*pointer)->val == val){
               while (*pointer != NULL && (*pointer)->val == val)
                *pointer = (*pointer)->next;
            } else {
                pointer = &(*pointer)->next;
            }
        }
        return head;
    }
};
```