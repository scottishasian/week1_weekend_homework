#Test 1

def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

#Test 2

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

#Test 3 + 4

def add_or_remove_cash(pet_shop, amount)
  return pet_shop[:admin][:total_cash] += amount
end


#Test 5

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

#Test 6

def increase_pets_sold(pet_shop, new_sales)
  return pet_shop[:admin][:pets_sold] += new_sales
end

#Test 7

def stock_count(pet_shop)
  return pet_shop[:pets].count()
end

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

#Test 12

def remove_pet_by_name(pet_shop, pet_name)

  for remove_pet in pet_shop[:pets]
    if remove_pet[:name] == pet_name
      pet_shop[:pets].delete(remove_pet)
      # Needs to look at :pets within pet_shop to delete.
    end
  end
end

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

#Test 18, 19, 20

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
    pet_shop[:pets] = remove_pet_by_name(pet_shop, pet[:name])

  end


end
