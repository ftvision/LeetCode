Leetcode

#1 Two Sum
1. O(n^2)的算法，对于每一个数值，刷一遍后面的数，看看是否存在加起来等于结果的。
2. 用Hash Table，每次读入一个值，就把(target - x)这个值和它的位置存到hash表里面，然后对于每一个新值都先check一遍hash表里面有没有，如果存在，就找到了，如果不存在，就加入(target-x)。这个意外的很快啊，如果认为系统实现Hash Table是O(1)的话，这个就是O(N)的算法了
3. O(NlogN)的算法：排序+二分，先用快速排序一遍，然后对每一个值，进行二分查找是否存在对应的值存在，如果找到了就得到了问题的解，之后只需要把原始index找到就好了

#2 Add Two Numbers
这个题目，姑且算作是练习链表的操作吧。

#3 Longest Substring Without Repeating Characters
因为要是连续的最长字串，所以直接用了一个hashtable来记录哪些出现过哪些没有出现过，如果hashtable的时间为O(1)，那么整个时间复杂度是O(N)的。思路就是每一次加入一个新的元素，然后检查新的元素是否出现在当前的substring中，如果出现了，那么就把这个substring逐渐从头开始cut，直到与最后一个元素相同的那个元素被cut，然后看看留下来的长度是不是比最大值更大。


#6 ZigZag Conversion
这个题目主要是要搞清楚题目意思。之前明显是理解错了，直到看到解释
A  C
| /
B
这样子才是ZigZag，才知道原来是先竖直往下走，然后再斜着往上走，再竖直往下走。这样的话，只需要模拟这个位置就好了。

#7 Reverse Integer
这个主要是要注意overflow的问题。只需要check是不是当前ans超过了214748364，如果超过了，那么ans * 10必定越界；如果没有超过，由于原数不会overflow，所以当ans=214748364的时候，原来的那个数字最高以为只可能是0或者1

#9 Palindrome Number
这个题目其实还蛮奇怪的。一来是所有负数都不是回文数，这个倒是可以理解；二来是很多人在讨论overflow的问题。如果一个数自己是回文数，那么从左往右看和从右往左看都应该是一样的。如果overflow了这个数reverse之后的表达总是会和原来数值的表达相差一些。当然，倒是可以specific构造一个点使得在MAXLONGINT的条件下不是回文数，栈溢出，且溢出后的结果等于原来的数值。——不过好像ruby能表征的数字非常之大，以至于没有溢出的问题……

#12 Integer to Roman
这个比13题麻烦一些，我写了13的判断语句。看了一下论坛基本上也就是用同样的方法，或者就是打表，按照千、百、十、个分别表示出来。总之没有特别精妙简洁的算法。主要是1000，900，500，400，100，90，50，40，10，9，5，4，1这几个cut会有不一样的表征，需要区分对待

#13 Roman to Integer
这个就是很简单的模拟题，主要是减法部分有点麻烦，其他还好。现在的策略就是看前一个字符（比如I）所表示的数值是不是比当前字符（比如V）要小。如果是的话，那就是减法。否则就是加法了。

#15 3Sum
1. O(n^3) Brute Force，直接枚举，枚举前两个数，然后scan剩下的数中有没有可以跟这两个数总和为0的

2. O(n^2logn) 排序，然后枚举前两个数，二分查找第三个数是否存在 

3. O(n^2) Hash table，枚举前两个数，然后直接用hash查找第三个数是否存在。Hash table只需要计数某一个值的出现次数。如果1出现3次，那么hash[1]=3, 在枚举前两个值的时候，对应的hash值先减少，比如两个值是1,1，那么这个时候hash[1]=1。
3.1. 优化方法可以是iterate hash的值，而不是iterate整个数组，那么如果数组里面的值重复的很多的话，整个时间复杂度会是O(n^2)以下。

#17 Letter Combinations of a Phone Number 
这个dfs或者bfs都可以了。就是一个简单地搜索枚举结果

#21 Merge Two Sorted Lists
链表的简单操作，应该要用python写一下，ruby总是还是写成了array才行，很奇怪。而且关于short circuit的and和or，在ruby里面用英文的and和or是短路逻辑，用&&和||是非短路逻辑，用&和|是位操作。

