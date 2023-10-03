# This homework assignment simulates a used car dealership.
# The user inputs information about a car, and then the program computes and outputs information.
# The outputs include the age of the car, the country it was built in, and lease payment amounts.
#
#
# CGS 2060 - Spring Semesester 2020
#
# Homework #1: Big Al's Used Car Emporium – Bringing 'Em In
#
# William Namm
#
#For starters, the user inputs the information for one car.
manufacturer = input("Enter the car's manufacturer: ")
model = input("Enter the car's model: ")
yearBuilt = int(input("Enter the year the car was built: "))
miles = int(input("Enter the number of miles the car has: "))
purchPrice = int(input("Enter the car's original purchase price: "))
resellPrice = int(input("Enter the car's resell price: "))
vin = input("Enter the car's VIN: ")
#This information is then printed out, with formatting to control the numbers of digits/characters.
print("Year: {a:4d}".format(a=yearBuilt), end="\t")
print("Miles: {a:7d}".format(a=miles), end="\t")
print("Manufacturer: {a:10s}".format(a=manufacturer), end="\t")
print("Model: {a:10s}".format(a=model), end="\t")
print("Price: ${a:5d}".format(a=purchPrice), end="\t")
print("VIN: {a:17s}".format(a=vin))
#The age of the car is calculated and printed.
age = 2020 - yearBuilt
print("The car is", age, "years old.")
#The country it was made in is determined by the first character of the VIN and saved as a new string variable.
if vin[0] == "1":
    country = "United States"
elif vin[0] == "4":
    country = "United States"
elif vin[0] == "5":
    country = "United States"
elif vin[0] == "2":
    country = "Canada"
elif vin[0] == "3":
    country = "Mexico"
elif vin[0] == "J":
    country = "Japan"
elif vin[0] == "K":
    country = "Korea"
elif vin[0] == "S":
    country = "UK"
elif vin[0] == "V":
    country = "France or Spain"
elif vin[0] == "T":
    country = "Switzerland"
elif vin[0] == "W":
    country = "Germany"
elif vin[0] == "Y":
    country = "Sweden or Finland"
elif vin[0] == "Z":
    country = "Italy"
else:
    country = "[Invalid VIN]"
#Information is printed on the manufacturer, model, age, and country built.
print("Manufacturer: {a:10s}".format(a=manufacturer), end="\t")
print("Model: {a:10s}".format(a=model), end="\t")
print("Age: {a:6d} years".format(a=age), end="\t")
print("Country built in: {a:15s}".format(a=country))
#Now, the monthly lease payment and total money from a three-year lease are calculated.
resellPrice = float(resellPrice)
residualValue = resellPrice * 0.57
depreciation = resellPrice - residualValue
basePayment = depreciation / 36
rentCharge = (basePayment + residualValue) * 0.00125
monthlyLease = rentCharge + basePayment
totalLease = monthlyLease * 36
#The manufacturer and model are printed again, along with both of the calculated lease payments.
#This time, monetary amounts are formatted to have two decimal places.
print("Manufacturer: {a:10s}".format(a=manufacturer), end="\t")
print("Model: {a:10s}".format(a=model), end="\t")
print("Total money earned from a 3-year lease: ${a:9,.2f}".format(a=totalLease), end="\t")
print("Monthly lease payment: ${a:6.2f}".format(a=monthlyLease))