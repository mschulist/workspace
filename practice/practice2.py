"""
catsanddog

1. cat sanddog
2. catsanddog

3. cats anddog

remaining_str = catsanddog, index = 0

curr = s[:index+1]

if curr in wordDict:
    new_str = remaining_str[index:]

    words(remaining_str, index+1)
    words(curr, index+1)

if index == len(s) - 1:
    if remaining_str == "":
        return True


return False
"""

from typing import List


class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        answers = []

        def words(remaining_str: str, index: int):
            curr = remaining_str[:index]
            print(remaining_str)
            if remaining_str == "":
                answer = True
                answers.append(True)
                return

            if index == len(s) - 1:
                if remaining_str == "":
                    answers.append(True)
                return

            if curr in wordDict:
                new_str = remaining_str[index:]

                words(remaining_str, index + 1)
                words(new_str, 0)
            else:
                words(remaining_str, index + 1)

        words(s, 0)
        return bool(answers)
