# synctime.py
Benchmark blockchain synchronization time during [IBD](https://blog.bitmex.com/bitcoins-initial-block-download/) Initially written by [okoto-xyz](https://gist.github.com/okoto-xyz/c8eead8d7eb8ffc01310abda267bec93)

## Make CSV
```bash
./synctime.py debug.log
```

## Drawing Plot
```bash
./synctime-plot.sh
```

## Some related CLI commands
```bash
grep "progress=1.000000" ~/.sugarchain/debug.log | head -1
```

## Result
![alt text](https://github.com/sugarchain-project/synctime/blob/master/png/synctime.png?raw=true)
