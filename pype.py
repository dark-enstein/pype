# update the memory with an array of pypi packages
# check through the pypi packages for a match using binary search
# return a success/failure response and the appropriate exit code

import requests
import sys

args = sys.argv
packages = args[1]

res = requests.get("https://pypi.org/project/" + packages)
# print(res.content)
if res.status_code == 404:
    exit(1)
elif res.status_code == 200:
    exit(0)
