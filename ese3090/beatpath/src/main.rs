mod beatpath;

use beatpath::compute_beatpath_ranking;

fn main() {
    let profile: Vec<Vec<i32>> = vec![
        vec![0, 1, 2, 3],
        vec![0, 2, 3, 1],
        vec![2, 0, 1, 3],
        vec![3, 1, 2, 0],
        vec![3, 1, 2, 0],
    ];

    let ranking = compute_beatpath_ranking(profile);

    println!("{:?}", ranking);
}
