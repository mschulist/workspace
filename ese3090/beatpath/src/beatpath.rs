use itertools::Itertools;
use std::cmp;

fn index(n: usize, row: usize, col: usize) -> usize {
    row * n + col
}

fn get_d_matrix(profile: Vec<Vec<i32>>) -> Vec<i32> {
    let n_candidates = profile[0].len();
    let n_voters = profile.len();

    // Initialize 1D d_matrix with size n_candidates * n_candidates
    let mut d_matrix = vec![0; n_candidates * n_candidates];

    for comb in (0..n_candidates).combinations(2) {
        let a = comb[0];
        let b = comb[1];
        for i in 0..n_voters {
            if profile[i][a] < profile[i][b] {
                d_matrix[index(n_candidates, a, b)] += 1;
            } else {
                d_matrix[index(n_candidates, b, a)] += 1;
            }
        }
    }

    for i in 0..n_candidates {
        for j in 0..n_candidates {
            if i == j {
                d_matrix[index(n_candidates, i, j)] = 0;
            } else if d_matrix[index(n_candidates, i, j)] > d_matrix[index(n_candidates, j, i)] {
                d_matrix[index(n_candidates, j, i)] = 0;
            }
        }
    }

    d_matrix
}

fn get_p_matrix(d_matrix: Vec<i32>, n_candidates: usize) -> Vec<i32> {
    let mut p_matrix = vec![0; n_candidates * n_candidates];

    for cand1 in 0..n_candidates {
        for cand2 in 0..n_candidates {
            if cand1 != cand2 {
                let strength = d_matrix[index(n_candidates, cand1, cand2)];
                if strength > d_matrix[index(n_candidates, cand2, cand1)] {
                    p_matrix[index(n_candidates, cand1, cand2)] = strength;
                }
            }
        }
    }

    for cand1 in 0..n_candidates {
        for cand2 in 0..n_candidates {
            if cand1 != cand2 {
                for cand3 in 0..n_candidates {
                    if cand3 != cand1 && cand3 != cand2 {
                        let curr_value = p_matrix[index(n_candidates, cand2, cand3)];
                        let new_value = cmp::min(
                            p_matrix[index(n_candidates, cand1, cand3)],
                            p_matrix[index(n_candidates, cand2, cand1)],
                        );
                        if new_value > curr_value {
                            p_matrix[index(n_candidates, cand2, cand3)] = new_value;
                        }
                    }
                }
            }
        }
    }

    p_matrix
}

fn rank_p(p_matrix: Vec<i32>, n_candidates: usize) -> Vec<i32> {
    let mut ranking = vec![0; n_candidates];

    for i in 0..n_candidates {
        for j in 0..n_candidates {
            if i != j {
                if p_matrix[index(n_candidates, i, j)] < p_matrix[index(n_candidates, j, i)] {
                    ranking[i] += 1;
                }
            }
        }
    }

    ranking
}

pub fn compute_beatpath_ranking(profile: Vec<Vec<i32>>) -> Vec<i32> {
    let n_candidates = profile[0].len();
    let d_matrix = get_d_matrix(profile);
    let p_matrix = get_p_matrix(d_matrix, n_candidates);
    let ranking = rank_p(p_matrix, n_candidates);

    ranking
}
