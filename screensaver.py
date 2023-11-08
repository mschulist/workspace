from manim import *
import random

class screensaver(Scene):
    def construct(self):
        random.seed(123)
        # Create a list of colors
        colors = [RED_E, ORANGE, YELLOW_E, GREEN_E, BLUE_E, PURPLE_E, TEAL_E, MAROON_E, GOLD_E, PINK]

        # Create a list of shapes
        #square = Square()
        circle = Circle().scale(2)
        triangle = Triangle().scale(2)
        star1 = Star(n=5).scale(2)
        star2 = Star(n=6).scale(2)
        star3 = Star(n=7).scale(2)
        star4 = Star(n=8).scale(2)
        star5 = Star(n=9).scale(2)
        star6 = Star(n=10).scale(2)
        square = RegularPolygon(4).scale(2)
        pentagon = RegularPolygon(5).scale(2)
        hexagon = RegularPolygon(6).scale(2)
        sevenagon = RegularPolygon(7).scale(2)
        octagon = RegularPolygon(8).scale(2)
        ninegon = RegularPolygon(9).scale(2)
        

        shapes = [circle, triangle, star1, star2, pentagon, hexagon, octagon, star3, star4, star5, star6, square, sevenagon, ninegon]

        # Create a list of shapes
        # shapes = []
        # for i in range(10):
        #     shapes.append(random.choice(possible_shapes))
        # print(shapes)
        
        # for i in range(9):
        #     self.play(ReplacementTransform(shapes[i], shapes[i+1]))
        #     self.wait()

        def get_new_shape(old_shape, old_color):
            # Change the color and shape
            old_color_index = colors.index(old_color)
            available_colors = colors[:old_color_index] + colors[old_color_index+1:]
            color = random.choice(available_colors)

            # Choose a random shape
            old_shape_index = shapes.index(old_shape)
            available_shapes = shapes[:old_shape_index] + shapes[old_shape_index+1:]
            print(available_shapes)
            new_shape = random.choice(available_shapes)
            print(new_shape)

            new_shape.set_color(color)
            new_shape.set_fill(color, opacity=1)
            return new_shape, color
        
        shape_list = [star1]
        color_list = [RED_E]
        self.play(Create(shape_list[0]))
        for i in range(1, 1000):
            new = get_new_shape(shape_list[i-1], color_list[i-1])
            shape_list.append(new[0])
            color_list.append(new[1])
        
        def transform_shape(old_shape, new_shape, new_color):
            new_shape.set_color(new_color)
            random_coords = [random.uniform(-5, 5), random.uniform(-1.75, 1.75), 0]
            random_angle = random.randint(0, 360)
            new_shape.rotate(random_angle * DEGREES)
            random_size = random.uniform(0.75, 1.25)
            new_shape.scale(random_size)
            new_shape.move_to(random_coords)
            print([old_shape, new_shape])
            self.play(ReplacementTransform(old_shape, new_shape), run_time=5)

        for i in range(1, 1000):
            transform_shape(shape_list[i-1], shape_list[i], color_list[i])
            self.wait(0.3)


        # def change_shape(old_shape, old_color):
        #     # find index of old color
        #     old_color_index = colors.index(old_color)
        #     available_colors = colors[:old_color_index] + colors[old_color_index+1:]
        #     print(available_colors)
        #     # Choose a random color
        #     color = random.choice(available_colors)
        #     print(color)
        #     # Choose a random shape
        #     old_shape_index = shapes.index(old_shape)
        #     available_shapes = shapes[:old_shape_index] + shapes[old_shape_index+1:]
        #     new_shape = random.choice(available_shapes)
        #     print(new_shape)
        #     # Change the color and shape
        #     new_shape.set_color(color)
        #     self.play(ReplacementTransform(old_shape, new_shape))
        #     return [new_shape, color]
        
        # current_shape = square
        # current_color = RED
        # for i in range(10):
        #     current = change_shape(current_shape, current_color)
        #     current_shape = current[0]
        #     current_color = current[1]
        #     self.wait()