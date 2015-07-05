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

#iterative
def reverse_list(head)
    ans = []
    while !head.nil? do
        ans.push(head);
        head = head.next
    end;
    head = ans.pop
    last = head
    while !ans.empty? do
        last.next = ans.pop
        last = last.next
    end
    last.next = nil if last != nil
    return head
end

#recursive, stack overflow
def reverse_list(head)
    def get_reverse(head)
        return nil,nil if head.nil? 
        return head,head if head.next.nil?
        tmp_head, tmp_last = get_reverse(head)
        tmp_last.next = head
        return tmp_head, head
    end
    head, last = get_reverse(head)
    return head
end