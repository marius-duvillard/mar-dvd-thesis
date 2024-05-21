from manim import *


class GaussianAndStem(Scene):
    def construct(self):
        self.camera.background_color = WHITE
        # Gaussian curve
        gaussian_curve = self.get_gaussian_curve()
        
        # Stem plot
        stem_plot = self.get_stem_plot()
        self.add(stem_plot)
        self.add(gaussian_curve)
        # self.play(Write(gaussian_curve), Write(stem_plot)) 
        self.wait()

    def get_gaussian_curve(self, x_mean, intensty):
        axes = Axes(
            x_range=[-5, 5, 1],
            y_range=[0, 1, 0.5],
            axis_config={"color": BLUE},
        )
        gaussian = lambda x: (1 / np.sqrt(2 * np.pi)) * np.exp(-0.5 * (x - x_mean)**2)
        graph = axes.plot(gaussian, color=BLUE)  # Définit la couleur de la courbe
        return graph

    def get_stem_plot(self):
        data = [(x, 0.4,0) for x in range(-5, 6)]
        stem_plot = []
        for point in data:
            stem = Line(point + np.array([0, 0,0]), point + np.array([0, 0.8,0]), color=RED)
            particle = Dot(point, color= RED)
            stem_plot.append(stem)
            stem_plot.append(particle)
        return VGroup(*stem_plot)

