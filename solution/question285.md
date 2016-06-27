---
title: Question 285
category: [Data Structure]
tags: [Binary Search Tree]
---

![Description](../Assets/Figure/question282.png)

## Algorithm 

- 题目很简单，就是从root开始一直走到p，最后一个`node->val > p->val`的就是答案，因为这是inorder的遍历。
- 如果p是某一个子树的左子树，那么这个子树的根（根会先于子树被访问）就是答案。
- 如果p是某一个子树的右子树，那么它的右子树最左边那个就是答案。


## Comment

- C++函数里面改变指针的方法还不是很清楚，一开始准备写个函数来返回把ans作为参数带入并且修改ans的值，但是一直没有成功，后来发现直接递推就好了。

## Code


```c++
class Solution {
public:
    TreeNode* inorderSuccessor(TreeNode* root, TreeNode* p) {
        TreeNode * ans = NULL;
        while (root){
            if (root->val > p->val) {
                ans = root;
                root = root->left;
            } else {
                root = root->right;
            }
        }
        return ans;
    }
};
```