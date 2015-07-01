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
def swap_pairs(head)
    dumb = ListNode.new(0)
    dumb.next = head;
    walker, runner, last = head, head, dumb
    while (!runner.nil?) and (!runner.next.nil?)
        runner = walker.next
        tmp = runner.next
        runner.next = walker
        walker.next = tmp
        last.next = runner
        last = walker
        walker, runner = tmp, tmp
    end
    return dumb.next
end