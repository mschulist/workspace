""" """

# Definition for a binary tree node.
from typing import Optional, List


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


"""

"""


class Solution:
    def inorderTraversal(self, root: Optional[TreeNode]):
        in_order_list = []

        def traverse(node: TreeNode):
            if node is None:
                return

            traverse(node.left)
            in_order_list.append(node.val)

            traverse(node.right)

        traverse(root)

        return in_order_list

    def inorderTraversal2(self, root: Optional[TreeNode]):
        in_order_list = []

        node_stack: List[TreeNode] = []

        curr_node = root
        while node_stack or curr_node:
            while curr_node:
                node_stack.append(curr_node)
                curr_node = curr_node.left

            curr_node = node_stack.pop()

            in_order_list.append(curr_node.val)

            curr_node = curr_node.right

        return in_order_list
