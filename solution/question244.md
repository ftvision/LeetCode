---
title: Question 244
category: [Algorithm, Data Structure]
tags: [BFS, Binary Tree]
---

![Description](../Assets/Figure/question244.png)

## Algorithm 

- 这个题目最大的区别在于会多次使用shortest这个函数。
- 我最开始的想法使用Hash表把之前进行过的访问都存起来，将来有需要的话就直接返回值就好了。但是在建立这个hash表的时候遇到了一些困难，主要是不能直接使用`pair<T, R>`当做Hash表的key。
- 但是发现如果直接用Hash表记录每一个单词出现的位置，每次访问的时候直接进行比较也是可以的。主要在于程序中的`while`语句，不能直接写成O(N^2)的。我的结果是借鉴了下面所说的程序的写法，我觉得很棒。
- 当然我最后也没有能够看到时间上有多大的优化。
- [这里](https://discuss.leetcode.com/topic/21300/9-line-o-n-c-solution)程序写的简洁很多。

## Comment

- 这道题目最大的收获是，`unordered_map<>`不能直接用`pair<T, R>`作为key，因为C++并不默认知道如何建立`pair<T, R>`的Hash值。

## Code

```C++
class WordDistance {
public:
    WordDistance(vector<string>& words) {
        int n = words.size();
        for (int i = 0; i != n; i++){
            pos[words[i]].push_back(i);
        }
    }

    int shortest(string word1, string word2) {
        static unordered_map<string, int> Hash;
        string key1 = word1 + " " + word2;
        string key2 = word2 + " " + word1;
        if (Hash.find(key1) != Hash.end()){
            return Hash[key1];
        } else if (Hash.find(key2) != Hash.end()){
            return Hash[key2];
        } else {
            int minDist = INT_MAX, i = 0, j = 0;
            while (i < pos[word1].size() && j < pos[word2].size()){
                minDist = min(minDist, abs(pos[word1][i] - pos[word2][j]));
                pos[word1][i] < pos[word2][j] ? i++ : j++;
            }
            Hash[key1] = minDist;
            Hash[key2] = minDist;
            return minDist;
        }
        
    }
private:
    unordered_map<string, vector<int>> pos;    
};
```

程序代码来自[这里](https://discuss.leetcode.com/topic/21300/9-line-o-n-c-solution)

```C++
class WordDistance {
public:
    WordDistance(vector<string>& words) {
        for(int i=0;i<words.size();i++)
            wordMap[words[i]].push_back(i);
    }
    int shortest(string word1, string word2) {
        int  i=0, j=0, dist = INT_MAX;
        while(i < wordMap[word1].size() && j <wordMap[word2].size()) { 
            dist = min(dist, abs(wordMap[word1][i] - wordMap[word2][j]));
            wordMap[word1][i]<wordMap[word2][j]?i++:j++;
        }
        return dist;
    }
private:
    unordered_map<string, vector<int>> wordMap;
};
```
