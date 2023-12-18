import pandas as pd
from tqdm import *

dataset = pd.read_csv("数据合并_csv版本_只含销售.csv")
# print(dataset.head())

floralLeaf = dataset[dataset["分类名称"] == "花叶类"]
floralLeaf.reset_index(drop=True, inplace=True)
# print(floralLeaf)

Cauliflower = dataset[dataset["分类名称"] == "花菜类"]
Cauliflower.reset_index(drop=True, inplace=True)

aquaticRhizome = dataset[dataset["分类名称"] == "水生根茎类"]
aquaticRhizome.reset_index(drop=True, inplace=True)

nightshades = dataset[dataset["分类名称"] == "茄类"]
nightshades.reset_index(drop=True, inplace=True)

pepper = dataset[dataset["分类名称"] == "辣椒类"]
pepper.reset_index(drop=True, inplace=True)

mushroom = dataset[dataset["分类名称"] == "食用菌"]
mushroom.reset_index(drop=True, inplace=True)

floralLeaf.to_csv("花叶类日细表.csv", index=False)
Cauliflower.to_csv("花菜类日细表.csv", index=False)
aquaticRhizome.to_csv("水生根茎类日细表.csv", index=False)
nightshades.to_csv("茄类日细表.csv", index=False)
pepper.to_csv("辣椒类日细表.csv", index=False)
mushroom.to_csv("食用菌日细表.csv", index=False)
print("csv日细表完成")

floralLeaf.to_excel("花叶类日细表.xlsx", sheet_name="Sheet1", index=False)
Cauliflower.to_excel("花菜类日细表.xlsx", sheet_name="Sheet1", index=False)
aquaticRhizome.to_excel("水生根茎类日细表.xlsx", sheet_name="Sheet1", index=False)
nightshades.to_excel("茄类日细表.xlsx", sheet_name="Sheet1", index=False)
pepper.to_excel("辣椒类日细表.xlsx", sheet_name="Sheet1", index=False)
mushroom.to_excel("食用菌日细表.xlsx", sheet_name="Sheet1", index=False)
print("xlsx日细表完成")

# 计算日度单类销售额
date = dataset.iloc[:, 0]
date.drop_duplicates(keep='first', inplace=True)
date.reset_index(drop=True, inplace=True)
print(date)


def calculateDailySales(data):
    dailySales = []
    for i in tqdm(range(len(date))):
        item = data[data["销售日期"] == date[i]]
        dailySales.append(item["销量(千克)"].sum())
    return dailySales


sales = pd.DataFrame()
sales.insert(0, "日期", date)
print(sales)

sales4floralLeaf = calculateDailySales(floralLeaf)
# print(sales4floralLeaf)
sales["花叶类总销量(千克)"] = sales4floralLeaf

sales4Cauliflower = calculateDailySales(Cauliflower)
# print(sales4Cauliflower)
sales["花菜类总销量(千克)"] = sales4Cauliflower

sales4aquaticRhizome = calculateDailySales(aquaticRhizome)
# print(sales4aquaticRhizome)
sales["水生根茎类总销量(千克)"] = sales4aquaticRhizome

sales4nightshades = calculateDailySales(nightshades)
# print(sales4nightshades)
sales["茄类总销量(千克)"] = sales4nightshades

sales4pepper = calculateDailySales(pepper)
# print(sales4pepper)
sales["辣椒类总销量(千克)"] = sales4pepper

sales4mushroom = calculateDailySales(mushroom)
# print(sales4mushroom)
sales["食用菌总销量(千克)"] = sales4mushroom

sales[["日期", "花叶类总销量(千克)"]].to_excel("花叶类日总表.xlsx", sheet_name="Sheet1", index=False)
sales[["日期", "花菜类总销量(千克)"]].to_excel("花菜类日总表.xlsx", sheet_name="Sheet1", index=False)
sales[["日期", "水生根茎类总销量(千克)"]].to_excel("水生根茎类日总表.xlsx", sheet_name="Sheet1", index=False)
sales[["日期", "茄类总销量(千克)"]].to_excel("茄类日总表.xlsx", sheet_name="Sheet1", index=False)
sales[["日期", "辣椒类总销量(千克)"]].to_excel("辣椒类日总表.xlsx", sheet_name="Sheet1", index=False)
sales[["日期", "食用菌总销量(千克)"]].to_excel("食用菌日总表.xlsx", sheet_name="Sheet1", index=False)
