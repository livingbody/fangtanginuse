# encoding=utf-8
import requests
import time


def sendinfo(url):
    payloadHeader = {
        # content-type很重要，不然爬不到数据
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
    }

    response = requests.post(url, headers=payloadHeader)
    print(response)
    return response


if __name__ == "__main__":
    # url换成你自己的
    url = "https://sc.ftqq.com/********************.send?text=主人服务器又挂掉啦~ "
    accurtime = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
    url = url + accurtime
    url = url + "&desp='北风那个吹 雪花那个飘 雪花那个飘飘 年来到 爹出门去躲债，整七那个天  三十那个晚上还没还'"
    print(url)
    sendinfo(url)
