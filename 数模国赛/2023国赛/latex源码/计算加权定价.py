import pandas as pd
from tqdm import tqdm
import warnings
warnings.filterwarnings("ignore")

dataset=pd.read_csv("单品利润占比_修改缺失.csv")
shoujia=pd.read_excel("SixKindsAll.xlsx",sheet_name="Sheet1")


huaye="花叶类"
huacai="花菜类"
shuisheng="水生根茎类"
qielei="茄类"
lajiao="辣椒类"
shiyongjun="食用菌"

huaye_sunhao=12.83
huacai_sunhao=15.51
shuisheng_sunhao=13.65
qielei_sunhao=6.68
lajiao_sunhao=9.24
shiyongjun_sunhao=9.45

# print(dataset)
date = dataset.iloc[:, 0]
date.drop_duplicates(keep='first', inplace=True)
date.reset_index(drop=True, inplace=True)

result=pd.DataFrame()


for i in tqdm(range(len(date))):
    price={'日期':date[i]}
    data=dataset[dataset['日期']==date[i]]
    # print(data)
    huaye_data=data[data['分类名称']==huaye]
    huacai_data=data[data['分类名称']==huacai]
    shuisheng_data=data[data['分类名称']==shuisheng]
    qielei_data=data[data['分类名称']==qielei]
    lajiao_data=data[data['分类名称']==lajiao]
    shiyongjun_data=data[data['分类名称']==shiyongjun]

    price['花叶类加权定价']=huaye_data['售价*利润权重'].sum()
    price['花菜类加权定价']=huacai_data['售价*利润权重'].sum()
    price['水生根茎类加权定价']=shuisheng_data['售价*利润权重'].sum()
    price['茄类加权定价']=qielei_data['售价*利润权重'].sum()
    price['辣椒类加权定价']=lajiao_data['售价*利润权重'].sum()
    price['食用菌加权定价']=shiyongjun_data['售价*利润权重'].sum()

    price['花叶类加权成本']=huaye_data['进价*利润权重'].sum()/(1-huaye_sunhao/100)
    price['花菜类加权成本']=huacai_data['进价*利润权重'].sum()/(1-huacai_sunhao/100)
    price['水生根茎类加权成本']=shuisheng_data['进价*利润权重'].sum()/(1-shuisheng_sunhao/100)
    price['茄类加权成本']=qielei_data['进价*利润权重'].sum()/(1-qielei_sunhao/100)
    price['辣椒类加权成本']=lajiao_data['进价*利润权重'].sum()/(1-lajiao_sunhao/100)
    price['食用菌加权成本']=shiyongjun_data['进价*利润权重'].sum()/(1-shiyongjun_sunhao/100)

  

