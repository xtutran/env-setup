## Create kernel from share Anaconda
```bash
export PATH=<share Anaconda path>/bin:$PATH
```

### Show list of current enviroments
```bash
conda env list
```

### Create kernel
```bash
source activate <active conda env>
python -m ipykernel install --user --name "<active coda env>" --display-name "<kernel display name>"
``` 

### Install packages
#### With internet
```bash
source activate <active conda env>
python -m pip install <package name>
```
#### Without internet
 - Download the package from a computer has internet
```bash
pip download <package name>
```
 - Copy and install the local package for no internet computer
```bash
python -m pip install --no-index --find-links=<copied package path> <package name>
```

### Print out list kernel specs
```bash
jupyter kernelspec list
```

