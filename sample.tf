resource "local.file" "pet" {
    filename = var.filename
    content = "My favourite is Mr.cat"
}

resource "random_pet" "my-pet" {
    prefix = var.prefix
}