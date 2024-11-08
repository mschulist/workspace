mod beatpath;
mod reading;

use beatpath::compute_beatpath_ranking;
use reading::read_profile;

fn main() {
    // let profile: Vec<Vec<i32>> = vec![
    //     vec![0, 1, 2, 3],
    //     vec![0, 2, 3, 1],
    //     vec![2, 0, 1, 3],
    //     vec![3, 1, 2, 0],
    //     vec![3, 1, 2, 0],
    // ];

    let before_time = std::time::Instant::now();
    let profile = read_profile("data/profile2.csv");
    let after_time = std::time::Instant::now();

    println!("Time to read: {:?}", after_time - before_time);

    let before_time = std::time::Instant::now();
    let ranking = compute_beatpath_ranking(profile);
    let after_time = std::time::Instant::now();

    println!("Time to compute: {:?}", after_time - before_time);

    println!("{:?}", ranking);
}
