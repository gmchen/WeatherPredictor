import numpy as np

# Load data as a 1D array with structured dtype
my_data = np.genfromtxt(open("Toronto_weather/noquotes_toronto_1978-2002.csv",'r'), delimiter=',', names=True,dtype="S10,f8,f8,f8,f8,f8,f8,f8,f8,f8,f8,f8,f8,f8,f8,f8,f8,f8,f8,f8,f8,f8,f8,f8,f8")

# reshape data to have five columns; data in the first four columns will be used to predict column 5
my_data_subset = my_data[0:( my_data.size / 5) * 5].reshape(-1,5)

# to do: subset first four columns for train, last column for testing. Then further subset for cross validation..
train = my_data_subset[:,0:4]
target = my_data_subset[:,4]

#target = my_data['Max_Temp_C']
