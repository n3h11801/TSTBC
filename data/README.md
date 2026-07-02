# Data Files

- Dataset link: https://mcfp.felk.cvut.cz/publicDatasets/    https://www.stratosphereips.org/datasets-normal    https://www.stratosphereips.org/datasets-malware   https://www.stratosphereips.org/datasets-ctu13

Expected files after download or preprocessing:

```text
data/vpn/train_data_rows.pkl
data/vpn/val_data_rows.pkl
data/vpn/test_data_rows.pkl
```

Suggested workflow:

1. Download the raw packet captures or prepared dataset archive from the links above.
2. If using raw packet captures, place them in the location expected by `preprocess.py` and run `make preprocess`.
3. If using prepared pickle files, place them directly under `data/vpn/`.
4. Keep all large data files out of version control.
