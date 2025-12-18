
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns


data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 30, 22, 28, 35],
    'Country': ['Poland', 'USA', 'Poland', 'Germany', 'USA'],
    'Sales': [150, 200, 300, 250, 180],
    'Department': ['HR', 'IT', 'IT', 'Finance', 'Finance']
}

df = pd.DataFrame(data)


print(df.head())


print(df.describe())


sales_summary = df.groupby('Country').agg({'Sales': ['sum', 'mean', 'max']})
print(sales_summary)


sns.barplot(x=sales_summary.index, y=sales_summary['Sales']['sum'])
plt.title('Total Sales by Country')
plt.xlabel('Country')
plt.ylabel('Total Sales')
plt.show()


sns.boxplot(x='Department', y='Age', data=df)
plt.title('Age Distribution by Department')
plt.show()
print(df.corr())
sns.heatmap(df.corr(), annot=True)
plt.show()

