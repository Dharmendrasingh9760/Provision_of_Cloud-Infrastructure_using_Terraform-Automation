resource "aws_instance" "appserver1" {
        ami = "ami-020cba7c55df1f615"
        instance_type = "t2.micro"
        vpc_security_group_ids = [aws_security_group.mysecgroup.id]
        subnet_id = aws_subnet.pub-sub1.id
        user_data = file("userdata1.sh")

        metadata_options {
                http_tokens = "optional"
        }
        tags = {
                Name = "webserver1"
        }
}
resource "aws_instance" "appserver2" {
        ami = "ami-020cba7c55df1f615"
        instance_type = "t2.micro"
        vpc_security_group_ids = [aws_security_group.mysecgroup.id]
        subnet_id = aws_subnet.pub-sub2.id
        user_data = file("userdata2.sh")

        metadata_options {
                http_tokens = "optional"
        }
        tags = {
                Name = "webserver2"
        }
}
