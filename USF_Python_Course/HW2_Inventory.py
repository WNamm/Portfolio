# This homework assignment simulates a used car dealership.
# The sript starts with a 2D list of 20 cars with information on each car in each sublist.
# Then, it outputs cars that fit certain criteria, such as the numebr of red cars and a list of all the Honda models.
# Finally, it calculates lease payments and 3-year lease revenue for all of the cars.
#
#
# CGS 2060 – Spring Semester 2020
#
# Homework #2: Big Al's Inventory Problem
#
# William Namm
#
#Create a list with all the information on the cars.
#Each line contains the car's year made, manufacturer, model, miles, resell price, color, and whether it has SiriusXM, in that order.
carDB = [ [2008,"Toyota","Corolla CE",95990,81000,"gray","N"],
          [2009,"Ford","F150 King Ranch",189980,120000,"black","Y"],
          [2010,"Toyota","Corolla S",9599,122000,"gray","N"],
          [2009,"Toyota","Tacoma PreRunner",82998,66000,"white","Y"],
          [2009,"Toyota","Prius Touring",93998,67000,"red","Y"],
          [2009,"Ford","Flex Limited",125990,95000,"white","Y"],
          [2010,"Honda","CR-V LX",119980,71000,"blue","N"],
          [2011,"Toyota","RAV4",86998,106000,"white","N"],
          [2011,"Honda","Fit Sport",95099,95000,"red","Y"],
          [2012,"Honda","Accord SE",99098,124000,"silver","N"],
          [2011,"Honda","CR-V LX",120998,71000,"blue","N"],
          [2009,"BMW","335 I",160998,46000,"gold","N"],
          [2011,"Toyota","RAV4",129098,78000,"blue","Y"],
          [2009,"BMW","Cooper Mini",99098,85000,"red","Y"],
          [2010,"BMW","328 I",14599,76000,"black","N"],
          [2010,"Toyota","RAV4",150998,27000,"red","N"],
          [2011,"Toyota","Avalon Limited",140998,65000,"silver","Y"],
          [2011,"Toyota","Tacoma PreRunner",81998,51000,"white","Y"],
          [2012,"Toyota","Camry XLE",82599,97000,"green","Y"],
          [2010,"Mazda","Mazda 3",89980,108000,"gray","N"], ]
#Prints a line for each car with the corresponding information.
for car in range(len(carDB)):
    print("Year: {0:4d}  Miles: {1:7d}  Manufacturer: {2:10s}  Model: {3:16s}  Resell Price: ${4:7,d}".format(carDB[car][0], carDB[car][3], carDB[car][1], carDB[car][2], carDB[car][4]))
print()
#Calculates and prints the number of red cars.
redCars = 0
for car in range(len(carDB)):
    if carDB[car][5] == "red":
        redCars += 1
print("There are {0} red cars in the inventory.".format(redCars))
#Calculates and prints the number of cars made before 2010.
oldCars = 0
for car in range(len(carDB)):
    if carDB[car][0] < 2010:
        oldCars += 1
print("There are {0} cars in the inventory that were made before 2010.".format(oldCars))
#Calculates the number of Hondas and creates a list of the models of Hondas.  This info is then printed.
numHonda = 0
modelHonda = []
for car in range(len(carDB)):
    if carDB[car][1] == "Honda":
        numHonda += 1
        modelHonda.append(carDB[car][2])
print("There are {0} Hondas in the inventory.".format(numHonda))
#The list of Honda models is printed one element at a time, so there are no brackets or quotes printed.
print("The models of Honda include: ", end="")
for model in range(len(modelHonda)):
    print(modelHonda[model], ",", end=" ")
print()
#Creates a string listing the manufacturers and models of cars with SiriusXM service, then prints the list.
XMCarList = ""
for car in range(len(carDB)):
    if carDB[car][6] == "Y":
        XMCarList += carDB[car][1]
        XMCarList += " "
        XMCarList += carDB[car][2]
        XMCarList += ", "
print("These cars have SiriusXM radio service:", XMCarList[0:-2])
#The [0:-2] at the end of the string variable cuts off the additional comma and space when printing.
#Creates a string listing the manufacturers and models of cars with between 80,000 and 90,000 miles, then prints the list.
milesList = ""
for car in range(len(carDB)):
    if carDB[car][3] >= 80000 and carDB[car][3] <= 90000:
        milesList += carDB[car][1]
        milesList += " "
        milesList += carDB[car][2]
        milesList += ", "
print("These cars have between 80,000 and 90,000 miles on them:", milesList[0:-2])
#Determines and prints whether there is specifically a Toyota Camry XLE that is green and has less than 100,000 miles on it.
specificCamry = False
for car in range(len(carDB)):
    if carDB[car][1] == "Toyota" and carDB[car][2] == "Camry XLE" and carDB[car][5] == "green" and carDB[car][3] < 100000:
        specificCamry = True
if specificCamry == True:
    print("There is indeed a Toyota Camry XLE that is green and has less than 100,000 miles on it in the inventory.")
else:
    print("There are no Toyota Camry XLE that are green and have less than 100,000 miles on them in the inventory.")
print()
#For each car, prints the manufacturer and model, and then calculates and prints the total revenue from a 3-year lease and the monthly lease payment.
for car in range(len(carDB)):
    print("Manufacturer: {0:10s}".format(carDB[car][1]), end=" ")
    print("Model: {0:10s}".format(carDB[car][2]), end=" \t ")
    resellPrice = carDB[car][4]
    residual = resellPrice*0.57
    depreciation = resellPrice - residual
    basePMT = depreciation/36
    interest = (basePMT + residual)*0.00125
    payment = basePMT + interest
    totalLease = payment * 36
    print("3-Year Lease: ${0:9,.2f}".format(totalLease), end=" \t ")
    print("Monthly Lease Payment: ${0:6.2f}".format(payment))