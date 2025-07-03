resource "aws_lb" "myalb" {
        name = "TF-alb"
        internal = false
        load_balancer_type = "application"
        security_groups = [aws_security_group.mysecgroup.id]
        subnets = [aws_subnet.pub-sub1.id, aws_subnet.pub-sub2.id]
        tags = {
                Name = "TF-ALB"
        }
}
resource "aws_lb_target_group" "mytg" {
        name = "alb-tg"
        port = 80
        protocol = "HTTP"
        target_type = "instance"
        vpc_id = aws_vpc.myvpc.id

        health_check {
                path = "/"
                port = "traffic-port"
        }
}
resource "aws_lb_target_group_attachment" "attach1" {
        target_group_arn = aws_lb_target_group.mytg.arn
        target_id = aws_instance.appserver1.id
        port = 80
}
resource "aws_lb_target_group_attachment" "attach2" {
        target_group_arn = aws_lb_target_group.mytg.arn
        target_id = aws_instance.appserver2.id
        port = 80
}
resource "aws_lb_listener" "listener1" {
        load_balancer_arn = aws_lb.myalb.arn
        port = "80"
        protocol = "HTTP"

        default_action {
                target_group_arn = aws_lb_target_group.mytg.arn
                type = "forward"
        }
}
output "loadbalancerdns" {
        value = aws_lb.myalb.dns_name
}
