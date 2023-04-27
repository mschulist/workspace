import random
from manim import *
from manim_slides import Slide

class intro(Slide):
    def construct(self):
        title = Text("A Journey Around an Asteroid Belt")
        self.add(title)
        self.play(Write(title))
        self.wait()
        self.next_slide()

        self.play(Unwrite(title))
        problem = Text("Imagine you are exploring an asteroid belt, but you can only see the adjacent asteroids.", font_size=24)
        self.add(problem)
        self.play(Write(problem))
        self.wait()
        self.next_slide()

        self.play(problem.animate.to_edge(UP))
        specific_problem = Text("The number of days you spend on each asteroid must be proportional to the relative size of the asteroid.", font_size=24)
        self.add(specific_problem)
        self.play(Write(specific_problem))
        self.wait()
        self.next_slide()

        self.play(specific_problem.animate.next_to(problem, DOWN))
        question = Text("We need to develop a method to explore our asteroids\nwithout being able to see all of them at once.", font_size=32)
        self.add(question)
        self.play(Write(question))
        self.wait()
        self.next_slide()

        self.play(Unwrite(problem), Unwrite(specific_problem), Unwrite(question))
        answer = Text("We can use the Metropolis Algorithm to explore our asteroid belt!", font_size=32)
        self.add(answer)
        self.play(Write(answer))
        self.wait()
        self.next_slide()

        self.play(Unwrite(answer))
        rule1 = Text("Step 1: Start at a random asteroid", font_size=24).to_edge(UP).to_edge(RIGHT)
        self.add(rule1)
        self.play(Write(rule1))
        self.wait()
        self.next_slide()

        asteroids = ImageMobject("asteroids_a.png").scale(0.7).to_edge(LEFT)
        person = ImageMobject("asteroids_person.png").scale(0.7).to_edge(LEFT)
        self.add(asteroids, person)
        self.play(FadeIn(asteroids), FadeIn(person))
        self.wait()
        self.next_slide()

        rule2 = Text("Step 2: Flip a fair coin p(Heads) = 0.5 to\ndecide whether to propose going\nclockwise or counterclockwise.", font_size=24).next_to(rule1, DOWN).to_edge(RIGHT)
        self.add(rule2)
        self.play(Write(rule2))
        self.wait()
        self.next_slide()

        coinCircle = Circle(radius=0.5, color=RED, fill_opacity=1)
        coinCircle.next_to(rule2, DOWN).set_x(0)
        Heads = Text("H", font_size=36).move_to(coinCircle.get_center())
        self.add(coinCircle, Heads)
        self.play(Create(coinCircle))
        self.wait()
        self.next_slide()


        clockwise = Text("Propose to move clockwise", font_size=24).next_to(coinCircle, RIGHT)
        clockwise_arrow = Arrow([-4,-1, 0], [-6, 1 ,0], color=WHITE)
        self.add(clockwise, clockwise_arrow)
        self.play(Write(clockwise), Create(clockwise_arrow))
        self.wait()
        self.next_slide()

        rule3 = MathTex("\\text{Step 3: Flip a weighted coin, with p(heads)} = \\dfrac{\\text{proposal}}{\\text{current}}", font_size=28).next_to(coinCircle, DOWN).to_edge(RIGHT)
        self.add(rule3)
        self.play(Write(rule3))
        self.wait()
        self.next_slide()

        prob = MathTex("p(\\text{heads})=\\frac{1}{5}", font_size=36).next_to(rule3, DOWN).set_x(0)
        self.add(prob)
        self.play(Write(prob))
        self.wait()
        self.next_slide()

        coin2 = Circle(radius=0.5, color=YELLOW, fill_opacity=1)
        coin2.next_to(prob, RIGHT)
        tails = Text("T", font_size=36, color=BLACK).move_to(coin2.get_center())
        self.add(coin2, tails)
        self.play(Create(coin2))
        self.wait()
        self.next_slide()

        rule4 = Text('Step 4: If the coin lands heads,\nmove to the proposed asteroid.\nKeep track of where you end\nup after each "round"', font_size=24).next_to(coin2, DOWN).to_edge(RIGHT)
        self.add(rule4)
        self.play(Write(rule4))
        self.wait()
        self.next_slide()

        asteroid_visits = Text("Asteroid Visits: [A", font_size=24).to_corner(UL)
        asteroid_visits2 = Text("]", font_size=24).next_to(asteroid_visits, RIGHT, buff=0.05)
        self.add(asteroid_visits)
        self.play(Write(asteroid_visits))
        self.add(asteroid_visits2)
        self.play(Write(asteroid_visits2))
        self.wait()
        self.next_slide()

        self.play(Unwrite(rule1), Unwrite(rule2), Unwrite(rule3), Unwrite(rule4), Uncreate(coin2), Unwrite(coinCircle), Unwrite(prob), Unwrite(tails), Unwrite(clockwise), Uncreate(clockwise_arrow), Unwrite(Heads))
        self.wait()
        self.next_slide()

        second_proposal = Text("Propose to move counterclockwise", font_size=24).next_to(asteroids, RIGHT).to_edge(UP)
        coin = Circle(radius=0.5, color=YELLOW, fill_opacity=1).next_to(second_proposal, DOWN)
        tails = Text("T", font_size=36, color=BLACK).move_to(coin.get_center())
        move_arrow = Arrow([-4,-1, 0], [-3, 1 ,0], color=WHITE)
        self.add(second_proposal, coin, tails, move_arrow)
        self.play(Write(second_proposal), Create(coin), Write(tails), Create(move_arrow))
        self.wait()
        self.next_slide()

        second_coin = Circle(radius=0.5, color=RED, fill_opacity=1).next_to(coin, DOWN)
        heads = Text("H", font_size=36).move_to(second_coin.get_center())
        prob = MathTex("p(\\text{heads})=\\frac{1}{3}", font_size=36).next_to(second_coin, RIGHT)
        self.add(second_coin, heads, prob)
        self.play(Create(second_coin), Write(heads), Write(prob))
        self.wait()
        self.next_slide()

        self.play(person.animate.move_to([-3, 2, 0]).scale(0.5), Unwrite(move_arrow))
        self.wait()
        self.next_slide()

        asteroid_visits3 = Text(", C]", font_size=24).next_to(asteroid_visits, RIGHT, buff=0.05)
        self.play(Unwrite(asteroid_visits2))
        self.add(asteroid_visits3)
        self.play(Write(asteroid_visits3))
        self.wait()
        self.next_slide()
        
        self.play(FadeOut(second_proposal), Unwrite(second_coin), Unwrite(prob), Unwrite(heads), Unwrite(tails), Unwrite(coin), FadeOut(person), FadeOut(asteroids), FadeOut(asteroid_visits), FadeOut(asteroid_visits3))

