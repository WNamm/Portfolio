# This homework assignment simulates a used car dealership.
# The script takes a 2D list with cars sold and uses the information to make a new 2D list containing the salespeople, the number of cars they sold, and their total sales.
# Then, it calculates lease payments from a different list of cars.
#
#
# CGS 2060 – Spring Semester 2020
#
# Homework #3: Closing The Deal
#
# William Namm
#
# Define the function that uses the sales data to create a new 2D list.
# This list names each salesperson, the number of cars he/she sold, and the total money he/she made.
def salesByPerson(salesList):
        personList = []
        # First, the names of each salesperson are collected in a new list, without repeating.
        for saleNum in range(len(salesList)):
            if [salesList[saleNum][2]] not in personList:
                personList.append([salesList[saleNum][2]])
        # Second, the number of cars each person sold is tallied and put in the sub-list with the matching name.
        for personNum in range(len(personList)):
            personList[personNum].append(0)
            for saleNo in range(len(salesList)):
                if salesList[saleNo][2] == personList[personNum][0]:
                    personList[personNum][1] += 1
        # Finally, the amount of money in sales is totaled for each person.
        for personNo in range(len(personList)):
            personList[personNo].append(0)
            for saleNo in range(len(salesList)):
                if salesList[saleNo][2] == personList[personNo][0]:
                    personList[personNo][2] += salesList[saleNo][3]
        return personList
# Define a function for calculating the monthly lease payment.
def leaseCalculator(resellInt, months):
    resellPrice = float(resellInt)
    residual = resellPrice * 0.57
    depreciation = resellPrice - residual
    basePMT = depreciation / months
    interest = (basePMT + residual) * 0.00125
    payment = basePMT + interest
    return round(payment, 2)
# Define a function that uses the list of all cars to create a new 2D list with monthly lease payment info.
# For each sub-list, first the manufacturer and model are added, then the 3-year payments, and finally the 5-year payments.
def leaseLister(carList):
    leaseList = []
    for carNum in range(len(carList)):
        leaseList.append([carList[carNum][0]])
        leaseList[carNum].append(carList[carNum][1])
        leaseList[carNum].append(leaseCalculator(carList[carNum][3], 36))
        leaseList[carNum].append(leaseCalculator(carList[carNum][3], 60))
    return leaseList
# Create a list with all of the car data; each car's data is one string.
cars = ["Toyota,Corolla CE,95990,81000,gray,N,2007",
        "Ford,F150 King Ranch,189980,120000,black,Y,2008",
        "Toyota,Corolla S,9599,122000,gray,N,2009",
        "Toyota,Tacoma PreRunner,82998,66000,white,Y,2008",
        "Toyota,Prius Touring,93998,67000,red,Y,2008",
        "Ford,Flex Limited,125990,95000,white,Y,2008",
        "Honda,CR-V LX,119980,71000,blue,N,2009",
        "Toyota,RAV4,86998,106000,white,N,2010",
        "Honda,Fit Sport,95099,95000,red,Y,2010",
        "Honda,Accord SE,99098,124000,silver,N,2011",
        "Honda,CR-V LX,120998,71000,blue,N,2010",
        "BMW,335 I,160998,46000,gold,N,2008",
        "Toyota,RAV4,129098,78000,blue,Y,2010",
        "BMW,Cooper Mini,99098,85000,red,Y,2008",
        "BMW,328 I,14599,76000,black,N,2009",
        "Toyota,RAV4,150998,27000,red,N,2009",
        "Toyota,Avalon Limited,140998,65000,silver,Y,2010",
        "Toyota,Tacoma PreRunner,81998,51000,white,Y,2010",
        "Toyota,Camry XLE,82599,97000,green,Y,2011",
        "Mazda,Mazda 3,89980,108000,gray,N,2009"]
# Split each string in the cars list to make a list of each car's specs, creating a 2D list.
for i in range(len(cars)):
    cars[i] = cars[i].split(",")
# Create a list of lists for the cars sold and print it out, with each sale in its own line.
carsSold = [["Ford", "F150 King Ranch", "John Little", 110000, "2/24/20"],
            ["Toyota", "Tacoma", "Peter Small", 66000, "2/29/20"],
            ["Toyota", "Prius", "Amy Jenkins", 63000, "3/4/20"],
            ["Honda", "CR-V", "John Little", 69000, "3/6/20"],
            ["Honda", "Fit Sport", "John Little", 91000, "3/7/20"],
            ["Honda", "Accord", "Amy Jenkins", 115000, "2/15/20"],
            ["BMW", "335 I", "Amy Jenkins", 42000, "2/17/20"],
            ["BMW", "Cooper Mini", "Peter Small", 82000, "2/5/20"],
            ["Toyota", "Avalon", "Peter Small", 59000, "2/17/20"],
            ["Toyota", "Camry XLE", "Peter Small", 91000, "3/8/20"]]
print("This is a table of the cars sold (manufacturer and model), who sold them, for how much, and the date sold:")
for saleNum in range(len(carsSold)):
    print(carsSold[saleNum])
# Call the salesByPerson function to process the carsSold list and print the new personSales list.
# Each salesperson's info appears on its own line.
personSales = salesByPerson(carsSold)
print("Here is a table of the salespeople, the number of cars they sold, and the money they made in sales:")
for personNum in range(len(personSales)):
    print(personSales[personNum])
# Call the leaseLister function and print the resulting list, with each car's info appearing on its own line.
leases = leaseLister(cars)
print("Here is a table of each car by manufacturer and model, followed by the montlhy payment amounts for a 3-year lease and a 5-year lease, respectively:")
for carNum in range(len(leases)):
    print(leases[carNum])