# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
    ans = [];
    while !l1.nil? || !l2.nil? do
        if l1.nil?
            ans << l2.val;
            l2 = l2.next;
        elsif l2.nil?
            ans << l1.val;
            l1 = l1.next
        elsif l1.val >= l2.val
            ans << l2.val;
            l2 = l2.next;
        elsif l1.val < l2.val
            ans << l1.val;
            l1 = l1.next
        end
    end
    return ans
end

# Interestingly, I should be able to use OR as short circuit, but it doesn't work, so the code is long.