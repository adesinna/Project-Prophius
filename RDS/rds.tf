 resource "aws_db_instance" "myrds" {
   allocated_storage   = 20  # the storage needed
   storage_type        = "gp2"
   identifier          = "rdstf"
   engine              = "mysql"
   engine_version      = "8.0.27"
   instance_class      = "db.t2.micro"
   username            = "admin"
   password            = "Passw0rd!123"
   publicly_accessible = true
   skip_final_snapshot = true

   tags = {
     Name = "MyRDS"
   }
 }