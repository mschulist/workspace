import csv

# List of all U.S. states
all_states = [
    "Alabama",
    "Alaska",
    "Arizona",
    "Arkansas",
    "California",
    "Colorado",
    "Connecticut",
    "Delaware",
    "Florida",
    "Georgia",
    "Hawaii",
    "Idaho",
    "Illinois",
    "Indiana",
    "Iowa",
    "Kansas",
    "Kentucky",
    "Louisiana",
    "Maine",
    "Maryland",
    "Massachusetts",
    "Michigan",
    "Minnesota",
    "Mississippi",
    "Missouri",
    "Montana",
    "Nebraska",
    "Nevada",
    "New Hampshire",
    "New Jersey",
    "New Mexico",
    "New York",
    "North Carolina",
    "North Dakota",
    "Ohio",
    "Oklahoma",
    "Oregon",
    "Pennsylvania",
    "Rhode Island",
    "South Carolina",
    "South Dakota",
    "Tennessee",
    "Texas",
    "Utah",
    "Vermont",
    "Virginia",
    "Washington",
    "West Virginia",
    "Wisconsin",
    "Wyoming",
    "District of Columbia",
]

print(len(all_states))

# Read states from the CSV file
csv_file = "data/state_groups2.csv"
csv_states = []

with open(csv_file, mode="r") as file:
    reader = csv.DictReader(file)
    for row in reader:
        csv_states.append(row["state"])

print("CSV len", len(csv_states))

# Find missing states
missing_states = set(all_states) - set(csv_states)

print("Missing states:")
for state in sorted(missing_states):
    print(state)
