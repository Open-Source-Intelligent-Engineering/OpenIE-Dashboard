# import json
import time
import requests
import paho.mqtt.client as mqtt

HOST = "192.168.1.105"  #改成你的树莓派ip
PORT = 1883
USER = "qianzehao"            #改成你MQTT服务器的用户名
PASSWD = "123456"           #改成你MQTT服务器的密码

StockName = ['浦发银行', '京东方A', '格力电器', '比亚迪', '白云机场','奥园美谷','贵州茅台','中国平安','TCL科技']
StockCodeIndexS = ['sh600000', 'sz000725', 'sz000651', 'sz002594', 'sh600004','sz000615','sh600519','sh601318','sz000100']


if  __name__ == "__main__":
    mqttc = mqtt.Client("pi")
    mqttc.username_pw_set(USER,PASSWD)
    mqttc.connect(HOST,PORT,60)
    # mqttc.publish(TOPIC,"HELLO WORLD",0)
    mqttc.loop()
    while True:
        ergodic_ordinal = 0
        for StockCodeIndex in StockCodeIndexS:
        # for _ in range(4):                                              # 每轮刷新四次
            stock_info_view = []
            url = 'http://hq.sinajs.cn/?format=text&list='

            # 0：”大秦铁路”，股票名字；
            # 1：”27.55″，今日开盘价；
            # 2：”27.25″，昨日收盘价；
            # 3：”26.91″，当前价格；
            # 4：”27.55″，今日最高价；
            # 5：”26.20″，今日最低价；
            # 6：”26.91″，竞买价，即“买一”报价；
            # 7：”26.92″，竞卖价，即“卖一”报价；
            # 8：”22114263″，成交的股票数，由于股票交易以一百股为基本单位，所以在使用时，通常把该值除以一百；
            # 9：”589824680″，成交金额，单位为“元”，为了一目了然，通常以“万元”为成交金额的单位，所以通常把该值除以一万；
            # 10：”4695″，“买一”申请4695股，即47手；
            # 11：”26.91″，“买一”报价；
            # 12：”57590″，“买二”
            # 13：”26.90″，“买二”
            # 14：”14700″，“买三”
            # 15：”26.89″，“买三”
            # 16：”14300″，“买四”
            # 17：”26.88″，“买四”
            # 18：”15100″，“买五”
            # 19：”26.87″，“买五”
            # 20：”3100″，“卖一”申报3100股，即31手；
            # 21：”26.92″，“卖一”报价
            # (22, 23), (24, 25), (26,27), (28, 29)分别为“卖二”至“卖四的情况”
            # 30：”2008-01-11″，日期；
            # 31：”15:05:32″，时间；

            url += StockCodeIndex
            page = requests.get(url = url).text.split(',')

            stock_price = float(page[3])
            today_opening_price = float(page[1])
            yesterday_closing_price = float(page[2])
            bid0 = float(page[6]) # 买入
            ask0 = float(page[7]) # 卖出
            bid1 = int(page[10])
            ask1 = int(page[20])

            if stock_price-today_opening_price >= 0:
                color = 1
            else:
                color = 0

            stock_info_view.append(StockName[ergodic_ordinal])
            stock_info_view.append(StockCodeIndex)
            stock_info_view.append(stock_price)
            stock_info_view.append(today_opening_price)
            stock_info_view.append(yesterday_closing_price)
            stock_info_view.append(bid0)
            stock_info_view.append(ask0)
            stock_info_view.append(bid1)
            stock_info_view.append(ask1)
            stock_info_view.append(color)

            mqttc.publish('stockName', StockName[ergodic_ordinal], 0)
            mqttc.publish('stockCode', StockCodeIndex, 0)
            mqttc.publish('stockPrice', stock_price, 0)
            mqttc.publish('todayStart', today_opening_price, 0)
            mqttc.publish('yesterdayEnd', yesterday_closing_price, 0)
            mqttc.publish('bid0',bid0 , 0)
            mqttc.publish('ask0', ask0, 0)
            mqttc.publish('bid1', bid1, 0)
            mqttc.publish('ask1', ask1, 0)
            mqttc.publish('color', color, 0)
            print(stock_info_view)
            time.sleep(8)

            ergodic_ordinal += 1