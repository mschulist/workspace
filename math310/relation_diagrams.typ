#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge

#let check_symmetric(relations, rel) = {
  let other_way = (rel.at(1), rel.at(0))
  if other_way == rel {
    return false
  }
  return (rel in relations) and (other_way in relations)
}


#let relation_diagram(relations) = {
  let node_map = (
    a: (0, -1),
    b: (-1, 0),
    c: (1, 0),
  )
  figure(
    diagram(
      node(node_map.at("a"), $a$),
      node(node_map.at("b"), $b$),
      node(node_map.at("c"), $c$),
      for r in relations {
        let start = node_map.at(r.at(0))
        let end = node_map.at(r.at(1))
        if check_symmetric(relations, r) {
          edge(start, end, stroke: red, "<|-|>")
        } else {
          if start != end {
            edge(start, end, stroke: green, "-|>")
          } else {
            if start == node_map.at("b") {
              edge(start, end, stroke: blue, "-|>", bend: -135deg)
            } else if start == node_map.at("c") {
              edge(start, end, stroke: blue, "-|>", bend: -135deg)
            } else {
              edge(start, end, stroke: blue, "-|>", bend: 135deg)
            }
          }
        }
      },
    ),
  )
}
