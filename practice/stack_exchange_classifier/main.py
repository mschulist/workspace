# Enter your code here. Read input from STDIN. Print output to STDOUT
import json
import pandas as pd

from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
import spacy_sentence_bert
from tqdm import tqdm
import numpy as np


training_file = "data/training.json"

TOPIC_KEY = "topic"
EXCERPT_KEY = "excerpt"
QUESTION_KEY = "question"

with open(training_file, "r") as f:
    training_data: list[dict[str, str]] = []
    data = f.read().splitlines()
    del data[0]  # first line is just number of entries
    for d in data:
        training_data.append(json.loads(d))


def get_classes(data: list[dict[str, str]]):
    classes: set = set()
    for example in data:
        classes.add(example[TOPIC_KEY])

    return classes


all_classes = get_classes(training_data)


data_df = pd.DataFrame(training_data)

# steps:
# 1. generate feature embeddings for each headline
# 2. use a random forest to classify the embeddings
# 3. read in test data and see how well the classifier does

# 1. generating feature embeddings


nlp = spacy_sentence_bert.load_model("en_stsb_distilbert_base")

test = "This is a test sentence"
print(nlp(test).vector)

data_df["all_text"] = data_df[QUESTION_KEY] + data_df[EXCERPT_KEY]

X_train, X_test, y_train, y_test = train_test_split(
    data_df["all_text"],
    data_df[TOPIC_KEY],
    test_size=0.90,
    stratify=data_df[TOPIC_KEY],
)

embeddings = np.array([nlp(text).vector for text in tqdm(X_train)])


print(embeddings)


# 2. random forest classifier
# we don't need to split data because the test is already separate

classifier = RandomForestClassifier(verbose=10).fit(embeddings, y_train)


# 3. read in test data

test_path = "data/input00.txt"
test_y = "data/output00.txt"

with open(test_path, "r") as f:
    test_data: list[dict[str, str]] = []
    data = f.read().splitlines()
    del data[0]  # first line is just number of entries
    for d in data:
        test_data.append(json.loads(d))


with open(test_y, "r") as f:
    test_y = f.read().splitlines()
    for i in range(len(test_y)):
        test_data[i][TOPIC_KEY] = test_y[i]

test_df = pd.DataFrame(test_data)

test_df["all_text"] = test_df[QUESTION_KEY] + test_df[EXCERPT_KEY]

test_subset, _, test_y, _ = train_test_split(
    test_df["all_text"],
    test_df[TOPIC_KEY],
    test_size=0.95,
    stratify=test_df[TOPIC_KEY],
)


test_embeddings = np.array([nlp(text).vector for text in tqdm(test_subset)])

predictions = classifier.predict(test_embeddings)

print(np.mean(predictions == test_y))
