

resource "aws_s3_bucket" "moodle" {
  bucket = "insigth-learn-backup"
}

resource "aws_s3_object" "moodledb" {
  bucket = aws_s3_bucket.moodle.bucket
  key    = "MoodleDB/"
  acl    = "private"
}

resource "aws_s3_object" "morphcast" {
  bucket = aws_s3_bucket.moodle.bucket
  key    = "Morphcast/"
  acl    = "private"
}

resource "aws_s3_object" "whole_project" {
  bucket = aws_s3_bucket.moodle.bucket
  key    = "whole_project/"
  acl    = "private"
}

