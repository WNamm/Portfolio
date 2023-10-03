# This script opens an image of a happy face in a separate window.
#
# Importing Image module.  I used PyCharm because it already has PIL in its libraries.
from PIL import Image
# Retrieving an image of the happy face that is saved in the project's folder, then opening it in a new window.
Image.open("Happy_Face_Image.png").show()