#!/usr/bin/env xonsh

from os.path import expanduser
import requests
import math
import json

__all__ = ()
__version__ = '0.1.0'

config_file = expanduser("~/.jj_config.json")
with open(config_file, "r") as json_file:
    cfg = json.load(json_file)


def jj():
    print("jj help menu")


def stock(argv, stdin=None):
    code = "sh000001"
    length = len(argv[0]) if len(argv) > 0 else 0

    if (length == 8):
        code = argv[0]
    elif (length == 6):
        if (argv[0][0] in [1, 3, 0]):
            code = "sz" + argv[0]
        else:
            code = "sh" + argv[0]
    elif (length == 4 or length == 3 or length == 2):
        for c in cfg:
            if argv[0] in c:
                code = c
        if (len(code) == 6 and code[0] == 6):
            code = 'sh' + code
        else:
            code = 'sz' + code
    else:
        code = "sh000001"

    fetch_stock_data(code)


def fetch_stock_data(code):
    url = "http://hq.sinajs.cn/list={0}".format(code)
    r = requests.get(url)
    data = r.text.split('"')[1].split(",")
    ncode = code[2:]
    p = math.floor(((float)(data[3]) - (float)(data[2])) * 100 * 100 / (float)(data[2])) / 100
    if (p > 0):
        p = "\033[31m +{0}%\033[0m".format(p)
    elif (p == 0):
        p = "\033[37m {0}%\033[0m".format(p)
    elif (p < 0):
        p = "\033[32m {0}%\033[0m".format(p)

    myprice_data = ''

    if (ncode in cfg):
        myprice = cfg[ncode]['price']
        p2 = str(math.floor(((float)(data[3]) - myprice) * 100 * 100 / myprice) / 100)
        p2 += '%'
        p3 = (int)(cfg[ncode]['amount'] * ((float)(data[3]) - myprice))
        p4 = (int)((float)(data[3]) * (float)(cfg[ncode]['amount']))
        p5 = cfg[ncode]['amount']
        myprice_data = " 我的成本  {0} myprice {1} {2}(元) {3}(元)".format(p5, p2, p3, p4)

    result = "\n\n{0}\n 当前走势  {1} {2}\n".format(data[0], data[3], p)
    result += myprice_data + "\n"
    result += " 昨日收盘  {0}\n".format(data[2])
    result += " 今日开盘  {0}\n".format(data[1])
    result += " 今日最高  {0}\n".format(data[4])
    result += " 今日最低  {0}\n".format(data[5])

    if (code != 'sh000001'):
        result += "\n 五档盘口\n\n"
        result += " 卖5\t"+str((int)((float)(data[28])/100))+"\t" + data[29]+"\n"
        result += " 卖4\t"+str((int)((float)(data[26])/100))+"\t" + data[27]+"\n"
        result += " 卖3\t"+str((int)((float)(data[24])/100))+"\t" + data[25]+"\n"
        result += " 卖2\t"+str((int)((float)(data[22])/100))+"\t" + data[23]+"\n"
        result += " 卖1\t"+str((int)((float)(data[20])/100))+"\t" + data[21]+"\n\n"
        result += " 买1\t"+str((int)((float)(data[10])/100))+"\t" + data[11]+"\n"
        result += " 买2\t"+str((int)((float)(data[12])/100))+"\t" + data[13]+"\n"
        result += " 买3\t"+str((int)((float)(data[14])/100))+"\t" + data[15]+"\n"
        result += " 买4\t"+str((int)((float)(data[16])/100))+"\t" + data[17]+"\n"
        result += " 买5\t"+str((int)((float)(data[18])/100))+"\t" + data[19]+"\n\n"

    print(result)


aliases['jj'] = jj
aliases['js'] = stock
