#Test 1

def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

# This function works to look within the @pet_shop
# class/ hash, find the name key pair and return the value.

#Test 2

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

# Looks to the @pet_shop hash, searches for the :admin hash
# and then looks for the value of key :total_cash.

#Test 3 + 4

def add_or_remove_cash(pet_shop, amount)
  return pet_shop[:admin][:total_cash] += amount
end

# Replicates the above function and then will add or
# subtract an amount based on the argument provided for
# the amount parameter.


#Test 5

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

# Within the @pet_shop hash, it finds the :admin hash
# and returns the value of :pets_sold.

#Test 6

def increase_pets_sold(pet_shop, new_sales)
  return pet_shop[:admin][:pets_sold] += new_sales
end

# This returns the amount of pets sold, based on
# the argument provided for the new_sales parameter.

#Test 7

def stock_count(pet_shop)
  return pet_shop[:pets].count()
end

# This function looks at the @pet_shop hash for the :pets
# array and uses the .count method to ascertain how many
# pets/ hashes are within it.

#Test 8 + 9

def pets_by_breed(pet_shop, breed)

  pets_found = []

  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      pets_found << pet
    end
  end
  return pets_found
end

# This function will look for a pet based on the
# argument provided in the breed parameter.
# It will run a for loop to check each value within :pets
# and :breed for a match to the breed argument.
# if one is found, it is added/pushed to an empty array
# called pets_found. Finally, pets_found is returned,
# providing all the information on pets of a specified breed.
# If the breed is not found the function returns nothing.

#Test 10 + 11

def find_pet_by_name(pet_shop, pet_name)

  for found_pet in pet_shop[:pets]
    if found_pet[:name] == pet_name
    #puts "I found #{found_pet[:name]}."
      return found_pet
    end
  end
    return nil
    # if this is in the loop, it kills the process after only
    # checking the first one.
end

# This function will iterate through the :pets array
# to find a match for the name provided for the
# pet_name parameter. If found, the information on that
# pet is returned, if not, a nil value is returned.


#Test 12

def remove_pet_by_name(pet_shop, pet_name)

  for remove_pet in pet_shop[:pets]
    if remove_pet[:name] == pet_name
      pet_shop[:pets].delete(remove_pet)
      # Needs to look at :pets within pet_shop to delete.
    end
  end
end

# This function will iterate through :pets, checking
# to find a match for the pet_name parameter.
# if one is found, its hash is deleted from the :pets
# array.

#Test 13

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
  return pet_shop[:pets].count()
end



#Test 14

def customer_pet_count(customers)
  return customers[:pets].count()
end

#Test 15

def add_pet_to_customer(customers, new_pet)
  return customers[:pets] << new_pet
end

#Test 16 + 17

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  end
  return false
end

#Test 18, 19, 20, 21

def sell_pet_to_customer(pet_shop, pet, customer)

  return if pet == nil
  # As the pet is not found, a nil value is returned
  # Thus the previous function, breaks producing anouther nil.
  # By returning the above, it meets a criteria and allows the
  # function to run.

  buying = customer_can_afford_pet(customer, pet)

  if buying
    customer[:pets].push(pet)
    pet_shop[:admin][:total_cash] += pet[:price]
    customer[:cash] -= pet[:price]
    pet_shop[:admin][:pets_sold] += 1
    remove_pet_by_name(pet_shop, pet[:name])

  end


end
