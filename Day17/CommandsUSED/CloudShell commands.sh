~ $ aws s3api delete-bucket-policy --bucket elasticbeanstalk-us-east-1-357715920231
~ $ aws s3 rm s3://elasticbeanstalk-us-east-1-357715920231 --recursive
delete: s3://elasticbeanstalk-us-east-1-357715920231/resources/environments/logs/deployments/e-jaxwy9dvvw/eb-deployment-92dac243-6507-4f33-b832-5b1dc1b3db43.log
delete: s3://elasticbeanstalk-us-east-1-357715920231/.elasticbeanstalk
delete: s3://elasticbeanstalk-us-east-1-357715920231/resources/environments/logs/deployments/e-u4vsutqppy/eb-deployment-3eb51918-d5ba-42a6-9e39-3a5a639059ec.log
~ $ aws s3 rb s3://elasticbeanstalk-us-east-1-357715920231
remove_bucket: elasticbeanstalk-us-east-1-357715920231
~ $ 



