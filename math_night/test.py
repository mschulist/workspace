from manim import *
from manim_slides import Slide

class test(Slide):
    def construct(self):
        circle = Text("hey")
        circle2 = Circle(radius=1, color=RED, fill_opacity=1)
        circle2.next_to(circle, RIGHT)
        self.add(circle, circle2)
        self.play(Create(circle), Create(circle2))



        
        care = Text("So cool, but why should we care?", font_size=36)
        self.add(care)
        self.play(Write(care))
        self.next_slide()

        self.play(Unwrite(care))
        normal_dist = FunctionGraph(lambda x: np.exp(-x**2/2), x_range=[-3,3], color=BLUE).scale(2)
        self.add(normal_dist)
        self.play(Create(normal_dist), run_time=2)
        self.wait()
        dist_sub = Text("Normal (Gaussian) Distribution", font_size=24).next_to(normal_dist, DOWN)
        self.add(dist_sub)
        self.play(Write(dist_sub))
        self.next_slide()
