#!/usr/bin/env python3
from j2_preprocess import j2_preprocess
import sys

# Check number of arguments
if len(sys.argv) != 2:
    print("Usage: %s <path/to/template>" % (sys.argv[0]))
    exit(1)

input_file = sys.argv[1]

# Template arguments
variables = {
    "fruits": [
        ("apple", 10),
        ("pear", 9),
        ("cherry", 11)
    ]
}

# Render the template
print(j2_preprocess(input_file, variables))

