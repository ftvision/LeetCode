---
title: Question 31
category: [Algorithm]
tags: [Two pointer]
---

![Description](../Assets/Figure/question31.png)

## Algorithm 

- 我想到的算法结果发现跟[最优算法](https://discuss.leetcode.com/topic/15216/a-simple-algorithm-from-wikipedia-with-c-implementation-can-be-used-in-permutations-and-permutations-ii)是基本一样的，唯一的不同在于有一步我没有想到。
    1. 从后往前找，找到第一个位置`i`满足`nums[i - 1] < nums[i]`，这个时候从`i`往后都是逆序。
    2. 然后在后面的序列中找到第一个满足`nums[j] > nums[i - 1]`的，这个时候`nums[j]`实际上是所有满足条件的数里面最小的。
    3. 交换`nums[j]`和`nums[i - 1]`
    4. 然后`reverse(i -> n - 1)`这个串。
- 我所没有想到的是第四步`reverse`，我直接用了`sort`，但是很明显用`sort`是最差的，因为逆序是最坏情况。其实应该可以想到是`reverse`的，因为考虑到1.和3.我们可以发现交换之后最后这个数组是一个完全逆序的数组。
- 当然，[这里](https://discuss.leetcode.com/topic/19264/1-4-11-lines-c/2)的一些列程序真是让人大开眼界，程序摘录到了最后面。

## Comment

- 这个题目，就差了那么一点点就想到完美解了。
- 另外，牛逼的解法实在是太牛逼了。

## Code

我的算法的解：

```C++
class Solution {
public:
    void nextPermutation(vector<int>& nums) {
        auto start = -1;
        for (int j = nums.size() - 1; j != 0; j--){
            if (nums[j] > nums[j - 1]){
                start = j - 1;
                break;
            }
        }
        printf("%d", start);
        if (start == -1) {
            sort(nums.begin(), nums.end());
        } else {
            for (int j = nums.size() - 1; j != start; j--){
                if (nums[j] > nums[start]){
                    swap(nums[j], nums[start]);
                    sort(nums.begin() + start + 1, nums.end());
                    break;
                }
            }
        }
    }
};
```

以下解法来自[这里](https://discuss.leetcode.com/topic/19264/1-4-11-lines-c)，由StefanPochmann创作，我只是觉得太厉害了，所以摘录在这里作为学习。

- Solution 1

Just for info: There's a library function that does the job, even going from totally reverse sorted to sorted:

```C++
void nextPermutation(vector<int>& nums) {
    next_permutation(begin(nums), end(nums));
}
```

- Solution 2

Using library functions for all building blocks of the algorithm. Very nice how they all play together, notice the total lack of +1/-1, it all fits exactly.

```C++
void nextPermutation(vector<int>& nums) {
    auto i = is_sorted_until(nums.rbegin(), nums.rend());
    if (i != nums.rend())
        swap(*i, *upper_bound(nums.rbegin(), i, *i));
    reverse(nums.rbegin(), i);
}
```

- Solution 3

Doing it all on my own (except swap, let's not be silly):

```C++
void nextPermutation(vector<int>& nums) {
    int i = nums.size() - 1, k = i;
    while (i > 0 && nums[i-1] >= nums[i])
        i--;
    for (int j=i; j<k; j++, k--)
        swap(nums[j], nums[k]);
    if (i > 0) {
        k = i--;
        while (nums[k] <= nums[i])
            k++;
        swap(nums[i], nums[k]);
    }
}
```

Solution 4

Ok, let's be silly after all and not even use swap :-)

```C++
void nextPermutation(vector<int>& nums) {
    int i = nums.size() - 1, k = i, tmp;
    while (i > 0 && nums[i-1] >= nums[i])
        i--;
    for (int j=i; j<k; j++, k--)
        tmp = nums[j], nums[j] = nums[k], nums[k] = tmp;
    if (i > 0) {
        k = i--;
        while (nums[k] <= nums[i])
            k++;
        tmp = nums[i], nums[i] = nums[k], nums[k] = tmp;
    }
}
```