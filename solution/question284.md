---
title: Question 284
category: [Algorithm]
tags: [Design]
---

![Description](../Assets/Figure/question284.png)

## Algorithm 

- 这个题目是C++语言的设计题目，是我最薄弱的地方，因为我对于C++不是很熟悉。
- [这里](https://discuss.leetcode.com/topic/24909/simple-c-solution-1-line-per-method-without-extra-member-variables/19)有一个解是关于使用copy constructor的性质，而且讨论了很多关于copy constructor的操作，但是我觉得不太能看得懂。值得好好钻研
- [这里](https://discuss.leetcode.com/topic/24857/10-line-c-and-14-line-java-implementation)是另外一个比较长一点的版本，但是还是不太能看懂。
- [这里](https://discuss.leetcode.com/topic/25875/another-c-solution-with-one-line-in-peek-and-hasnext-ac)这个版本是我能看懂的。

## Comment

- C++语言相关的问题还要好好学习

## Code

```C++
class PeekingIterator : public Iterator {
private:
    int m_next;
    bool m_hasnext;
public:
    PeekingIterator(const vector<int>& nums) : Iterator(nums) {
        m_hasnext = Iterator::hasNext();
        if (m_hasnext) m_next = Iterator::next();
    }

    int peek() {
        return m_next;
    }

    int next() {
        int t = m_next;
        m_hasnext = Iterator::hasNext();
        if (m_hasnext) m_next = Iterator::next();
        return t;
    }

    bool hasNext() const {
        return m_hasnext;
    }
};
```
