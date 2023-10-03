# This script separates a UPC code as a string into its sections.
# Then, it prints quantity and cost info while formatting the total cost.
#
# Set entire UPC code as a string.
fullUPC = "020357122682"
# Create new variables containing the sections of the UPC code.
firstDigit = fullUPC[0]
manufactCode = fullUPC[1:6]
productCode = fullUPC[6:11]
checkDigit = fullUPC[11]
# Print the sections of the UPC with tabs in between them.
print(firstDigit, "\t", manufactCode, "\t", productCode, "\t", checkDigit)
# Print the purchase quantity, unit cost, and total cost.
# Total cost is formatted to have 8 total characters (including comma and decimal) and rounded to 2 decimal places.
print("Quantity: 12", "\t", "Unit Cost: $275.15", "\t", "Total Cost: ${a:8,.2f}".format(a = 12*275.15))