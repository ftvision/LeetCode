---
title: Question 380
category: [Data Structure]
tags: [Hash Table, List]
---

![Description](../Assets/Figure/questio380.png)

## Algorithm

- 这个题目还是有点意思的。
- 首先，对于`delete`和`insert`，有很多数据结构都可以完成O(1)的时间复杂度，比如`dict`或者`set`，但是`getRandom`这个操作就比较难了
- 如果所有的数据都存到`dict`里面，`getRandom`这一步会需要iterate整个`dict`，这样的时间是O(n)的
- 所以方法是
  - 再维护一个list，这个list是所有在`set`里面的数
  - 在`insert`的时候，更新这个list，并且记录更新的`val`在list里面的位置
  - 在`delete`的时候，这里很有意思：把当前list最后一个值移动到需要删除的`val`的位置上，然后更新对应那个值在list中的位置，然后把list最后一个元素删掉，同时把需要删除的`val`的位置也删掉。
  - 一个元素在list中的位置通过`dict`来维护，位置的添加、删除都是O(1)的，元素在list中的修改和删除也是O(1)的，虽然从list中选取一个数，也是O(1)的。所以所有操作都是O(1)的
  - 所有O(1)都是平均情况
  
## Comment

- [Python Time Complexity](https://wiki.python.org/moin/TimeComplexity)

## Code


```python
import random
class RandomizedSet(object):

    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.nums = []
        self.pos = dict()

    def insert(self, val):
        """
        Inserts a value to the set. Returns true if the set did not already contain the specified element.
        :type val: int
        :rtype: bool
        """
        if val in self.pos:
            return False
        else:
            self.nums.append(val)
            self.pos[val] = len(self.nums) - 1
            return True

    def remove(self, val):
        """
        Removes a value from the set. Returns true if the set contained the specified element.
        :type val: int
        :rtype: bool
        """
        if val in self.pos:
            self.nums[self.pos[val]] = self.nums[-1]
            self.pos[self.nums[-1]] = self.pos[val]
            self.nums.pop()
            del self.pos[val]
            return True
        else:
            return False

    def getRandom(self):
        """
        Get a random element from the set.
        :rtype: int
        """
        return random.choice(self.nums)


# Your RandomizedSet object will be instantiated and called as such:
# obj = RandomizedSet()
# param_1 = obj.insert(val)
# param_2 = obj.remove(val)
# param_3 = obj.getRandom()
```
