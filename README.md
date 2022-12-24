## simple python script to check if a package exists on pypi or not in an ubuntu ci environment
<p> pype requires the python version on the ci environment to be python3 </p>

```usage: sh setup.sh; pype <package-name>''```

<p> the exit code returned identifies the status of the package </p>

| Exit code | Meaning                |
|-----------|------------------------|
| 0         | Package exists in Pypi |
| 1         | Package doesn't exist  |