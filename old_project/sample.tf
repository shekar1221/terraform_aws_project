resource "local_file" "pet" {
    filename = var.filename
    #content = "My favourite is Mr.cat"
    content = "My Favourite Pet is ${random_pet.my-pet.id}"
}

resource "random_pet" "my-pet" {
    prefix = var.prefix
    separator = var.seperator
    length = var.length
} 