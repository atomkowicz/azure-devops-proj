# azure-devops-proj

## Steps:

### CI set up Azure Cloud Shell

1. Clone Github repository

2. Create the Python Virtual Environment

```
python3 -m venv ~/.azure-devops-proj
source ~/.azure-devops-proj/bin/activate
```

3. Add files to proj, create sample py file and test

4. Local tests

```
make all
```

### Configure Github Actions

1. Enable Github Actions

2. Update yml code

3. Verify tests pass

![CI](https://github.com/atomkowicz/azure-devops/workflows/CI/badge.svg)
