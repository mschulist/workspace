from manim import *

class Cap_Discharge(Scene):
    def construct(self):
        t1 = MathTex("V(t) = V_0 e^{- \frac{t}{RC}}")
        self.add(t1)
        self.play(Create(t1))