class simulation(Slide):
    def construct(self):
        # random.seed(123) # for reproducibility
        # pregenerate random numbers for manim-slides reverse animations
        # with open("random_numbers.txt", "r") as f:
        #     random_numbers = f.read().splitlines()
        #     f.close()
        # random_numbers = [float(i) for i in random_numbers]
        asteroids = []
        asteroid_letters = []
        values = [0,0,0,0,0,0,0,0,0,0] # number of days spent on island i
        letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
        sizes = [1.4, 0.7, 0.5, 0.8, 0.9, 1, 1.3, 0.6, 1.1, 1.2]
        for i in range(10):
            asteroids.append(ImageMobject("asteroid"+str(i)+".png"))
            asteroids[i].width = sizes[i]
            x_coord = 2.5 * np.cos(i*2*np.pi/10) - 3
            y_coord = 3 * np.sin(i*2*np.pi/10)
            asteroids[i].move_to([x_coord, y_coord, 0])

        for i in range(10):
            asteroid_letters.append(MathTex(letters[i], font_size=24).next_to(asteroids[i], DOWN))

        def show_asteroid(i, fast=False):
            self.add(asteroids[i], asteroid_letters[i])
            if not fast:
                self.play(FadeIn(asteroids[i]), FadeIn(asteroid_letters[i]))

        def hide_asteroid(i, fast=False):
            self.remove(asteroids[i], asteroid_letters[i])
            if not fast:
                self.play(FadeOut(asteroids[i]), FadeOut(asteroid_letters[i]), run_time=0.5)

        def x_coord(i):
            return 2.5 * np.cos(i*2*np.pi/10) - 3
        
        def y_coord(i):
            return 3 * np.sin(i*2*np.pi/10)
        
        def move_person(i, person, fast=False):
            if fast:
                person.move_to([x_coord(i), y_coord(i), 0])
            if not fast:
                self.play(person.animate.move_to([x_coord(i), y_coord(i), 0]))
            

        def show_numbers(i, fast=False):
            global sizei
            global sizei1
            global sizei2
            sizei = MathTex("1", font_size=24).next_to(asteroids[i], RIGHT, buff=0.15)
            sizei1 = MathTex(str(round(sizes[(i+1)%10]/sizes[i], 2)), font_size=24).next_to(asteroids[(i+1)%10], RIGHT, buff=0.15)
            sizei2 = MathTex(str(round(sizes[(i-1)%10]/sizes[i], 2)), font_size=24).next_to(asteroids[(i-1)%10], RIGHT, buff=0.15)
            self.add(sizei, sizei1, sizei2)
            if not fast:
                self.play(Write(sizei), Write(sizei1), Write(sizei2))
        
        def hide_numbers(i, fast=False):
            self.remove(sizei, sizei1, sizei2)
            if not fast:
                self.play(Unwrite(sizei), Unwrite(sizei1), Unwrite(sizei2))
        

        def mcmc_sim(i, previous, start=False, fast=False):
            if start:
                global person
                person = ImageMobject("person.png").move_to([x_coord(i), y_coord(i), 0]).scale(0.2).set_z_index(10)
                self.add(person)
                if not fast:
                    self.play(FadeIn(person))
                self.next_slide()
                show_asteroid(i, fast)
                show_asteroid((i+1)%10, fast)
                show_asteroid((i-1)%10, fast)
                show_numbers(i, fast)
                if not fast:
                    self.wait()
                    self.next_slide()

            # Start at asteroid i and show adjacent asteroids and their relative sizes

            if not start:
                if not fast:
                    self.wait()
                    self.next_slide()
            
            # Flip a coin
            coinHeads = Circle(radius=0.5, color=RED, fill_opacity=1).move_to([-3, 1, 0])
            coinTails = Circle(radius=0.5, color=YELLOW, fill_opacity=1).move_to([-3, 1, 0])
            heads = Text("H", font_size=36).move_to(coinHeads.get_center())
            tails = Text("T", font_size=36, color=BLACK).move_to(coinTails.get_center())
            # random part of the simulation
            flip1 = random.randint(0, 1)
            proposal = (i-1)%10 if flip1 == 0 else (i+1)%10
            if flip1 == 0:
                self.add(coinHeads, heads)
                if not fast:
                    self.play(Create(coinHeads))
            if flip1 == 1:
                self.add(coinTails, tails)
                if not fast:
                    self.play(Create(coinTails))
            arrow = Arrow([x_coord(i), y_coord(i), 0], [x_coord(proposal), y_coord(proposal), 0], color=WHITE)
            self.add(arrow)
            if not fast:
                self.play(Create(arrow))
            if not fast:
                self.wait()
                self.next_slide()

            # Flip a coin for second part
            coinHeads2 = Circle(radius=0.5, color=RED, fill_opacity=1).move_to([-3.5, -1, 0])
            coinTails2 = Circle(radius=0.5, color=YELLOW, fill_opacity=1).move_to([-3.5, -1, 0])
            heads2 = Text("H", font_size=36).move_to(coinHeads2.get_center())
            tails2 = Text("T", font_size=36, color=BLACK).move_to(coinTails2.get_center())
            # random part of the simulation
            prob = sizes[proposal] / sizes[i]
            coinprob = MathTex(f"p(H) = {round(prob, 2)}", font_size=24).move_to([-2.25, -1, 0])
            self.add(coinprob)
            if not fast:
                self.play(Write(coinprob), run_time=0.5)
            if not fast:
                self.wait()
                self.next_slide()

            flip2 = random.random()
            if flip2 < prob:
                moving = True
                self.add(coinHeads2, heads2)
                if not fast:
                    self.play(Create(coinHeads2))
            if flip2 >= prob:
                moving = False
                self.add(coinTails2, tails2)
                if not fast:
                    self.play(Create(coinTails2))
            if not fast:
                self.wait()
                self.next_slide()

            # move the person
            if moving:
                values[proposal] += 1
                current = proposal
                move_person(current, person, fast)
            else:
                values[i] += 1
                current = i
            
            print(values)

            if fast:
                self.wait(1/60)
            
            
            if not start:
                self.remove(chart)
            makeChart(values)
            if not fast:          
                self.wait()       
                self.next_slide()
            
            if flip1 == 0:
                self.remove(coinHeads, heads)
                if not fast:
                    self.play(Uncreate(coinHeads), Uncreate(heads), run_time=0.5)
            if flip2 < prob:
                self.remove(coinHeads2, heads2, coinprob)
                if not fast:
                    self.play(Uncreate(coinHeads2), Uncreate(heads2), Unwrite(coinprob), run_time=0.5)
            if flip1 == 1:
                self.remove(coinTails, tails)
                if not fast:
                    self.play(Uncreate(coinTails), Uncreate(tails), run_time=0.5)
            if flip2 >= prob:
                self.remove(coinTails2, tails2, coinprob)
                if not fast:
                    self.play(Uncreate(coinTails2), Uncreate(tails2), Unwrite(coinprob), run_time=0.5)
            self.remove(arrow)
            if not fast:
                self.play(FadeOut(arrow))

            if i == (current+1)%10:
                hide_numbers((current-1)%10, fast)
                hide_numbers(current, fast)
                hide_numbers((current+1)%10, fast)
                hide_asteroid((current+2)%10, fast)
                show_asteroid((current-1)%10, fast)
                show_numbers(current, fast)
            
            if i == (current-1)%10:
                hide_numbers((current-1)%10, fast)
                hide_numbers(current, fast)
                hide_numbers((current+1)%10, fast)
                hide_asteroid((current-2)%10, fast)
                show_asteroid((current+1)%10, fast)
                show_numbers(current, fast)
            
            print(i == (current+1)%10)
            print(i == (current-1)%10)


            
            if not fast:
                self.wait()
            return [current, i]
        
        # Make a graph showing the amount of time spent on each island

        def makeChart(values):
            global chart
            max_y = max(values)
            chart = BarChart(
                values, 
                y_range=[0, max_y, 1],
                y_length=6,
                x_length=5,
                bar_names=letters,
                y_axis_config={"include_ticks": False,
                               "font_size": 0.001,}
            ).to_edge(RIGHT).to_edge(UP)
            self.add(chart)
        

        
        # Run the simulation
        current = 0
        previous = 0
        results = mcmc_sim(current, previous, start=True)
        current = results[0]
        previous = results[1]
        for i in range(5):
            results = mcmc_sim(current, previous, start=False)
            current = results[0]
            previous = results[1]
        for i in range(1200):
            results = mcmc_sim(current, previous, fast=True)
            current = results[0]
            previous = results[1]
        self.wait()
        self.next_slide()

        # remove the everything except the chart)
        self.remove(*self.mobjects)
        self.add(chart)
        self.wait()
        self.next_slide()

        # show the chart with the "true" values
        true_chart = BarChart(
            sizes,
            y_range=[0, max(sizes), 1],
            y_length=6,
            x_length=5,
            bar_names=letters,
            y_axis_config={"include_ticks": False,
                            "font_size": 0.001,}
        ).to_edge(LEFT).to_edge(UP)
        chart_subtitle = Text("True Asteroid Sizes", font_size=32).next_to(true_chart, DOWN)
        self.add(true_chart, chart_subtitle)
        self.play(Write(chart_subtitle), Create(true_chart))
        self.wait()
        self.next_slide()

