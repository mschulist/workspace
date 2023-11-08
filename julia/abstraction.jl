### A Pluto.jl notebook ###
# v0.14.9

using Markdown
using InteractiveUtils

# ╔═╡ 7e99979a-40f6-4f1d-bf67-a89a729a039a
using Images

# ╔═╡ 0f9c682e-670c-46ba-bc0c-caf770d3a4dd
keeptrack = [typeof(1), typeof(1.0), typeof("one"), typeof(1//1), typeof([1 2; 3 4])]

# ╔═╡ 2bf1d950-13e2-4cb7-b9be-fa0882d7a102
typeof(keeptrack)

# ╔═╡ b25a0c58-28be-40c6-8941-8418a4882680
cute_one = load(download("https://cdn.pixabay.com/photo/2015/04/04/19/13/one-706897_1280.jpg"))

# ╔═╡ 94f5018c-7be0-11ee-28cf-936c7cb5e423
element = cute_one

# ╔═╡ 1cd96fa0-3f28-40db-a74b-2d7bf39d1eb5
fill(element, 3, 4)

# ╔═╡ 0dffed96-e84b-4909-8faf-3589fa393f77
typeof(element)

# ╔═╡ 3aaa9f91-5073-41a0-a533-e597c00ac5fb


# ╔═╡ Cell order:
# ╠═7e99979a-40f6-4f1d-bf67-a89a729a039a
# ╠═94f5018c-7be0-11ee-28cf-936c7cb5e423
# ╠═1cd96fa0-3f28-40db-a74b-2d7bf39d1eb5
# ╠═0dffed96-e84b-4909-8faf-3589fa393f77
# ╠═0f9c682e-670c-46ba-bc0c-caf770d3a4dd
# ╠═2bf1d950-13e2-4cb7-b9be-fa0882d7a102
# ╠═b25a0c58-28be-40c6-8941-8418a4882680
# ╠═3aaa9f91-5073-41a0-a533-e597c00ac5fb
