use itertools::Itertools;
use std::cmp;

fn get_d_matrix(profile: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
    let n_candidates = profile[0].len();
    let n_voters = profile.len();

    let mut d_matrix = vec![vec![0; n_candidates]; n_candidates];

    for comb in (0..n_candidates).combinations(2) {
        let a = comb[0];
        let b = comb[1];
        for i in 0..n_voters {
            if profile[i][a] < profile[i][b] {
                d_matrix[a][b] += 1;
            } else {
                d_matrix[b][a] += 1;
            }
        }
    }

    for i in 0..n_candidates {
        for j in 0..n_candidates {
            if i == j {
                d_matrix[i][j] = 0;
            } else if d_matrix[i][j] > d_matrix[j][i] {
                d_matrix[j][i] = 0;
            }
        }
    }

    d_matrix
}

fn get_p_matrix(d_matrix: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
    let n_candidates = d_matrix.len();
    let mut p_matrix = vec![vec![0; n_candidates]; n_candidates];

    for cand1 in 0..n_candidates {
        for cand2 in 0..n_candidates {
            if cand1 != cand2 {
                let strength = d_matrix[cand1][cand2];
                if strength > d_matrix[cand2][cand1] {
                    p_matrix[cand1][cand2] = strength;
                }
            }
        }
    }

    for cand1 in 0..n_candidates {
        for cand2 in 0..n_candidates {
            if cand1 != cand2 {
                for cand3 in 0..n_candidates {
                    if cand3 != cand1 && cand3 != cand2 {
                        let curr_value = p_matrix[cand2][cand3];
                        let new_value = cmp::min(p_matrix[cand1][cand3], p_matrix[cand2][cand1]);
                        if new_value > curr_value {
                            p_matrix[cand2][cand3] = new_value;
                        }
                    }
                }
            }
        }
    }

    return p_matrix;
}

fn rank_p(p_matrix: Vec<Vec<i32>>) -> Vec<i32> {
    let n_candidates = p_matrix.len();
    let mut ranking = vec![0; n_candidates];

    for i in 0..n_candidates {
        for j in 0..n_candidates {
            if i != j {
                if p_matrix[i][j] > p_matrix[j][i] {
                    ranking[i] += 1;
                }
            }
        }
    }

    return ranking;
}

pub fn compute_beatpath_ranking(profile: Vec<Vec<i32>>) -> Vec<i32> {
    let d_matrix = get_d_matrix(profile);
    let p_matrix = get_p_matrix(d_matrix);
    let ranking = rank_p(p_matrix);

    return ranking;
}
