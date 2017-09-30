---
title: Question 271
category: [Data Structure]
tags: [String]
---

![Description](../Assets/Figure/questio271.png)

## Algorithm

- 这个题目感觉有点小无聊。基本上用Python做的话会比较直接。
- 当然值得注意的是，思路是把某个固有的字符替换为特别的字符escape之后，用这个字符作为分隔符。

## Comment

- 没有什么很特别的

## Code


```python
class Codec:

    def encode(self, strs):
        """Encodes a list of strings to a single string.

        :type strs: List[str]
        :rtype: str
        """
        return ''.join(s.replace(':','\:') + ' : ' for s in strs)

    def decode(self, s):
        """Decodes a single string to a list of strings.

        :type s: str
        :rtype: List[str]
        """
        return [s_i.replace('\:',':') for s_i in s.split(' : ')[:-1]]

# Your Codec object will be instantiated and called as such:
# codec = Codec()
# codec.decode(codec.encode(strs))
```