class explanation(Slide):
    def construct(self):
        useful = Text("Why is this useful?", font_size=36)
        self.add(useful)
        self.play(Write(useful))
        self.wait()
        self.next_slide()

        self.play(useful.animate.to_edge(UP))
        self.wait()
        self.next_slide()

        reason1 = Text("1. Scalable", font_size=36).next_to(useful, DOWN).to_edge(LEFT)
        self.add(reason1)
        self.play(Write(reason1))
        self.wait()
        self.next_slide()

        reason2 = Text("2. Multidimensional", font_size=36).next_to(reason1, DOWN).to_edge(LEFT)
        self.add(reason2)
        self.play(Write(reason2))
        self.wait()
        self.next_slide()

        reason3 = Text("3. Compute Integrals", font_size=36).next_to(reason2, DOWN).to_edge(LEFT)
        self.add(reason3)
        self.play(Write(reason3))
        self.wait()
        self.next_slide()

        crazy_posterior = FunctionGraph(lambda x: np.exp(-x**2) + np.exp(-(x-2)**2) + 0.5 * np.exp(-(x+1.5)**2), x_range=[-4, 4], color=BLUE).next_to(reason3, DOWN).move_to([0,0,0]).scale(1.5)
        self.add(crazy_posterior)
        self.play(Write(crazy_posterior))
        self.wait()
        self.next_slide()

        crazy_integral = MathTex("1 = k \\int e^{-x^2} + e^{-(x-2)^2} + 0.5 e^{-(x+1.5)^2} dx", font_size=36).next_to(crazy_posterior, DOWN)
        self.add(crazy_integral)
        self.play(Write(crazy_integral))
        self.wait()
        self.next_slide()

        self.remove(crazy_posterior, crazy_integral, reason1, reason2, reason3, useful)
        self.play(FadeOut(crazy_posterior), FadeOut(crazy_integral), FadeOut(reason1), FadeOut(reason2), FadeOut(reason3), FadeOut(useful))
        self.wait()
        self.next_slide()

        MARC_title = Text("MARC Project", font_size=36).to_edge(UP)
        self.add(MARC_title)
        self.play(Write(MARC_title))
        self.wait()
        self.next_slide()

        MARC_description = Text("Modeling Bird Response to Fire", font_size=36).next_to(MARC_title, DOWN)
        self.add(MARC_description)
        self.play(Write(MARC_description))
        self.wait()
        self.next_slide()

        caples_burn = ImageMobject("caples_burn.png").scale(0.7).next_to(MARC_description, DOWN).to_edge(LEFT)
        caples_description = Text("Controlled Burn", font_size=36).next_to(caples_burn, DOWN)
        self.add(caples_burn, caples_description)
        self.play(FadeIn(caples_burn), Write(caples_description))
        self.wait()
        self.next_slide()

        caldor_burn = ImageMobject("caldor_burn.png").scale(0.7).next_to(MARC_description, DOWN).to_edge(RIGHT)
        caldor_description = Text("Caldor Wildfire", font_size=36).next_to(caldor_burn, DOWN)
        self.add(caldor_burn, caldor_description)
        self.play(FadeIn(caldor_burn), Write(caldor_description))
        self.wait()
        self.next_slide()

        # gcki = ImageMobject("gcki.png").scale(0.33).next_to(MARC_description, DOWN).to_edge(LEFT)
        # bbwo = ImageMobject("bbwo.png").scale(0.33).next_to(MARC_description, DOWN).to_edge(RIGHT)
        # self.add(gcki, bbwo)
        # self.play(FadeIn(gcki), FadeIn(bbwo))
        # self.wait()
        # self.next_slide()

        self.remove(MARC_title, MARC_description, caples_burn, caples_description, caldor_burn, caldor_description)
        self.play(FadeOut(MARC_title), FadeOut(MARC_description), FadeOut(caples_burn), FadeOut(caples_description), FadeOut(caldor_burn), FadeOut(caldor_description))
        self.wait()
        self.next_slide()

        bbwo_regression = ImageMobject("bbwo_beta1_regres.png").scale(0.6).to_edge(UP).to_edge(LEFT)
        self.add(bbwo_regression)
        self.play(FadeIn(bbwo_regression))
        self.wait()
        self.next_slide()

        bbwo_distribution = ImageMobject("bbwo_dist.png").scale(1.3).to_edge(UP).to_edge(RIGHT)
        self.add(bbwo_distribution)
        self.play(FadeIn(bbwo_distribution))
        self.wait()
        self.next_slide()

        sidenote = Text("Unexpected! Black-backed Woodpeckers\nare more abundant in burned areas", font_size=24).next_to(bbwo_regression, DOWN)
        self.add(sidenote)
        self.play(Write(sidenote))
        self.wait()
        self.next_slide()

        self.remove(sidenote)
        self.play(Unwrite(sidenote), run_time=0.5)
        self.play(bbwo_distribution.animate.scale(0.45), bbwo_regression.animate.scale(0.75))
        self.play(bbwo_distribution.animate.to_edge(DOWN), bbwo_regression.animate.to_edge(DOWN))
        traceplot = ImageMobject("beta1_traceplot.png").scale(0.7).to_edge(UP)
        self.add(traceplot)
        self.play(FadeIn(traceplot))
        self.wait()
        self.next_slide()

        


