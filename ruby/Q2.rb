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
def add_two_numbers(l1, l2)
    head, last = nil, nil;
    tmp = 0;
    while !l1.nil? || !l2.nil?
        a1 = l1.nil? ? 0 : l1.val;
        a2 = l2.nil? ? 0 : l2.val;
        tmp_node = ListNode.new(a1 + a2 + tmp)
        tmp = tmp_node.val / 10;
        tmp_node.val = tmp_node.val % 10
        if head.nil?
            head = tmp_node
        else
            last.next = tmp_node
        end;
        last = tmp_node
        l1 = l1.next if !l1.nil?
        l2 = l2.next if !l2.nil?
    end;
    if tmp > 0 
        tmp_node = ListNode.new(tmp)
        last.next = tmp_node
    end;
    return head
end