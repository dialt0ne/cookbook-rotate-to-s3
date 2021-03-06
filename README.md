rotate-to-s3 Cookbook
=====================
This cookbook installs and configures [rotate-to-s3](https://github.com/dialt0ne/rotate-to-s3)

Requirements
------------
#### packages
- `cron` - rotate-to-s3 needs cron to schedule regular uploads

#### repositories
- a custom repository where rotate-to-s3 package **MUST** be present

Attributes
----------
#### rotate-to-s3::default

NOTE: no default attributes are provided. You **MUST** specify them explicitly.

* `node['rotate-to-s3']['destination']` - S3 Bucket where log files will be uploaded to
* `node['rotate-to-s3']['access']` - AWS Access Key
* `node['rotate-to-s3']['secret']` - AWS Secret Key
* `node['rotate-to-s3']['pidfile']` - webserver PID file
* `node['rotate-to-s3']['source']` - directory/files to be rotated

Usage
-----
#### rotate-to-s3::default

Include `rotate-to-s3` in your node's `run_list`
  as well as info the `default_attributes`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[rotate-to-s3]"
  ],
  "default_attributes": {
    "rotate-to-s3": {
        "destination": "myBucket",
        "access": "ABCDEFGHIJKLMNOPQRSTU",
        "secret": "SUMthefiveboxingwizardsjumpedquickly",
        "source": [
            {
                "directory": "/var/log/nginx",
                "files": [
                    "access.log",
                    "error.log"
                ]
            }
        ],
        "pidfile": "/var/run/nginx.pid"
    }
  }
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License
-------

Copyright 2013 Corsis
http://www.corsis.com/

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


