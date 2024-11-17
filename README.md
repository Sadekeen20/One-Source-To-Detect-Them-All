# Speech-Based Gender, Age, and Emotion Detection

This repository contains the implementation of a system for detecting **gender**, **age**, and **emotion** from speech audio files. The project is designed to use a single approach to address all three tasks by extracting statistical features from the audio frequency spectrum and applying machine learning techniques. The system has potential applications in telecommunications, customer analytics, and human-computer interaction.

---

## Features
- **Gender Detection**: Predicts the gender (male or female) of the speaker.
- **Age Prediction**: Classifies speakers into age categories (young, mature, and old).
- **Emotion Recognition**: Identifies the speaker's emotional state (happy, sad, angry).

---

## Methodology

### 1. **Datasets**
- **Mozilla Common Voice Dataset**:
  - Used for gender and age detection.
  - Filtered to retain quality audio samples with upvotes ≥2 and no missing attributes.
  - Gender classes: Male, Female.
  - Age groups: Young (teens, twenties), Mature (thirties, forties, fifties), Old (sixties+).

- **RAVDESS Dataset**:
  - Used for emotion detection.
  - Focused on three emotions: Happy, Sad, Angry.

### 2. **Feature Extraction**
- Extracted 20 statistical features from audio using **Frequency Spectrum Analysis** (FSA) in R:
  - Examples: Mean frequency (`meanfreq`), spectral entropy (`sp.ent`), spectral flatness (`sfm`), skewness (`skew`), and kurtosis (`kurt`).

### 3. **Machine Learning Models**
- **Algorithms**:
  - Random Forest, CatBoost, Gradient Boosting, K-Nearest Neighbors (KNN), XGBoost, AdaBoost, Decision Tree, Artificial Neural Networks (ANN), Naive Bayes, and Support Vector Machine (SVM).
- **Training**:
  - Dataset split: 80% training, 20% testing.
  - Handled class imbalance with **SMOTE**.
  - Performance evaluated using accuracy, precision, recall, F1-score, and 10-fold cross-validation.

---

## Results

| Task               | Best Model     | Test Accuracy | Key Features                  |
|--------------------|----------------|---------------|-------------------------------|
| **Gender Detection** | CatBoost       | 96.4%         | `meanfun`, `maxfun`, `Q25`    |
| **Age Prediction**   | Random Forest  | 70.4%         | `sfm`, `Q25`, `meanfun`       |
| **Emotion Detection**| XGBoost        | 66.1%         | `Q25`, `mode`, `meandom`      |

- **Limitations**:
  - Emotion dataset was relatively small.
  - Performance drops for overlapping voices (multiple speakers in the same audio).

---

## Reference

This work is based on the research paper:  
[**One Source to Detect Them All: Gender, Age, and Emotion Detection from Voice**](https://ieeexplore.ieee.org/document/9529731).

---

## Contributions

We welcome contributions! Follow these steps to contribute:
1. Fork the repository.
2. Create a new branch for your feature/bug fix.
3. Commit your changes and push them to your fork.
4. Open a pull request.

---

## Citation

If you use this project, please cite it as follows:
```
@article{speechdetection2024,
  title={One Source to Detect Them All: Gender, Age, and Emotion Detection from Voice},
  author={Syed Rohit Zaman, Dipan Sadekeen, M Aqib Alfaz, Rifat Shahriyar},
  year={2024},
  journal={IEEE},
  url={https://ieeexplore.ieee.org/document/9529731}
}
```

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
