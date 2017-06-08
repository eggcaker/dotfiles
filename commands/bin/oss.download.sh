#!/usr/local/bin/python
# -*- coding: utf-8 -*-

import os
import sys
import oss2

access_key_id = os.getenv('OSS_ACCESS_KEY_ID', 'test')
access_key_secret = os.getenv('OSS_ACCESS_TOKEN', 'test')
bucket_name = os.getenv('OSS_BUCKET', 'pacer-data-backup')
endpoint = os.getenv('OSS_ENDPOINT', 'http://oss-cn-qingdao.aliyuncs.com')


# 确认上面的参数都填写正确了
for param in (access_key_id, access_key_secret, bucket_name, endpoint):
    assert '<' not in param, '请设置参数：' + param


# 创建Bucket对象，所有Object相关的接口都可以通过Bucket对象来进行
bucket = oss2.Bucket(oss2.Auth(access_key_id, access_key_secret), endpoint, bucket_name)

key = sys.argv[1];
filename = key

"""
文件下载
"""

# 下载文件
result = bucket.get_object(key)

# 下载到本地文件
result = bucket.get_object_to_file(key, filename)

"""
范围下载
"""

# 范围下载，如果指定的范围无效，则下载整个文件
result = bucket.get_object(key, byte_range=(0, 1023))

# 范围下载到本地文件
result = bucket.get_object_to_file(key, filename, byte_range=(1024, 2047))

"""
断点续传下载
"""

# 断点续传下载
oss2.resumable_download(bucket, key, filename,
                        multiget_threshold=200*1024,
                        part_size=100*1024,
                        num_threads=3)