---
title: Question 260
category: [Algorithm]
tags: [Busket Sort]
---

![Description](../Assets/Figure/question260.png)

## Algorithm 

- 这道题目方法很巧妙，题解来自于[这里](https://discuss.leetcode.com/topic/21605/accepted-c-java-o-n-time-o-1-space-easy-solution-with-detail-explanations)
- 简单地说就是扫一遍xor以后，因为只有两个数只出现一次，那么结果肯定是这两个数的xor，现在的问题就是如何分解出来。
- 思路非常巧妙，对于`ans1`和`ans2`的xor结果，一定有某一位是1，这一位是只属于其中一个ans的。我们就随意挑选一个为1的位，比如最后一个setbit
- 然后根据这个setbit重新xor扫一遍整个数组，要一个要求：把所有setbit这一位是1的数xor，把所有setbit这一位是0的数xor，这样得到的两个结果就分别是两个答案。
- 这个解法实在是太厉害了，非常有意思。

## Comment

- 找到最后一个setbit: `a & (-a)`

## Code

```c++
class Solution {
public:
    vector<int> singleNumber(vector<int>& nums) {
        int all = 0, setBit = 0, ans1 = 0, ans2 = 0;
        for (int num : nums) all ^= num;
        setBit = all & (-all);
        for (int num : nums){
            if (num & setBit) {
                ans1 ^= num;
            } else {
                ans2 ^= num;
            }
        }
        return vector<int>{ans1, ans2};
    }
};
```