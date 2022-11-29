# DCM

## Introduction

## Usage

### Build

```
docker build -t dcm:latest .
```

### Run

```
docker run --rm \
    -v $PWD/sample-data:/data \
    dcm:latest \
    data/inputs/data_exampleDCM.xlsx /data/outputs
```