#22 Generate Parentheses
这个本质上是一个catalan数，但是问题是需要把所有的结果都打印出来。思路可以按照另一个题目的二叉树的个数的方法算。f[n] = (f[i]) * f[j]，这里f[i]指的是长度为i的所有解，“*”运算符是个数组每一个元素都进行一次串联。
"(" F[0] ")" * F[2]
"(" + F[1] + ")" * F[1]
"(" F[2] ")" * F[0]
[这个解也很不错，就是通过push括号来平衡](https://leetcode.com/discuss/14436/concise-recursive-c-solution)

#24 Swap Nodes in Pairs
用两个指针walker & runner分别指接续的两个，然后做好tmp = runner.next, walker.next = tmp, runner.next = walker这样就可以把walker和runner调换顺序。但是问题是walker之前的上一个结点需要现在指向runner。我觉得比较干净的方法是首先用一个dummy node使得dummy.next = head，这样的话可以把程序写的很干净，只要保留last.next = walker，然后在walker和runner转换以后，last.next = runner来更新指向就好了。然后last再跳转到walker
[这个python程序简直太简略了](https://leetcode.com/discuss/20653/my-accepted-solution-in-python-quite-fast)

#27 Remove Element
这个题目很直接也很容易，如果当前值不是val，那就加入进队列就好了，否则就不加人

#35 Search Insert Position	
非常简单的binary search，只是要注意一下如果没找到的时候，要返回哪个值

#38 Count and Say 
这个就是很基础的字符串模拟

#50 Pow(x, n)	
这个主要的思路就是二分power，2^4 = (2^2)^2，这样就是O(logN)的时间复杂度了。另外要注意的是这里n可以是负数——这一点是我想得不仔细，没有好好想到这里其实可以是负数。题目只说明了n是整数，没有说一定是positive

#53 Maximum Subarray
1. O(N^2) F[i]表示以i结尾的最大和子串 F[i] = max(A[i], F[j] + Sum(A[j+1]...A[i])) 其中这个部分和可以用累积和直接计算 Sum(A[j+1] ... A[i]) = CumSum(i) - CumSum(j)
2. O(N) 用部分和的思路来看就是找到 i < j, CumSum(j) - CumSum(i) 最大。 minimal[i]表示截止到i的cumsum最小的值是多少，minimal[i] = min(minimal[i-1], cumsum[i])
	然后找到cumsum[i] - minimal[i-1]的最大值。当然，这其实可以用O(1)的空间复杂度

#54 Spiral Matrix
这个跟59题本质上是一样的。简单地说就是按照四个方向走，右、下、左、上，然后再右、下、左、上。关键是每一次要走多远。每次走完就就相对的方向长度减一就好了。代码里面有。

#59 Spiral Matrix II
这个题目本身不是很难，就是模拟就好了，一个方向跟着走，走不动了就换一个方向就好。但是ruby建立2D数组太难搞了。[About的文章里面介绍了是什么情况](http://ruby.about.com/od/Writing-a-2048-Clone-in-Ruby/fl/Two-Dimensional-Arrays-in-Ruby.htm) 要建立一个不会互相影响的2D数组还是不容易的。可能用Python的话好一点

#69 sqrt(x)
1. 二分答案直接算
1.1 可以直接二分答案
1.2 可以用bitmap来算，就是从高位到低位，试探某一位如果是1，那么对应的数值会不会超了，没有超的话这一位设定为1，否则设定为0，继续看下一位。[bitmap解法](https://leetcode.com/discuss/8897/share-my-o-log-n-solution-using-bit-manipulation)
2. 牛顿迭代算法直接算【这个算法需要实现以下】

#62 Unique Paths
1. 标准DP，F[i,j] = F[i-1,j] + F[i, j-1]，如果用两个数组交替更新的话，那么空间复杂度可以是O(N)
2. 当然其实也就是找pascal triangle里面那个正确的位置，也就是C(m-1, m + n - 2)，不过因为n, m会到100，有可能直接算阶乘的话数据很大，所以不如直接用n*m的递推，但是至少空间复杂度可以降到O(N)。
2.2 当然也可以直接做计算阶乘，但是分子分母要记得同时计算。或者用浮点运算强行计算

#64 Minimum Path Sum
标准的DP，F[i,j]表示从起点到位置[i,j]的最小和路径。F[i,j] = min(F[i-1,j], F[i,j-1]) + grid[i,j]
由于F[i,j]只和F[i-1,j], F[i,j-1]有关，所以实现的时候可以用一维数组直接存结果，而不需要用二维数组。

#66 Plus One
非常简单的大整数加法，唯一要明确的是最后一位在右边，最高位在左边。总感觉代码写的不是非常干净，有点遗憾。

#70 Climbing Stairs
这个就是一个简单的计数问题。0,1,2级台阶答案分别是0,1,2，然后f[n]表示n级台阶的解，f[n] = f[n-1] + f[n-2]，就是相当于固定第一次到底是跨1级还是跨2级。也可以说是动态规划吧

#75 Sort Colors
1. two pass解就是直接统计0，1，2分别有多少个，然后根据个数直接重新将nums赋值
2. one pass解 --- 讨论版有很不错的，我还得想想。我觉得我基本上是理解了

#78 Subsets
很简单的枚举题。可以使用DFS来做。在nums.lenght不是很长的情况下也可以直接用2进制来做，二进制的每一位就表示对应数组对置的元素要不要存在于当前的集合中。

#83 Remove Duplicates from Sorted List
基础的链表操作，ruby的测试程序怪怪的，答案输出竟然是一个array

#89 Gray Code 
这里差不多是找规律了。我之前应该是学过这个。简单地说如果当n=2时知道了序列，来推导n=3的话，就是先把n=2的结果倒序排一遍，然后在前四个数第一个多放一个0，后四个数第一位多放一个1.
[0] 0 0
[0] 0 1
[0] 1 1
[0] 1 0
-------
[1] 1 0
[1] 1 1
[1] 0 1
[1] 0 0
这样就每一个组内部，任意两个数之间只有一位差（因为n=2的时候已经确保了这个关系），在两组之间，只有第一位有差别。所以就得到了这个序列。其实n=1推导n=2也是一样的。 

#96 Unique Binary Search Trees
这个就是简单地叠加就好了f[0] = 1, f[i] = sum(f[x] * f[i-x-1])。有人在讨论里面指出来这就是catalan数，好久没有见面了，好亲切。

#98 Validate Binary Search Tree
基本的二叉树操作，只是要记得记录以当前结点为根的子树的最大值和最小值。然后比较左子树的最大值是否小于root.val，右子树的最小值是不是大于root.val。唯一要注意的是更新当前的最大值、最小值的时候要注意边界情况，即某半边子树是nil的情况
【需要写一个非递归版本】

#100 Same Tree
基本的二叉树操作，【需要写一个非递归版本】

#101 Symmetric Tree
基本的二叉树操作，其实是比较两个树，如果两个数的根的值相同，且A的左子树与B的右子树是镜像；A的右子树与B的左子树镜像，那么A与B就是镜像相等的。然后就是看check(root,root)是不是true就好，【需要写一个非递归版本】

#102 Binary Tree Level Order Traversal
二叉树BFS，总觉得代码写的很丑啊

#103 Binary Tree Zigzag Level Order Traversal
二叉树BFS，不过每一层都用stack来存，而不是用简单的array。所以在增广下一层的时候，从栈首开始。总觉得代码写的很丑啊

#104 Maximum Depth of Binary Tree
基本的二叉树操作，【需要写一个非递归版本】

#107 Binary Tree Level Order Traversal II
不是很明白为什么要有这道题目，这道题目跟102简直就是一个事情，只是在添加答案的时候要注意一下罢了。用Ruby就可以直接把102的答案用ans.reverse搞定，根本不需要改其他任何内容。如果实在是要说的话，那就是用堆栈或者用链表来储存每一层的结果好了，这样更新结果的时间复杂度是O(1)

#108 Convert Sorted Array to Binary Search Tree
这个就是简单的二分，因为已经是排序好了的数组，只需要把数组中间位置设为根，然后左边一般数组建立一个二叉树作为左子树，右边一般数组建立一个二叉树作为右子树就好。算是分治算法吧。【需要写一个非递归版本】

#111 Minimum Depth of Binary Tree
这道题最重要的是depth的定义是根到叶子的距离。所以，如果某一个结点不是叶子，不能计算，这就要讨论当前的结点的情况：左右子树都有，只有左子树，只有右子树，左右子树都没有（这就是叶子，深度为1）。

#116 Populating Next Right Pointers in Each Node
1.这个可以直接用BFS就好。一层一层地计算，每一层把所有的node都展开，然后从左到右依次链接起来。然后再根据当前层把下一层扩展出来，直到全都是叶子结点。时间O(N)，空间也O(N)
1.1 但是这个题目有空间复杂度为O(1)的算法！讨论里面的帖子写的非常非常的漂亮，主要的提示就是需要使用已经建立起来的next的结果

#118 Pascal's Triangle
这个很简单，就是类似119一样，用一个数组更新当前这一行的内容就好了

#119 Pascal's Triangle II 
这个还是很简单的，就是从第0行只有一个1开始，每次从后往前使用f[i] = f[i] + f[i-1]就可以把累加值更新了。
iter 0: f = [1]
iter 1: f = [1, 0], backward f[1] = f[1] + f[0] = 1 ==> f = [1,1]
iter 2: f = [1, 1, 0], backward f[2] = f[2] + f[1] = 1; f[1] = f[1] + f[0] = 2 ==> f = [1,2,1]
这样的话每一次新增一个单元，空间复杂度为O(k)

#121 Best Time to Buy and Sell Stock 
这个题目很简单啊，就是找到股价最低的那天买入，最高的那天卖出就好了。用min来记录股价的最低值。对于第i天来说，首先看，如果这一天卖出，收益是不是当前最大；然后，如果股价小于min，那么min就更新为当前的股价（今后哪天要卖出就是今天这个价买入）

#122 Best Time to Buy and Sell Stock II 
这个题目说的超级不清楚，最后大概的意思是你知道股价，然后如果只买一股，可以随时交易，得到的最大值。基本上策略就是如果第二天比当前涨了，那就当天买第二天卖，赚差价；如果第二天跌了，那么今天就卖掉，第二天不买。所以归根究底就是看连续两天的变化，如果涨了就买，跌了就不买。

#124 Binary Tree Maximum Path Sum
这个按照道理来说应该算是分治了（后序遍历）。主要是要三种情况，a)最大值在左子树；b)最大值在右子树；c)最大值是一条经过根的路径。为了找到这条经过根的路径，就需要记录另外一个值：以根为终点的single path的最大值。所以就是
max = max(left, right, cross_path)
cross_path = max(single_left, 0) + max(single_right,0) + val
single(Root) = max(max(single_left, 0), max(single_right, 0)) + val
 
#136 Single Number
1. 用hash table。第一遍，每一个值看看是否在hash table中，如果不在就加入hash table，如果已经在Hash table中就把这个元素删掉。然后最后看Hash table里面那个key的值是多少。O(N) -- 因为scan一遍数组
2.2. 用hash table也可以每一个key值都计数，但是这样的话最后要扫一遍hash table，时间复杂度有点高。

2. 用xor，将所有值做一遍xor，最后留下来的那个就是唯一值。O(N)

3. 逐位取得bit：第一遍，把所有数值加起来，除以2取余数，这样就知道single number最后一位二进制是1/0，然后所有数值右移一位(除以2)；第二遍，所有数值加起来，除以2取余数，这样就直到single number倒数第二位二进制是1/0，然后所有数值右移一位（除以2)；这么做直到所有数值加起来的和为0的时候，说明位数完整了。再把每一位得到的数值组合起来，就可以得到原来的数值了。这样就是做constant次scan array，加起来还是O(N)的。但是这里的问题是负数比较难处理；我能想到的就是把正数和负数分开出来

