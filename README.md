# TSTBC_STB: Paper Experiment Code

This repository contains the main experiment code for a multi-task encrypted traffic classification study. The extracted code is organized for paper-style reproducibility while excluding large datasets, generated artifacts, caches, and trained weights.

## Repository Layout

```text
.
|-- README.md
|-- Makefile
|-- requirements.txt
|-- dataset.py
|-- preprocess.py
|-- train.py
|-- test.py
|-- models/
|   |-- TSTBC_STB.py      
|   |-- TSTBC_ST.py      
|   |-- one_d_cnn.py      
|   `-- tcn.py            
`-- data/
    |-- README.md         # dataset link and placement notes
    `-- .gitkeep
```

## Environment

Python 3.8 is recommended.

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

On Windows PowerShell:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

## Data Preparation

Large data files are excluded from this code package. Add the dataset links in `data/README.md`, download the raw packet captures or prepared dataset files, and place them under the expected folders.

Expected generated files for training and testing:

```text
data/vpn/train_data_rows.pkl
data/vpn/val_data_rows.pkl
data/vpn/test_data_rows.pkl
```

If starting from raw packet capture files, place them under a local data folder according to the preprocessing configuration in `preprocess.py`, then run:

```bash
make preprocess
```

## Experiment Design

The experiment is designed as a multi-task classification pipeline for encrypted traffic. Each sample is represented as a fixed-length packet-byte feature sequence, and each model predicts three labels:

1. Traffic category label.
2. Application category label.
3. Auxiliary binary or coarse-grained label.

The intended experiment flow is:

1. Prepare the dataset files described in `data/README.md`.
2. Run preprocessing to generate train, validation, and test pickle files.
3. Train the main model and baseline models with the same train/validation/test split.
4. Evaluate the trained models on the test split.
5. Report metrics and confusion matrices in the paper or supplementary material.

This README describes the experimental design and execution commands only. It does not include experiment results.

## Training

Train all models:

```bash
make train-all
```

Train individual models:

```bash
make train-TSTBC_STB
make train-TSTBC_ST
make train-1d-cnn
make train-tcn
```

The training script saves model weights with filenames derived from each model class name, for example:

```text
TSTBC_STB_model.pt
TSTBC_ST_model.pt
```

Weights are generated artifacts and should not be committed.

## Testing

After preparing data and trained weights, run:

```bash
python -m test
```

The test script computes task-level metrics and can generate confusion-matrix images under `results/`. Generated result files should not be committed.

## Reproducibility Notes

- Keep the train/validation/test split fixed when comparing models.
- Use the same preprocessing settings for all models.
- Record the exact dataset version or download link in `data/README.md`.
- Record hardware, Python version, PyTorch version, and random seeds in the final experiment report.
- Do not commit raw packet captures, pickle datasets, model checkpoints, logs, or generated figures.

## License

See `LICENSE`.
