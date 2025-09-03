resource "aws_instance" "web" {
    ami = "ami-06e11c4cc68c362dd"
    instance_type = "t2.micro"
    #count = 2
    tags = {
        Name = "web-${terraform.workspace}"    # manually create workspace, "terraform workspace new app" 
    }                                           # And select the workspace , "terraform workspace select app". it will change default to app.
}               # And then finally run "terraform apply" , it will create same resource with app workspacce.
