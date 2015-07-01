# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

# First point goes ahead, second point start from the head and goes down to see if first.next == second
# O(N^2) in time, TLE
class Solution:
    # @param head, a ListNode
    # @return a boolean
    def hasCycle(self, head):
        flag = False;
        first = head;
        while first != None and (not flag):
            second = head;
            while second != first:
                if first.next == second:
                    flag = True
                second = second.next
            if first.next == second:
                flag = True
            first = first.next
        return flag

class Solution:
    # @param head, a ListNode
    # @return a boolean
    def hasCycle(self, head):
        flag = False;
        first = head;
        while first != None and (not flag):
            if first.val == None:
                flag = True
                break
            first.val = None;
            first = first.next
        return flag

#Runner and Walker, learned from the discussion
class Solution:
    # @param head, a ListNode
    # @return a boolean
    def hasCycle(self, head):
        walker, runner = head, head
        while (runner != None) and (runner.next != None):
            walker = walker.next
            runner = runner.next.next
            if walker == runner:
                return True
        return False
 