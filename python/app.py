import os
import sys
import time
from datetime import datetime
import plotly.graph_objects as go
import plotly.express as px
from plotly.subplots import make_subplots
import ccxt
from matplotlib import pyplot as plt
from matplotlib.backends.backend_pdf import PdfPages
from pandas import DataFrame
from sqlalchemy import create_engine # database connection
from IPython.display import display
from pathlib import Path

root = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
sys.path.append(root + '/python')

msec = 1000
minute = 60 * msec
hold = 30

# exchange_name = ('gateio')
# sc_pair = 'FEIUSDT';
# sc_pair = 'USDCUSDT';
# sc_pair = 'FRAXUSDT'
# sc_pair_with_slash = 'FEI/USDT';
# sc_pair_with_slash = 'USDC/USDT';
# sc_pair_with_slash = 'FRAX/USDT'

# exchange_name = ('cex')
# sc_pair = 'GUSDUSD';
# sc_pair_with_slash = 'GUSD/USD';

# exchange_name = ('gateio')
# sc_pair = 'BUSDUSDT';
# sc_pair_with_slash = 'BUSD/USDT';

# exchange_name = ('huobipro')
# sc_pair = 'USDTHUSD';
# sc_pair_with_slash = 'USDT/HUSD';

# exchange_name = ('huobipro')
# sc_pair = 'USDTHUSD';
# sc_pair_with_slash = 'USDT/HUSD';

# exchange_name = ('binance')
# sc_pair = 'SUSDUSDT';
# sc_pair = 'USDCBUSD';
# sc_pair = 'USDCUSDT';
# sc_pair_with_slash = 'SUSD/USDT';
# sc_pair_with_slash = 'USDC/BUSD';
# sc_pair_with_slash = 'USDC/USDT';

# exchange_name = ('binanceus')
# sc_pair = 'USDTUSD';
# sc_pair_with_slash = 'USDT/USD';

# exchange_name = ('bittrex')
# sc_pair = 'PAXUSD';
# sc_pair_with_slash = 'PAX/USD';

# exchange_name = ('kraken')
# sc_pair = 'DAI/USD';
# sc_pair_with_slash = 'USDT/DAI';

# exchange_name = ('hitbtc')
# sc_pair = 'BUSDUSDT';
# sc_pair_with_slash = 'BUSD/USDT';

exchange_name = ('kucoin')
sc_pair = 'SUSDUSDT'
sc_pair_with_slash = 'SUSD/USDT'

# exchange_name = ('okex')
# sc_pair = 'TUSDUSDT';
# sc_pair_with_slash = 'TUSD/USDT';

date1 = '2021-05-22 00:00:00'
date2 = '2021-06-22 00:00:00'

path = '/home/ribs/Documents/ccxt/python/csv_exports'
csv_file_name = exchange_name+'_'+sc_pair+'_'+date1+'_'+date2+'.csv'
output_file = os.path.join(path, csv_file_name)

output_file = exchange_name+'_'+sc_pair+'_'+date1+'_'+date2+'.csv'

output_dir = os.path.join('/home/ribs/Documents/ccxt/python/csv_exports/')

# output_dir.mkdir(parents=True, exist_ok=True)
# -----------------------------------------------------------------------------

exchange = ccxt.gateio({
    'rateLimit': 1000,
    'enableRateLimit': True,
    # 'verbose': True,
})

print(exchange.timeframes)

# from_timestamp = time.strptime(date1, "%Y-%m-%d %H:%M:%S")
from_timestamp = exchange.parse8601(date1)

# now_datetime = time.strptime(date2, "%Y-%m-%d %H:%M:%S")
now = exchange.parse8601(date2)
# -----------------------------------------------------------------------------

data = []

while from_timestamp < now:

    try:

        print(exchange.milliseconds(), 'Fetching candles starting from', exchange.iso8601(from_timestamp))
        ohlcvs = exchange.fetch_ohlcv(sc_pair_with_slash, '1m', from_timestamp)
        print(exchange.milliseconds(), 'Fetched', len(ohlcvs), 'candles')

        # import pdb; pdb.set_trace()

        first = ohlcvs[0][0]
        last = ohlcvs[-1][0]
        print('First candle epoch', first, exchange.iso8601(first))
        print('Last candle epoch', last, exchange.iso8601(last))
        from_timestamp += len(ohlcvs) * minute
        data += ohlcvs
        import pdb; pdb.set_trace()

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
    open_data.append(float(candle[1].replace(',', '.')))
    high_data.append(float(candle[2].replace(',', '.')))
    low_data.append(float(candle[3].replace(',', '.')))
    close_data.append(float(candle[4].replace(',', '.')))
    volume_data.append(float(candle[5].replace(',', '.')))

# turn api result calls to dataframe, excluding, shall we consider candles with no volume?
df = DataFrame(data, columns=['timestamp','open','high','low','close','volume'])

# can join path elements with / operator
df.to_csv(output_dir+output_file, sep=';', decimal=',')


# # Create figure with secondary y-axis
fig = make_subplots(specs=[[{"secondary_y": True}]])
#
# # plot the candlesticks
fig.add_trace(go.Candlestick(name='<b>Candlesticks</b>', x=dates,
                       open=open_data, high=high_data,
                       low=low_data, close=close_data),
                       secondary_y=True)

# include a go.Bar trace for volumes
fig.add_trace(go.Bar(name='<b>Volume Bars</b>', x=dates, y=volume_data),
                secondary_y=False)

fig.update_layout(
    title=exchange_name+ ":" +sc_pair_with_slash,
    yaxis_title='<b>Volume</b>',
    xaxis_title='<b>Datetime</b>')

# fig.add_hline(y=1.002, line_dash="dot",
#               annotation_text="lower ref.",
#               annotation_position="bottom right")

fig.update_yaxes(title_text="<b>$ Price</b>", secondary_y=True)

fig.layout.yaxis2.showgrid = False

fig.show()
