import networkx as nx
import geopandas as gpd
import matplotlib.pyplot as plt

state_dict = {"MO": "data/tl_2021_29_bg"}


def plot_on_map(graph: nx.Graph, plan: dict, state: str, ax: plt.Axes | None = None):
    ip_list = [[i, p] for (i, p) in plan.items()]
    plan_gdf = gpd.GeoDataFrame(ip_list, columns=["graph_id", "district"])

    geoids = []
    for i, row in plan_gdf.iterrows():
        geoids.append(int(graph.nodes[row["graph_id"]]["GEOID20"]))

    plan_gdf["GEOID"] = geoids

    az_bg_map: gpd.GeoDataFrame = gpd.read_file(state_dict[state])

    az_bg_map["GEOID"] = az_bg_map["GEOID"].astype(int)

    az_bg_map = az_bg_map.merge(plan_gdf, on="GEOID")

    if ax is None:
        fig, ax = plt.subplots(figsize=(10, 10))
    else:
        ax.cla()

    az_bg_map.plot(column="district", ax=ax)
