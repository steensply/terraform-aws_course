# Creation of an AWS S3 Bucket

provider "aws" {
    region = "eu-west-3"
    profile = ""
}

// Bucket creation

resource "aws_s3_bucket" "mybucket" {
    bucket = "mybucker-tfcourse-29092021"
    acl = "private"

    tags = {
        Name = "Main-storage"
        Environment = "dev"
    }

    versioning {
      enabled = true
    }
}

// Bucket Object creation

resource "aws_s3_bucket_object" "mybucketobject" {
    bucket = "${aws_s3_bucket.mybucket.id}"
    key = "testfiles.txt"
    source = "../testfile/sampleobject.txt"
    etag = "${md5(file("../testfile/sampleobject.txt"))}"
}


