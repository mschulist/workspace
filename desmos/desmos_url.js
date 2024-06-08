url = "hereiscoolurl";
url = url.substring(0, 10); // max length of 10 for url

title = "Enter title here";

data = new URLSearchParams();

data.append("my_graphs", false);
data.append("title", title);
data.append("lang", "en");
data.append("is_update", false);
data.append("calc_state", JSON.stringify(Calc.getState()));
data.append("thumb_data", Calc.screenshot());
data.append('graph_hash', url);

fetch("https://www.desmos.com/api/v1/calculator/save", {
  method: "POST",
  body: data,
}).then((response) => {
    if (response.ok) {
        response.json().then((json) => {
        console.log(json);
        window.open("https://www.desmos.com/calculator/" + url, "_blank");
        });
    } else {
        console.log("Failed to save graph");
    }
    });