#137 Single Number II

# 141 Linked List Cycle
1. O(N^2)的算法很好想，一个first在前面跑，一个second在后面遍历，如果first.next == second的情况出现，那就是有环。但是超时了
2. 如果link的值可以修改，有一种很暴力的O(N)的算法，每一次visit的结点设置node.val = None，如果某一次遇到的结点的val是None，那么说明这个结点曾经走过，那么有环
3. 讨论版里面提供的非常优美的O(N)的算法是用两个指针，一个walker，一个runner，walker每一次前进一步，runner每一次前进两步，如果有环的话，runner最终会追上walker，这个很厉害


*** 如果这个题目是在一个数组里面找出最长的cycle回文数，那就是以下的两种想法
0. 暴力枚举回文串的长度，然后一个一个核对是不是存在长度为i的回文串，检查是否有长度为i的回文串也有很多种写法。
1. F[i,j]表示从i位置到j位置的最长回文串。如果a[i] === a[j]且f[i+1,j-1]等于j-1 - (i+1) + 1，也就是说f[i+1,j-1]这一段是一个完整的回文数，那么f[i,j] = f[i-1,j+1] + 2; 否则如果a[i] == a[j-1] 且 f[i+1,j-2]是完整的，那么就是F[i+1,j-2]+2；类似的如果a[i+1] = a[j] 且a[i+2,j-1]是完整的回文数，那么f[i,j] = f[i+2,j-1] + 2；否则f[i,j] = max(f[i+1, j-1], f[i,j-1], f[i+1,j])，这样时间空间都是O(N^2)的
2. 是否存在空间是O(N)的方法呢，的确有[线性算法](http://taop.marchtea.com/01.05.html)不过在看之间好好想一下，主要的提示是把所有的偶数回文都变成奇数长度——通过在每一个字符前后加一个placeholder -- #

#144 Binary Tree Preorder Traversal 
二叉树前序遍历。【需要写一个非递归版本】

#144 Binary Tree Preorder Traversal 
二叉树后序遍历。【需要写一个非递归版本】

#168 Excel Sheet Column Title
直接模拟，可以认为是一个26进制数，但是麻烦一点的是细节操作，边界条件什么的

#169 Majority Element
1. 可以scan一遍整个数组，然后用Hash table记录一下次数，最后刷一遍hash table。这个时间复杂度主要在于hash table遍历一遍的时间。
2. 二分答案：找到最大值和最小值，然后二分答案。这个是O(NlogC)的。对于当前假设的答案x，如果数组中有一半以上的数大于等于x，那么可能的答案最小值就是x；否则可能的答案最大值是x。因为众数出现的次数一定大于n/2个，所以最终逼近的就是正确解。
3. O(N)时间和O(1)空间：思路有点像是打砖块。设定当前答案，并且记录连续出现的次数。如果新的元素与当前答案相同，计数器加1；如果新的元素和当前答案不同，那么计数器减1；如果计数器为0，就把答案替换为当前元素，计数器设置为1。简单地说，就是拿兄弟去抵消那些异种，最后剩下的那个能代表本种族就好了。
4. [一行程序](https://leetcode.com/discuss/19251/one-line-solution-in-python) 这个有点意思，不过是使用了系统函数

#171 Excel Sheet Column Number
很简单的计算，可以当做是一个26进制数来看。主要的问题是要了解python和ruby里面对于字符串中字符的迭代方法。

#172 Factorial Trailing Zeroes
这个题目很简单也很经典，结尾要有一个0，那么分解因素的时候需要有一个2和一个5。把N!分解因素的话，2的个数肯定比5的多，所以其实就是要找到N!分解质因数之后有多少个5。ans = [n/5] + [n/25] + [n/125] ... 所以ans += [n/5]; n/=5直到n=0

#191 
这个就是基本的bitwise运算了，逐位取数就好了，每次n & 1就可以取出最后一位，然后n >>= 1看下一位

#202 Happy Number
1. 这个本质上是一个模拟题。最简单的办法是用Hashtable，然后每一次产生的值加入hashtable中，如果新产生的某个值已经在hashtable中出现，那么说明有一个环，所以不是happy number；否则会一直迭代到答案为1.
2. 这个题目本质上可以看做是一个找Link中是否有环的问题：我们想象一下从最初的n到最后的结果是一个链表，i-j是i进行运算之后得到j。那么根据之前的链接表的算法，可以用walker和runner来找这个链表是否存在环，如果存在，就不是happy number，否则就是。[答案由这里提供，实在是太精妙了](https://leetcode.com/discuss/33055/my-solution-in-c-o-1-space-and-no-magic-math-property-involved)

#215 Kth Largest Element in an Array
1 O(NlogN): 排序一遍直接找呗，当然肯定不是为了这么做
2 O(N * C): 二分答案，每一次假设答案是x，然后看x在数组中第几大，然后逐渐检索缩小范围，或者在大的一半找，或者在小的一半找
3 O(KlogN): 维护一个heap，heap的建立是O(N)的，然后用k次取最大值，每一次操作是O(logN)的
4 用快排的partition的方法，在平均情况下是O(N)的。【这个方法与快排需要写一个版本，这种思路很重要】

#217 Contains Duplicate
1 这个题目如果用ruby或者python做就会非常简单，因为有系统自带函数set(x)和x.uniq，但是问题是你不知道这两个函数的时间复杂度
2 如果不用系统函数，但是假设系统实现hashtable的时间复杂度是O(1)，那么存在O(N)的算法——就直接放进hashtable查一遍就好了。
3 当然，还可以排序看一遍是否有相邻的元素，时间为O(NlogN)；这已经是最暴力的方法了，用O(N^2)简直是不能接受的

#226 Invert Binary Tree
基本的二叉树操作，【需要写一个非递归版本】

#227 Basic Calculator II
这几个帖子非常厉害
[帖子1](https://leetcode.com/discuss/41558/20ms-o-n-time-o-1-space-one-scan-c-solution)
[帖子2](https://leetcode.com/discuss/41641/17-lines-c-easy-20-ms)