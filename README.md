<!-- This file was automatically generated by the `build-harness`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->
[![README Header][readme_header_img]][readme_header_link]

[![Cloud Posse][logo]](https://cpco.io/homepage)

# terraform-aws-s3-log-storage [![Build Status](https://travis-ci.org/cloudposse/terraform-aws-s3-log-storage.svg?branch=master)](https://travis-ci.org/cloudposse/terraform-aws-s3-log-storage) [![Latest Release](https://img.shields.io/github/release/cloudposse/terraform-aws-s3-log-storage.svg)](https://github.com/cloudposse/terraform-aws-s3-log-storage/releases/latest) [![Slack Community](https://slack.cloudposse.com/badge.svg)](https://slack.cloudposse.com)


This module creates an S3 bucket suitable for receiving logs from other `AWS` services such as `S3`, `CloudFront`, and `CloudTrails`.

It implements a configurable log retention policy, which allows you to efficiently manage logs across different storage classes (_e.g._ `Glacier`) and ultimately expire the data altogether.

It enables server-side default encryption.

https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html


---

This project is part of our comprehensive ["SweetOps"](https://cpco.io/sweetops) approach towards DevOps. 
[<img align="right" title="Share via Email" src="https://docs.cloudposse.com/images/ionicons/ios-email-outline-2.0.1-16x16-999999.svg"/>][share_email]
[<img align="right" title="Share on Google+" src="https://docs.cloudposse.com/images/ionicons/social-googleplus-outline-2.0.1-16x16-999999.svg" />][share_googleplus]
[<img align="right" title="Share on Facebook" src="https://docs.cloudposse.com/images/ionicons/social-facebook-outline-2.0.1-16x16-999999.svg" />][share_facebook]
[<img align="right" title="Share on Reddit" src="https://docs.cloudposse.com/images/ionicons/social-reddit-outline-2.0.1-16x16-999999.svg" />][share_reddit]
[<img align="right" title="Share on LinkedIn" src="https://docs.cloudposse.com/images/ionicons/social-linkedin-outline-2.0.1-16x16-999999.svg" />][share_linkedin]
[<img align="right" title="Share on Twitter" src="https://docs.cloudposse.com/images/ionicons/social-twitter-outline-2.0.1-16x16-999999.svg" />][share_twitter]


[![Terraform Open Source Modules](https://docs.cloudposse.com/images/terraform-open-source-modules.svg)][terraform_modules]



It's 100% Open Source and licensed under the [APACHE2](LICENSE).







We literally have [*hundreds of terraform modules*][terraform_modules] that are Open Source and well-maintained. Check them out! 







## Usage

```hcl
module "log_storage" {
  source                   = "git::https://github.com/cloudposse/terraform-aws-s3-log-storage.git?ref=master"
  enabled                  = "${var.enabled}"
  name                     = "${var.name}"
  stage                    = "${var.stage}"
  namespace                = "${var.namespace}"
  acl                      = "${var.acl}"
  prefix                   = "${var.prefix}"
  standard_transition_days = "${var.standard_transition_days}"
  glacier_transition_days  = "${var.glacier_transition_days}"
  expiration_days          = "${var.expiration_days}"
}
```






## Makefile Targets
```
Available targets:

  help                                Help screen
  help/all                            Display help for all targets
  help/short                          This help short screen
  lint                                Lint terraform code

```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| acl | The canned ACL to apply. We recommend log-delivery-write for compatibility with AWS services | string | `log-delivery-write` | no |
| attributes | Additional attributes (e.g. `policy` or `role`) | list | `<list>` | no |
| delimiter | Delimiter to be used between `name`, `namespace`, `stage`, etc. | string | `-` | no |
| enabled | Set to `false` to prevent the module from creating any resources | string | `true` | no |
| expiration_days | Number of days after which to expunge the objects | string | `90` | no |
| force_destroy | (Optional, Default:false ) A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable. | string | `false` | no |
| glacier_transition_days | Number of days after which to move the data to the glacier storage tier | string | `60` | no |
| kms_master_key_id | The AWS KMS master key ID used for the SSE-KMS encryption. This can only be used when you set the value of sse_algorithm as aws:kms. The default aws/s3 AWS KMS master key is used if this element is absent while the sse_algorithm is aws:kms | string | `` | no |
| lifecycle_prefix | Prefix filter. Used to manage object lifecycle events. | string | `` | no |
| lifecycle_rule_enabled | Enable lifecycle events on this bucket | string | `true` | no |
| lifecycle_tags | Tags filter. Used to manage object lifecycle events. | map | `<map>` | no |
| name | Name  (e.g. `app` or `db`) | string | - | yes |
| namespace | Namespace (e.g. `cp` or `cloudposse`) | string | - | yes |
| noncurrent_version_expiration_days | Specifies when noncurrent object versions expire. | string | `90` | no |
| noncurrent_version_transition_days | Specifies when noncurrent object versions transitions | string | `30` | no |
| policy | A valid bucket policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy. | string | `` | no |
| region | If specified, the AWS region this bucket should reside in. Otherwise, the region used by the callee. | string | `` | no |
| sse_algorithm | The server-side encryption algorithm to use. Valid values are AES256 and aws:kms | string | `AES256` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | - | yes |
| standard_transition_days | Number of days to persist in the standard storage tier before moving to the infrequent access tier | string | `30` | no |
| tags | Additional tags (e.g. map('BusinessUnit`,`XYZ`) | map | `<map>` | no |
| versioning_enabled | A state of versioning. Versioning is a means of keeping multiple variants of an object in the same bucket. | string | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket_arn | Bucket ARN |
| bucket_domain_name | FQDN of bucket |
| bucket_id | Bucket Name (aka ID) |
| enabled | Is module enabled |
| prefix | Prefix configured for lifecycle rules |




## Share the Love 

Like this project? Please give it a ★ on [our GitHub](https://github.com/cloudposse/terraform-aws-s3-log-storage)! (it helps us **a lot**) 

Are you using this project or any of our other projects? Consider [leaving a testimonial][testimonial]. =)


## Related Projects

Check out these related projects.

- [terraform-aws-cloudfront-s3-cdn](https://github.com/cloudposse/terraform-aws-cloudfront-s3-cdn) - Terraform module to easily provision CloudFront CDN backed by an S3 origin
- [terraform-aws-s3-website](https://github.com/cloudposse/terraform-aws-s3-website) - Terraform Module for Creating S3 backed Websites and Route53 DNS
- [terraform-aws-user-data-s3-backend](https://github.com/cloudposse/terraform-aws-user-data-s3-backend) - Terraform Module to Offload User Data to S3
- [terraform-aws-s3-logs-athena-query](https://github.com/cloudposse/terraform-aws-s3-logs-athena-query) - A Terraform module that creates an Athena Database and Structure for querying S3 access logs
- [terraform-aws-lb-s3-bucket](https://github.com/cloudposse/terraform-aws-lb-s3-bucket) - Terraform module to provision an S3 bucket with built in IAM policy to allow AWS Load Balancers to ship access logs



## Help

**Got a question?**

File a GitHub [issue](https://github.com/cloudposse/terraform-aws-s3-log-storage/issues), send us an [email][email] or join our [Slack Community][slack].

[![README Commercial Support][readme_commercial_support_img]][readme_commercial_support_link]

## Commercial Support

Work directly with our team of DevOps experts via email, slack, and video conferencing. 

We provide [*commercial support*][commercial_support] for all of our [Open Source][github] projects. As a *Dedicated Support* customer, you have access to our team of subject matter experts at a fraction of the cost of a full-time engineer. 

[![E-Mail](https://img.shields.io/badge/email-hello@cloudposse.com-blue.svg)][email]

- **Questions.** We'll use a Shared Slack channel between your team and ours.
- **Troubleshooting.** We'll help you triage why things aren't working.
- **Code Reviews.** We'll review your Pull Requests and provide constructive feedback.
- **Bug Fixes.** We'll rapidly work to fix any bugs in our projects.
- **Build New Terraform Modules.** We'll [develop original modules][module_development] to provision infrastructure.
- **Cloud Architecture.** We'll assist with your cloud strategy and design.
- **Implementation.** We'll provide hands-on support to implement our reference architectures. 



## Terraform Module Development

Are you interested in custom Terraform module development? Submit your inquiry using [our form][module_development] today and we'll get back to you ASAP.


## Slack Community

Join our [Open Source Community][slack] on Slack. It's **FREE** for everyone! Our "SweetOps" community is where you get to talk with others who share a similar vision for how to rollout and manage infrastructure. This is the best place to talk shop, ask questions, solicit feedback, and work together as a community to build totally *sweet* infrastructure.

## Newsletter

Signup for [our newsletter][newsletter] that covers everything on our technology radar.  Receive updates on what we're up to on GitHub as well as awesome new projects we discover. 

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/cloudposse/terraform-aws-s3-log-storage/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing this project or [help out](https://cpco.io/help-out) with our other projects, we would love to hear from you! Shoot us an [email][email].

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to merge the latest changes from "upstream" before making a pull request!


## Copyright

Copyright © 2017-2019 [Cloud Posse, LLC](https://cpco.io/copyright)



## License 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.









## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## About

This project is maintained and funded by [Cloud Posse, LLC][website]. Like it? Please let us know by [leaving a testimonial][testimonial]!

[![Cloud Posse][logo]][website]

We're a [DevOps Professional Services][hire] company based in Los Angeles, CA. We ❤️  [Open Source Software][we_love_open_source].

We offer [paid support][commercial_support] on all of our projects.  

Check out [our other projects][github], [follow us on twitter][twitter], [apply for a job][jobs], or [hire us][hire] to help with your cloud strategy and implementation.



### Contributors

|  [![Erik Osterman][osterman_avatar]][osterman_homepage]<br/>[Erik Osterman][osterman_homepage] | [![Andriy Knysh][aknysh_avatar]][aknysh_homepage]<br/>[Andriy Knysh][aknysh_homepage] | [![Vladimir][SweetOps_avatar]][SweetOps_homepage]<br/>[Vladimir][SweetOps_homepage] | [![Gonzalo Peci][pecigonzalo_avatar]][pecigonzalo_homepage]<br/>[Gonzalo Peci][pecigonzalo_homepage] |
|---|---|---|---|

  [osterman_homepage]: https://github.com/osterman
  [osterman_avatar]: https://github.com/osterman.png?size=150
  [aknysh_homepage]: https://github.com/aknysh
  [aknysh_avatar]: https://github.com/aknysh.png?size=150
  [SweetOps_homepage]: https://github.com/SweetOps
  [SweetOps_avatar]: https://github.com/SweetOps.png?size=150
  [pecigonzalo_homepage]: https://github.com/pecigonzalo
  [pecigonzalo_avatar]: https://github.com/pecigonzalo.png?size=150



[![README Footer][readme_footer_img]][readme_footer_link]
[![Beacon][beacon]][website]

  [logo]: https://cloudposse.com/logo-300x69.svg
  [docs]: https://cpco.io/docs
  [website]: https://cpco.io/homepage
  [github]: https://cpco.io/github
  [jobs]: https://cpco.io/jobs
  [hire]: https://cpco.io/hire
  [slack]: https://cpco.io/slack
  [linkedin]: https://cpco.io/linkedin
  [twitter]: https://cpco.io/twitter
  [testimonial]: https://cpco.io/leave-testimonial
  [newsletter]: https://cpco.io/newsletter
  [email]: https://cpco.io/email
  [commercial_support]: https://cpco.io/commercial-support
  [we_love_open_source]: https://cpco.io/we-love-open-source
  [module_development]: https://cpco.io/module-development
  [terraform_modules]: https://cpco.io/terraform-modules
  [readme_header_img]: https://cloudposse.com/readme/header/img?repo=cloudposse/terraform-aws-s3-log-storage
  [readme_header_link]: https://cloudposse.com/readme/header/link?repo=cloudposse/terraform-aws-s3-log-storage
  [readme_footer_img]: https://cloudposse.com/readme/footer/img?repo=cloudposse/terraform-aws-s3-log-storage
  [readme_footer_link]: https://cloudposse.com/readme/footer/link?repo=cloudposse/terraform-aws-s3-log-storage
  [readme_commercial_support_img]: https://cloudposse.com/readme/commercial-support/img?repo=cloudposse/terraform-aws-s3-log-storage
  [readme_commercial_support_link]: https://cloudposse.com/readme/commercial-support/link?repo=cloudposse/terraform-aws-s3-log-storage
  [share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-s3-log-storage&url=https://github.com/cloudposse/terraform-aws-s3-log-storage
  [share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-s3-log-storage&url=https://github.com/cloudposse/terraform-aws-s3-log-storage
  [share_reddit]: https://reddit.com/submit/?url=https://github.com/cloudposse/terraform-aws-s3-log-storage
  [share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/cloudposse/terraform-aws-s3-log-storage
  [share_googleplus]: https://plus.google.com/share?url=https://github.com/cloudposse/terraform-aws-s3-log-storage
  [share_email]: mailto:?subject=terraform-aws-s3-log-storage&body=https://github.com/cloudposse/terraform-aws-s3-log-storage
  [beacon]: https://ga-beacon.cloudposse.com/UA-76589703-4/cloudposse/terraform-aws-s3-log-storage?pixel&cs=github&cm=readme&an=terraform-aws-s3-log-storage
