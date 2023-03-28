from manim import *
from manim_slides import Slide

class intro(Slide):
    def construct(self):
        title = Text("Metropolis Algorithm\nand\nMarkov Chain Monte Carlo")
        self.add(title)
        self.play(Write(title))
        self.next_slide()
        self.play(Unwrite(title))
        self.wait()
        problem = Text("Imagine you are exploring \nan asteroid belt, but you \ncan only see the adjacent asteriods.")
        self.add(problem)
        self.play(Write(problem))
        self.next_slide()
        self.play(Unwrite(problem))
        self.wait()
        specific_problem = Text("The number of days you spend on each\nasteroid must be proportional to\nthe relative population size\nof the asteroid.")
        self.add(specific_problem)
        self.play(Write(specific_problem))
        self.next_slide()
        self.play(Unwrite(specific_problem))
        self.wait()
        