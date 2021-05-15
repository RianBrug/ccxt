# -*- coding: utf-8 -*-

import os
import sys
import time
from datetime import datetime
import plotly.graph_objects as go
from plotly.subplots import make_subplots

# -----------------------------------------------------------------------------

root = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
sys.path.append(root + '/python')

# -----------------------------------------------------------------------------

import ccxt
from matplotlib import pyplot as plt
from matplotlib.backends.backend_pdf import PdfPages
# -----------------------------------------------------------------------------
# common constants

msec = 1000
minute = 60 * msec
hold = 30
#
# exchange_name = ('huobipro')
# sc_pair = 'USDT/HUSD';

# exchange_name = ('binance')
# sc_pair = 'BUSD/USDT';

# exchange_name = ('binanceus')
# sc_pair = 'USDT/USD';

# exchange_name = ('bittrex')
# sc_pair = 'PAX/USD';

exchange_name = ('kraken')
sc_pair = 'DAI/USD';

# -----------------------------------------------------------------------------

# exchange = ccxt.binance({
exchange = ccxt.kraken({
    'rateLimit': 1000,
    'enableRateLimit': True,
    # 'verbose': True,
})

# -----------------------------------------------------------------------------

from_datetime = '2021-05-15 15:30:00'
from_timestamp = exchange.parse8601(from_datetime)

# -----------------------------------------------------------------------------

now = exchange.milliseconds()

# -----------------------------------------------------------------------------

data = []

while from_timestamp < now:

    try:

        print(exchange.milliseconds(), 'Fetching candles starting from', exchange.iso8601(from_timestamp))
        ohlcvs = exchange.fetch_ohlcv(sc_pair, '1m', from_timestamp)
        print(exchange.milliseconds(), 'Fetched', len(ohlcvs), 'candles')
        first = ohlcvs[0][0]
        last = ohlcvs[-1][0]
        print('First candle epoch', first, exchange.iso8601(first))
        print('Last candle epoch', last, exchange.iso8601(last))
        from_timestamp += len(ohlcvs) * minute
        data += ohlcvs

    except (ccxt.ExchangeError, ccxt.AuthenticationError, ccxt.ExchangeNotAvailable, ccxt.RequestTimeout) as error:

        print('Got an error', type(error).__name__, error.args, ', retrying in', hold, 'seconds...')
        time.sleep(hold)
# format the data to match the charting library
dates = []
open_data = []
high_data = []
low_data = []
close_data = []
volume_data = []

for candle in data:
    dates.append(datetime.fromtimestamp(candle[0] / 1000.0).strftime('%Y-%m-%d %H:%M:%S.%f'))
    open_data.append(candle[1])
    high_data.append(candle[2])
    low_data.append(candle[3])
    close_data.append(candle[4])
    volume_data.append(candle[5])

# Create figure with secondary y-axis
fig = make_subplots(specs=[[{"secondary_y": True}]])


# plot the candlesticks
fig.add_trace(go.Candlestick(name='<b>Candlesticks</b>', x=dates,
                       open=open_data, high=high_data,
                       low=low_data, close=close_data),
                       secondary_y=True)

# include a go.Bar trace for volumes
fig.add_trace(go.Bar(name='<b>Volume Bars</b>', x=dates, y=volume_data),
                secondary_y=False)

fig.update_layout(
    title=exchange_name+ ":" +sc_pair,
    yaxis_title='<b>Volume</b>',
    xaxis_title='<b>Datetime</b>',
    # shapes = [dict(
    #     y0='2016-12-09', y1='2016-12-09', x0=0, x1=1, xref='x', yref='paper',
    #     line_width=2)],
    # # annotations=[dict(
    # #     x='2016-12-09', y=0.05, xref='x', yref='paper',
    # #     showarrow=False, xanchor='left', text='Increase Period Begins')]
)
fig.update_yaxes(title_text="<b>$ Price</b>", secondary_y=True)

fig.layout.yaxis2.showgrid=False
fig.show()
