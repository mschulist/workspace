### A Pluto.jl notebook ###
# v0.14.9

using Markdown
using InteractiveUtils

# ╔═╡ 06704122-7be2-11ee-0351-ef28b3ac776a
begin
	using Images
end

# ╔═╡ 741c8515-c365-453d-a474-cb7dc35f22e3
v = [1,2,3,4]

# ╔═╡ 5fbfd593-72ea-420a-ab89-af3641ff093b
size(v)

# ╔═╡ 6bd0c381-34cd-4b1d-980c-9d98ecf43c03
w = [1 2 3 
	4 5 6]

# ╔═╡ 6f27c703-75e6-4a09-9155-fc7898d2a235
size(w)

# ╔═╡ bbfb4194-1fea-4d99-a4fa-b91a9f7f26b3
w[1,2]

# ╔═╡ 840253e6-2ae9-4664-94ff-dc9b211b77a7
A1 = rand(1:9, 3, 4)

# ╔═╡ ce4bd67f-46eb-4b1d-bbca-b39d70286186
colors = distinguishable_colors(6)

# ╔═╡ 1211a2e6-3735-49cb-9e27-66bbefa679ce
A3 = rand(colors, 10, 10)

# ╔═╡ d4dc5fb6-84b0-42b9-9e7f-60df713e4b30
D = [i*j for i=1:5, j=1:5]

# ╔═╡ Cell order:
# ╠═06704122-7be2-11ee-0351-ef28b3ac776a
# ╠═741c8515-c365-453d-a474-cb7dc35f22e3
# ╠═5fbfd593-72ea-420a-ab89-af3641ff093b
# ╠═6bd0c381-34cd-4b1d-980c-9d98ecf43c03
# ╠═6f27c703-75e6-4a09-9155-fc7898d2a235
# ╠═bbfb4194-1fea-4d99-a4fa-b91a9f7f26b3
# ╠═840253e6-2ae9-4664-94ff-dc9b211b77a7
# ╠═ce4bd67f-46eb-4b1d-bbca-b39d70286186
# ╠═1211a2e6-3735-49cb-9e27-66bbefa679ce
# ╠═d4dc5fb6-84b0-42b9-9e7f-60df713e4b30
