import random
from manim import *
from manim_slides import Slide

class intro(Slide):
    def construct(self):
        title = Text("A Journey Around an Asteroid Belt")
        self.add(title)
        self.play(Write(title))
        self.next_slide()

        self.play(Unwrite(title))
        problem = Text("Imagine you are exploring an asteroid belt, but you can only see the adjacent asteroids.", font_size=16)
        self.add(problem)
        self.play(Write(problem))
        self.next_slide()

        self.play(problem.animate.to_edge(UP))
        specific_problem = Text("The number of days you spend on each asteroid must be proportional to the relative size of the asteroid.", font_size=16)
        self.add(specific_problem)
        self.play(Write(specific_problem))
        self.next_slide()

        self.play(specific_problem.animate.next_to(problem, DOWN))
        question = Text("We need to develop a method to explore our asteroids\nwithout being able to see all of them at once.", font_size=32)
        self.add(question)
        self.play(Write(question))
        self.next_slide()

        self.play(Unwrite(problem), Unwrite(specific_problem), Unwrite(question))
        answer = Text("We can use the Metropolis Algorithm to explore our asteroid belt!", font_size=24)
        self.add(answer)
        self.play(Write(answer))
        self.next_slide()

        self.play(Unwrite(answer))
        rule1 = Text("Step 1: Start at a random asteroid", font_size=24).to_edge(UP).to_edge(RIGHT)
        self.add(rule1)
        self.play(Write(rule1))
        self.next_slide()

        asteroids = ImageMobject("asteroids_a.png").scale(0.7).to_edge(LEFT)
        person = ImageMobject("asteroids_person.png").scale(0.7).to_edge(LEFT)
        self.add(asteroids, person)
        self.play(FadeIn(asteroids), FadeIn(person))
        self.next_slide()

        rule2 = Text("Step 2: Flip a fair coin p(Heads) = 0.5 to\ndecide whether to propose going\nclockwise or counterclockwise.", font_size=24).next_to(rule1, DOWN).to_edge(RIGHT)
        self.add(rule2)
        self.play(Write(rule2))
        self.next_slide()

        coinCircle = Circle(radius=0.5, color=RED, fill_opacity=1)
        coinCircle.next_to(rule2, DOWN).set_x(0)
        Heads = Text("H", font_size=36).move_to(coinCircle.get_center())
        self.add(coinCircle, Heads)
        self.play(Create(coinCircle))
        self.next_slide()


        clockwise = Text("Propose to move clockwise", font_size=24).next_to(coinCircle, RIGHT)
        clockwise_arrow = Arrow([-4,-1, 0], [-6, 1 ,0], color=WHITE)
        self.add(clockwise, clockwise_arrow)
        self.play(Write(clockwise), Create(clockwise_arrow))
        self.next_slide()

        rule3 = MathTex("\\text{Step 3: Flip a weighted coin, with p(heads)} = \\dfrac{\\text{proposal}}{\\text{current}}", font_size=28).next_to(coinCircle, DOWN).to_edge(RIGHT)
        self.add(rule3)
        self.play(Write(rule3))
        self.next_slide()

        prob = MathTex("p(\\text{heads})=\\frac{1}{5}", font_size=36).next_to(rule3, DOWN).set_x(0)
        self.add(prob)
        self.play(Write(prob))
        self.next_slide()

        coin2 = Circle(radius=0.5, color=YELLOW, fill_opacity=1)
        coin2.next_to(prob, RIGHT)
        tails = Text("T", font_size=36, color=BLACK).move_to(coin2.get_center())
        self.add(coin2, tails)
        self.play(Create(coin2))
        self.next_slide()

        rule4 = Text('Step 4: If the coin lands heads,\nmove to the proposed asteroid.\nKeep track of where you end\nup after each "round"', font_size=24).next_to(coin2, DOWN).to_edge(RIGHT)
        self.add(rule4)
        self.play(Write(rule4))
        self.next_slide()

        asteroid_visits = Text("Asteroid Visits: [A", font_size=24).to_corner(UL)
        asteroid_visits2 = Text("]", font_size=24).next_to(asteroid_visits, RIGHT, buff=0.05)
        self.add(asteroid_visits)
        self.play(Write(asteroid_visits))
        self.add(asteroid_visits2)
        self.play(Write(asteroid_visits2))
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
        self.next_slide()

        second_coin = Circle(radius=0.5, color=RED, fill_opacity=1).next_to(coin, DOWN)
        heads = Text("H", font_size=36).move_to(second_coin.get_center())
        prob = MathTex("p(\\text{heads})=\\frac{1}{3}", font_size=36).next_to(second_coin, RIGHT)
        self.add(second_coin, heads, prob)
        self.play(Create(second_coin), Write(heads), Write(prob))
        self.next_slide()

        self.play(person.animate.move_to([-3, 2, 0]).scale(0.5), Unwrite(move_arrow))
        self.next_slide()

        asteroid_visits3 = Text(", C]", font_size=24).next_to(asteroid_visits, RIGHT, buff=0.05)
        self.play(Unwrite(asteroid_visits2))
        self.add(asteroid_visits3)
        self.play(Write(asteroid_visits3))
        self.next_slide()
        
        self.play(FadeOut(second_proposal), Unwrite(second_coin), Unwrite(prob), Unwrite(heads), Unwrite(tails), Unwrite(coin), FadeOut(person), FadeOut(asteroids), FadeOut(asteroid_visits), FadeOut(asteroid_visits3))

