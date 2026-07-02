train-all: train-1d-cnn train-TSTBC_ST train-tcn train-TSTBC_STB

# Data preprocessing
preprocess:
	python -m preprocess

# Model training
train-1d-cnn:
	python -m models.one_d_cnn

train-TSTBC_ST:
	python -m models.TSTBC_ST

train-tcn:
	python -m models.tcn

train-TSTBC_STB:
	python -m models.TSTBC_STB
