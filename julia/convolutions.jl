### A Pluto.jl notebook ###
# v0.14.9

using Markdown
using InteractiveUtils

# ╔═╡ 0d79f638-eb5b-4cf8-936b-de58581d6226
begin
	using Images
	using Statistics
	using FFTW
	using Plots
	using DSP
	using ImageFiltering
	using PlutoUI
end	

# ╔═╡ e2393350-7be3-11ee-24b3-038fb11b11b4
# begin
# 	large_image = load("philip.jpg")
# 	image = shrink_image(large_image, 7)
# end

# ╔═╡ 82030da5-df85-42b9-9119-ec565bfcb99c
kernel = Kernel.gaussian((1,1))

# ╔═╡ 4a74195c-a554-4f36-939b-60665345f004
kernel[0,0]

# ╔═╡ 588ecb8c-40b7-45c0-b9ef-92fe67a86dc8
# function show_colored_kernel(kernel)
# 	to_rbg(x) = RGB(max(-x,0), max(x,0),0)
# 	to_rgb.(kernel) / maximum(abs.(kernel))
# end

# ╔═╡ 00df52cd-dd8c-4ce8-98d7-39d887a81292
# show_colored_kernel(kernel)

# ╔═╡ Cell order:
# ╠═0d79f638-eb5b-4cf8-936b-de58581d6226
# ╠═e2393350-7be3-11ee-24b3-038fb11b11b4
# ╠═82030da5-df85-42b9-9119-ec565bfcb99c
# ╠═4a74195c-a554-4f36-939b-60665345f004
# ╠═588ecb8c-40b7-45c0-b9ef-92fe67a86dc8
# ╠═00df52cd-dd8c-4ce8-98d7-39d887a81292
