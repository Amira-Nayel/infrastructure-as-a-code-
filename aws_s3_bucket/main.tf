resource "aws_s3_bucket" "moodle" {
  bucket = "moodle-backup"
}

resource "aws_s3_bucket_policy" "moodle_policy" {
  bucket = aws_s3_bucket.moodle.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Principal = {
          AWS = "*"
        }
        Action   = "s3:*"
        Resource = [
          "${aws_s3_bucket.moodle.arn}",
          "${aws_s3_bucket.moodle.arn}/*"
        ]
      }
    ]
  })
}
