def max_path_sum(root)
    $ans = nil;
    def get_single(root)
        return 0 if root.nil?
        path_l = get_single(root.left)
        path_r = get_single(root.right)
        path_cross = [path_l, 0].max + [path_r, 0].max + root.val
        $ans = $ans.nil? ? path_cross : [path_cross, $ans].max
        return [[path_l, 0].max, [path_r, 0].max].max + root.val
    end;
    get_single(root)
    return $ans
end