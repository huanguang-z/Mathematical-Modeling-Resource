import pandas as pd

left = pd.read_excel("附件2.xlsx")
right = pd.read_excel("附件1.xlsx")

merges=pd.merge(left,right,how="left")

merges.to_csv("数据合并_csv版本_完整.csv",index=False)