from manim import *
import numpy as np
import random
#### MAKE THE WAITS LONGER FOR THE FINAL VIDEO

class slow_islands(Scene):
    def construct(self):
        coords = [
            [-4.7, 1.7, 0], 
            [-5, -0.9, 0], 
            [-3, -1.7, 0], 
            [-5, 1, 0], 
            [-2.1, 0, 0], 
            [-3.7, 1.3, 0], 
            [-2.1, -1.2, 0], 
            [-4, -1, 0], 
            [-5.3, 0, 0], 
            [-2.7, 1, 0],
                ]
        island_order = [1,6,10,5,7,3,8,2,9,4]
        
        islands = SVGMobject("king_markov_islands.svg", height=5)
        self.add(islands)
        self.play(Create(islands), run_time=2)
        self.wait(2)
        self.play(islands.animate.to_edge(LEFT))
        self.wait(3)
        # Make the islands and then talk about the islands for a while

        # Start at a "random" island (island 4 in this random case)
        current = Circle(radius=0.2, color=GREEN, fill_opacity=1).move_to(coords[3])
        self.add(current)
        self.play(Create(current))
        self.wait(3)

        # Then make the coin and talk about why we toss the coin
        coinExplain = Text("Heads = Clockwise, \nTails = Counter-Clockwise", font_size=36).next_to(islands, RIGHT).to_edge(UP)
        self.add(coinExplain)
        self.play(Write(coinExplain))
        self.wait(3)

        coinCircle = Circle(radius=0.5, color=RED, fill_opacity=1).next_to(islands, RIGHT)
        Heads = Text("H", font_size=36).move_to(coinCircle.center())
        self.add(coinCircle, Heads)
        self.play(Create(coinCircle))
        self.wait()

        # Make an arrow showing the direction that we move around the islands
        arrow = Arrow(current.get_center(), [-4.75,1.8,0], buff=0)
        self.add(arrow)
        self.play(Create(arrow))
        self.wait(3)

        # Explain that because 1 is smaller than 4, we are not guaranteed to move to 1
        proposal = Text("Proposal: Move to Island 1", font_size=36).next_to(coinCircle, UP).to_edge(RIGHT)
        self.add(proposal)
        self.play(Write(proposal))
        self.wait(3)

        prob_move = MathTex("\\text{Probability of Moving to Island 1: } \\dfrac{1}{4}", font_size=36).next_to(proposal, DOWN).to_edge(RIGHT)
        self.add(prob_move)
        self.play(Write(prob_move))
        self.wait(3)

        # Explain that we toss a weighted coin to decide whether or not we move to 1
        secondCoin = Circle(radius=0.5, color=YELLOW, fill_opacity=1).next_to(coinCircle, DOWN)
        Tails = Text("T", font_size=36, color=BLACK).move_to(secondCoin.get_center())
        self.add(secondCoin, Tails)
        self.play(Create(secondCoin))
        self.wait(3)

        stay = Text("Stay on Island 4", font_size=36).next_to(secondCoin, RIGHT)
        self.add(stay)
        self.play(Write(stay))
        self.wait(5)

        self.play(Unwrite(coinExplain), Unwrite(coinCircle), Unwrite(arrow), Unwrite(proposal), Unwrite(prob_move), Unwrite(secondCoin), Unwrite(stay), Unwrite(Heads))

        # Make a graph showing the amount of time spent on each island
        values = [0,0,0,0,0,0,0,0,0,0] # number of days spent on island i
        values[3] += 1 # add one to island number 4

        def makeChart(values):
            global chart
            max_y = max(values)
            chart = BarChart(
                values, 
                y_range=[0, max_y, 1],
                y_length=6,
                x_length=5,
                bar_names=[1,2,3,4,5,6,7,8,9,10],
                y_axis_config={"include_ticks": False,
                               "font_size": 0.001,}
            ).to_edge(RIGHT).to_edge(UP)
            self.add(chart)
        
        makeChart(values)


        current_island = 4

        def flip(p):
            return True if random.random() < p else False

        def sample(current_island, island_order):
            toss = random.randint(0, 1)
            index = island_order.index(current_island)
            if toss == 0:
                if index == 0:
                    index = 10
                proposal_island = island_order[index-1]
            if toss == 1:
                if index == 9:
                    index = -1
                proposal_island = island_order[index+1]
            if proposal_island > current_island:
                return proposal_island
            else:
                prob = proposal_island / current_island
                if flip(prob):
                    return proposal_island
                else:
                    return current_island
                
        for j in range(200):
            for i in range(100):
                current_island = sample(current_island, island_order)
                current.move_to(coords[current_island-1])
                values[current_island-1] += 1
            self.remove(chart)
            makeChart(values)
            self.wait(0.1)

        self.wait(10)