class simulation(Slide):
    def construct(self):
        random.seed(123) # for reproducibility
        asteroids = []
        asteroid_letters = []
        letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
        sizes = [1.4, 0.7, 0.5, 0.8, 0.9, 1, 1.3, 0.6, 1.1, 1.2]
        for i in range(10):
            asteroids.append(ImageMobject("asteroid"+str(i)+".png"))
            asteroids[i].set_width(sizes[i])
            x_coord = 2.5 * np.cos(i*2*np.pi/10) - 3
            y_coord = 3 * np.sin(i*2*np.pi/10)
            asteroids[i].move_to([x_coord, y_coord, 0])

        for i in range(10):
            asteroid_letters.append(MathTex(letters[i], font_size=24).next_to(asteroids[i], DOWN))

        def show_asteroid(i):
            self.add(asteroids[i], asteroid_letters[i])
            self.play(FadeIn(asteroids[i]), Write(asteroid_letters[i]))

        def hide_asteroid(i):
            self.remove(asteroids[i], asteroid_letters[i])
            self.play(FadeOut(asteroids[i]), Unwrite(asteroid_letters[i]))

        def x_coord(i):
            return 2.5 * np.cos(i*2*np.pi/10) - 3
        
        def y_coord(i):
            return 3 * np.sin(i*2*np.pi/10)
        
        def move_person(i, person):
            self.play(person.animate.move_to([x_coord(i), y_coord(i), 0]))

        def show_numbers(i):
            sizei = MathTex("1", font_size=24).next_to(asteroids[i], RIGHT)
            sizei1 = MathTex(str(round(sizes[(i+1)%10]/sizes[i], 2)), font_size=24).next_to(asteroids[(i+1)%10], RIGHT)
            sizei2 = MathTex(str(round(sizes[(i-1)%10]/sizes[i], 2)), font_size=24).next_to(asteroids[(i-1)%10], RIGHT)
            self.add(sizei, sizei1, sizei2)
            self.play(Write(sizei), Write(sizei1), Write(sizei2))
        

        def mcmc_sim(i, previous, start=False):
            if start:
                global person
                person = ImageMobject("person.png").move_to([x_coord(i), y_coord(i), 0]).scale(0.2).set_z_index(10)
                self.add(person)
                self.play(FadeIn(person))
                self.next_slide()
                show_asteroid(i)
                show_asteroid((i+1)%10)
                show_asteroid((i-1)%10)
                show_numbers(i)


            # Start at asteroid i and show adjacent asteroids and their relative sizes

            print(previous == (i+1)%10)
            print(previous == (i-1)%10)
            
            if previous == (i+1)%10:
                move_person(i, person)
                hide_asteroid((i+2)%10)
                show_asteroid((i-1)%10)
            
            if previous == (i-1)%10:
                move_person(i, person)
                hide_asteroid((i-2)%10)
                show_asteroid((i+1)%10)
            
          

            # Flip a coin
            coinHeads = Circle(radius=0.5, color=RED, fill_opacity=1).move_to([-3, 1, 0])
            coinTails = Circle(radius=0.5, color=YELLOW, fill_opacity=1).move_to([-3, 1, 0])
            heads = Text("H", font_size=36).move_to(coinHeads.get_center())
            tails = Text("T", font_size=36, color=BLACK).move_to(coinTails.get_center())
            # random part of the simulation
            flip1 = random.randint(0,1)
            proposal = (i-1)%10 if flip1 == 0 else (i+1)%10
            if flip1 == 0:
                self.add(coinHeads, heads)
                self.play(Create(coinHeads))
            if flip1 == 1:
                self.add(coinTails, tails)
            arrow = Arrow([x_coord(i), y_coord(i), 0], [x_coord(proposal), y_coord(proposal), 0], color=WHITE)
            self.add(arrow)
            self.play(Create(arrow))
            self.next_slide()

            # Flip a coin for second part
            coinHeads2 = Circle(radius=0.5, color=RED, fill_opacity=1).move_to([-3, -1, 0])
            coinTails2 = Circle(radius=0.5, color=YELLOW, fill_opacity=1).move_to([-3, -1, 0])
            heads2 = Text("H", font_size=36).move_to(coinHeads2.get_center())
            tails2 = Text("T", font_size=36, color=BLACK).move_to(coinTails2.get_center())
            # random part of the simulation
            prob = sizes[proposal] / sizes[i]
            flip2 = random.random()
            if flip2 < prob:
                moving = True
                self.add(coinHeads2, heads2)
                self.play(Create(coinHeads2))
            if flip2 >= prob:
                moving = False
                self.add(coinTails2, tails2)
                self.play(Create(coinTails2))
            self.next_slide()

            # move the person
            if moving:
                values[proposal] += 1
                current = proposal
            else:
                values[i] += 1
                current = i
            print(current)
            self.remove(coinHeads, coinTails, coinHeads2, coinTails2, heads, tails, heads2, tails2, arrow)
            self.play(FadeOut(coinHeads), FadeOut(coinTails), FadeOut(coinHeads2), FadeOut(coinTails2), FadeOut(heads), FadeOut(tails), FadeOut(heads2), FadeOut(tails2), FadeOut(arrow))
            return [current, i]


        
        # Make a graph showing the amount of time spent on each island
        values = [1,0,0,0,0,0,0,0,0,0] # number of days spent on island i
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
        mcmc_sim(0, 0, True)
        for i in range(5):
            results = mcmc_sim(current, previous)
            current = results[0]
            previous = results[1]


