### A Pluto.jl notebook ###
# v0.14.9

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 62c5d5a3-578d-467c-aa3e-01e3a99ce159
begin
	using Images
	philip = load("philip.jpg")
end

# ╔═╡ 24c1cf2d-17c5-4dd5-b4ae-eff1ce8f4f66
using PlutoUI

# ╔═╡ 27c66e18-7b7a-11ee-28db-7b777fd89314
url = "https://i.imgur.com/VGPeJ6s.jpg"

# ╔═╡ 25868c1e-61b4-44eb-b6d0-834926f676a5
download(url, "philip.jpg")

# ╔═╡ 47884e1e-0912-42ac-a7ae-cf6a19acb0a8
typeof(philip)

# ╔═╡ 4112894e-f40b-421d-a8da-958583698593
RGBX(0.5, 1, 0.5)

# ╔═╡ c0a68b88-9d3a-410a-93db-ef8d97b8d985
size(philip)

# ╔═╡ a44feaae-e269-46fa-92ea-5d2f675a67b5
philip[1:100,1:550]

# ╔═╡ 138e9f3f-2701-4c0d-8093-61f827be1f17
begin
	(h, w) = size(philip)
	head = philip[(h ÷ 2):h, (w ÷ 10): (9w ÷ 10)]
end

# ╔═╡ fb2ec545-18d8-4edf-a83b-ef389cfc4afa
[head head]

# ╔═╡ d716ca84-0327-491c-abc6-ad04db8f9ffb
begin
	new_phil = copy(philip)
	new_phil[1:100, 1:300] .= RGB(1,0,0)
	new_phil
end

# ╔═╡ 087e8d72-20f8-4539-ba1e-14ed755c7c67
function redify(c)
	return RGB(c.r, 0, 0)
end

# ╔═╡ c78ec942-ac4c-48a0-923b-35b497058aed
begin
	redify.(philip)
end

# ╔═╡ 9124e2e4-0efa-4205-85e4-78e44b49e628
@bind 

# ╔═╡ Cell order:
# ╠═27c66e18-7b7a-11ee-28db-7b777fd89314
# ╠═25868c1e-61b4-44eb-b6d0-834926f676a5
# ╠═62c5d5a3-578d-467c-aa3e-01e3a99ce159
# ╠═47884e1e-0912-42ac-a7ae-cf6a19acb0a8
# ╠═4112894e-f40b-421d-a8da-958583698593
# ╠═c0a68b88-9d3a-410a-93db-ef8d97b8d985
# ╠═a44feaae-e269-46fa-92ea-5d2f675a67b5
# ╠═138e9f3f-2701-4c0d-8093-61f827be1f17
# ╠═fb2ec545-18d8-4edf-a83b-ef389cfc4afa
# ╠═d716ca84-0327-491c-abc6-ad04db8f9ffb
# ╠═087e8d72-20f8-4539-ba1e-14ed755c7c67
# ╠═c78ec942-ac4c-48a0-923b-35b497058aed
# ╠═24c1cf2d-17c5-4dd5-b4ae-eff1ce8f4f66
# ╠═9124e2e4-0efa-4205-85e4-78e44b49e628
