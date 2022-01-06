# simple calculator

# Here is a tip to the user
print('Select an operation you\'d like to perform(1.add, 2.subtract, 3.multiply, 4.divide')

# addition function


def addition(a, b):
  return a + b

# subtraction function


def subtraction(a, b):
  return a - b

# multiplication function


def multiplication(a, b):
  return a * b

# division function


def division(a, b):
  if b != 0:
    return a/b
# second number cannot be zero
  else:
    print('Cannot divided by zero')


while True:
  operation = input('Enter 1,2,3 or 4 to choose operation: ')
  if operation in ('1', '2', '3', '4'):
    num1 = float(input('What is your first number: '))
    num2 = float(input('What is your second number: '))

    if operation == '1':
      print(num1, '+', num2, addition(num1, num2))
    elif operation == '2':
      print(num1, '-', num2, subtraction(num1, num2))
    elif operation == '3':
      print(num1, '*', num2, multiplication(num1, num2))
    elif operation == '4':
      print(num1, '/', num2, division(num1, num2))
    else:
      print('Unknown Error')
    # ask user if he or she want to continue to perform any calculation
    cont = input('Would you like to perform another calculation(y/n)?')
    if cont == 'n':
      break
  else:
    print("Invalid Input")
