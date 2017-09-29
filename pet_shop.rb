def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  return pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, new_sales)
  return pet_shop[:admin][:pets_sold] += new_sales
end

def stock_count(pet_shop)
  return pet_shop[:pets].count()
end

def pets_by_breed(pet_shop, breed)

  pets_found = []

  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      pets_found << pet
    end
  end
  return pets_found
end

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

def remove_pet_by_name(pet_shop, pet_name)

  for remove_pet in pet_shop[:pets]
    if remove_pet[:name] == pet_name
      pet_shop[:pets].delete(remove_pet)
      # Needs to look at :pets within pet_shop to delete.
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
  return pet_shop[:pets].count()
end

def customer_pet_count(customers)
  return customers[:pets].count()
end

def add_pet_to_customer(customers, new_pet)
  return customers[:pets] << new_pet
end
