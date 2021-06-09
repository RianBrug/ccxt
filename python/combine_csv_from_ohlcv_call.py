import os
import glob
import pandas as pd
from datetime import datetime

#set working directory
os.chdir("/home/ribs/Documents/ccxt/python/csv_exports")

# datetime object containing current date and time
now = datetime.now()

# dd/mm/YY H:M:S
dt_string = now.strftime("%Y-%m-%d_%H:%M:%S")


interesting_files = glob.glob("/home/ribs/Documents/ccxt/python/csv_exports/*.csv")
df = pd.concat((pd.read_csv(f, header = 0) for f in interesting_files))
df.to_csv("sc_pairs_ohlcv_"+dt_string+".csv")

print("Combination done. File located at /csv_exports/sc_pairs_ohlcv_"+dt_string+".csv")
