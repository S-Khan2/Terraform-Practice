# Provider = local, Resourse = file, RequiredField = filename

resource "local_file" "pet" {
  filename = "./local_pets.txt"
  content  = "This is my favourite pet: ${random_pet.my-pet.id}. "
}

resource "random_pet" "my-pet" {
  prefix    = "Mrs"
  separator = "."
  length    = "1"
}
