import sys
import argparse



parser = argparse.ArgumentParser(description="Input SNO TECA File")
parser.add_argument("filename",
        help = "Input must be a valid SNO .dat file")
args = parser.parse_args()

with open(args.filename,'r') as f:
    #read in the file
    lines = f.readlines()
    lines = [_.rstrip() for _ in lines]
    print lines
f.close()



