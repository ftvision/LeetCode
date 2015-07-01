# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def delete_duplicates(head)
    ans = [];
    while !head.nil? do
        ans += [head.val] if head.val != ans[ans.length-1]
        head = head.next
    end
    return ans
end