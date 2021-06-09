import pandas as pd
from sqlalchemy import create_engine # database connection
import datetime as dt
from IPython.display import display

import chart_studio.plotly as py # interactive graphing
from plotly.graph_objs import Bar, Scatter, Marker, Layout

# Initializes database with filename sc_pair_ohlcv.db in current directory
disk_engine = create_engine('sqlite:///sc_pair_ohlcv.db')

start = dt.datetime.now()
chunksize = 20000
j = 0
index_start = 1

for df in pd.read_csv('sc_pairs_ohlcv_2021-05-20_19:51:43.csv', chunksize=chunksize, iterator=True, encoding='utf-8'):

    df = df.rename(columns={c: c.replace(' ', '') for c in df.columns}) # Remove spaces from columns

    # df['timestamp'] = pd.to_datetime(df['timestamp']) # Convert to datetimes
    # df['ClosedDate'] = pd.to_datetime(df['ClosedDate'])

    df.index += index_start

    # # Remove the un-interesting columns
    # columns = ['Agency', 'CreatedDate', 'ClosedDate', 'ComplaintType', 'Descriptor',
    #            'CreatedDate', 'ClosedDate', 'TimeToCompletion',
    #            'City']
    #
    # for c in df.columns:
    #     if c not in columns:
    #         df = df.drop(c, axis=1)


    j+=1
    print('{} seconds: completed {} rows'.format((dt.datetime.now() - start).seconds, j*chunksize))

    df.to_sql('data', disk_engine, if_exists='append')
    index_start = df.index[-1] + 1
