---
title: Question 620
category: [SQL]
tags: [easy]
---

![Description](../Assets/Figure/question620.png)

## Code

```sql
SELECT *
FROM cinema
WHERE id % 2 = 1 and description != 'boring'
ORDER BY rating DESC
```
