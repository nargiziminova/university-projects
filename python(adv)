import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import torch
import torch.nn as nn


users = pd.DataFrame({
    'user_id': [1,2,3,4],
    'username': ['Alice','Bob','Charlie','David'],
    'signup_date': pd.to_datetime(['2025-01-01','2025-01-05','2025-01-10','2025-01-15']),
    'country': ['Poland','USA','Germany','Poland']
})

activity_log = pd.DataFrame({
    'log_id': [1,2,3,4,5,6,7,8],
    'user_id': [1,1,2,3,4,2,3,1],
    'activity_type': ['login','purchase','login','comment','login','purchase','purchase','comment'],
    'activity_date': pd.to_datetime(['2025-02-01','2025-02-01','2025-02-01','2025-02-02','2025-02-03','2025-02-04','2025-02-05','2025-02-06']),
    'value': [1,120,1,1,1,200,50,1]
})


activity_summary = activity_log.groupby('user_id')['value'].sum().reset_index()
activity_summary = activity_summary.merge(users, on='user_id')
print(activity_summary)


sns.barplot(x='username', y='value', data=activity_summary)
plt.title('Total Activity Value by User')
plt.show()


purchases = activity_log[activity_log['activity_type']=='purchase']
purchases_by_country = purchases.merge(users, on='user_id').groupby('country')['value'].sum().reset_index()
sns.barplot(x='country', y='value', data=purchases_by_country)
plt.title('Total Purchases by Country')
plt.show()


X = torch.tensor(activity_summary[['user_id']].values, dtype=torch.float32)
y = torch.tensor(activity_summary['value'].values, dtype=torch.float32).view(-1,1)


model = nn.Linear(1,1)
criterion = nn.MSELoss()
optimizer = torch.optim.SGD(model.parameters(), lr=0.01)


for epoch in range(200):
    optimizer.zero_grad()
    outputs = model(X)
    loss = criterion(outputs, y)
    loss.backward()
    optimizer.step()

print("Predicted activity values:", model(X).detach().numpy())

