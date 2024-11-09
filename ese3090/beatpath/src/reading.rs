use csv::ReaderBuilder;

pub fn read_profile(path: &str) -> Vec<Vec<i32>> {
    let mut profile = Vec::new();

    let mut reader = ReaderBuilder::new()
        .has_headers(false)
        .from_path(path)
        .unwrap();

    for result in reader.records() {
        let record = result.unwrap();

        let mut row = Vec::new();

        for field in record.iter() {
            let value = field.parse::<i32>().unwrap();
            row.push(value);
        }
        profile.push(row);
    }

    profile
}
