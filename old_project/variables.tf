variable "filename" {
  default = "/roots/pets.txt"
  type = string
  description = "path of the locl file"
}
variable "content" {
    default = "I love pets!"
    description = "the content of the file"
}
variable "prefix" {
    default = "Mrs"
    type = string
    description = "the prefix to be set"
}
variable "seperator" {
  
  default = "."
}
variable "length" {
    default = 2
    type = number
    description = "length of pet name"
}
variable "password_change" {
  default = true
  type = bool
}