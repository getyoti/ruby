# Yoti Ruby SDK

[![Build Status](https://github.com/getyoti/yoti-java-sdk/workflows/Unit%20Test/badge.svg?branch=master)](https://github.com/getyoti/yoti-java-sdk/actions)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=getyoti%3Aruby&metric=coverage)](https://sonarcloud.io/dashboard?id=getyoti%3Aruby)
[![Bugs](https://sonarcloud.io/api/project_badges/measure?project=getyoti%3Aruby&metric=bugs)](https://sonarcloud.io/dashboard?id=getyoti%3Aruby)
[![Code Smells](https://sonarcloud.io/api/project_badges/measure?project=getyoti%3Aruby&metric=code_smells)](https://sonarcloud.io/dashboard?id=getyoti%3Aruby)
[![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=getyoti%3Aruby&metric=vulnerabilities)](https://sonarcloud.io/dashboard?id=getyoti%3Aruby)

Welcome to the Yoti Ruby SDK. This repository contains the tools you need to quickly integrate your Ruby back-end with Yoti so that your users can share their identity details with your application in a secure and trusted way.

## Table of Contents

1. [Requirements](#requirements) - Everything you need to get started

1. [Installing the SDK](#installing-the-sdk) - How to install our SDK

1. [Setup](#setup) - Setup required before using the Yoti services

1. [Products](#products) -
Links to more information about the products offered by the Yoti SDK

1. [Support](#support) - Please feel free to reach out

## Requirements

The Yoti gem requires at least Ruby `2.4.0`.
If you're using a version of Ruby lower than 2.2.2 you might encounter issues when [Bundler][] tries to install the [Active Support][] gem. This can be avoided by manually requiring activesupport 4.2.

```ruby
gem activesupport '~> 4.2'
```

Versions of [Bundler][] > 1.13 will sort this dependency issue automatically. More info in this [comment][] by André Arko.

[comment]: https://github.com/bundler/bundler-features/issues/120#issuecomment-214514847
[Bundler]: http://bundler.io/
[Active Support]: https://rubygems.org/gems/activesupport/

## Installing the SDK

To import the Yoti SDK inside your project, add this line to your application's Gemfile:

```ruby
gem 'yoti'
```

And then execute:

```shell
bundle install
```

Or simply run the following command from your terminal:

```shell
gem install yoti
```

## SDK Project Import

The gem provides a generator for the initialization file:

```shell
rails generate yoti:install
```

The generated initialisation file can be found in `config/initializers/yoti.rb`.

## Setup

For each service you will need:

* Your Client SDK ID, generated by [Yoti Hub](https://hub.yoti.com) when you create (and then publish) your app. 
* Your .pem file. This is your own unique private key which your browser generates from the [Yoti Hub](https://hub.yoti.com) when you create an application.

A minimal Yoti client initialisation looks like this:

```ruby
Yoti.configure do |config|
  config.client_sdk_id = ENV['YOTI_CLIENT_SDK_ID']
  config.key_file_path = ENV['YOTI_KEY_FILE_PATH']
end
```

Make sure the following environment variables can be accessed by your app:
- `YOTI_CLIENT_SDK_ID`
- `YOTI_KEY_FILE_PATH`

The following options are available:

Config               | Required | Default                | Note
---------------------|----------|------------------------|-----
`client_sdk_id`      | Yes      |                        | SDK identifier generated by when you publish your app
`key_file_path`      | Yes      |                        | Path to the pem file generated when you create your app
`api_url`            | No       | `https://api.yoti.com` | Path to Yoti URL used for debugging purposes
`api_port`           | No       | 443                    | Path to Yoti port used for debugging purposes

Keeping your settings and access keys outside your repository is highly recommended. You can use gems like [dotenv][] to manage environment variables more easily.

[dotenv]: https://github.com/bkeepers/dotenv

### Deploying to Heroku / AWS Elastic Beanstalk

Although we recommend using a pem file to store your secret key, and take advantage of the UNIX file permissions, your hosting provider might not allow access to the file system outside the deployment process.

If you're using Heroku or other alternative services, you can store the content of the secret key in an environment variable.

Your configuration should look like this:

```ruby
Yoti.configure do |config|
  config.client_sdk_id = ENV['YOTI_CLIENT_SDK_ID']
  config.key = ENV['YOTI_KEY']
end
```

Where `YOTI_KEY` is an environment variable with the following format: `YOTI_KEY="-----BEGIN RSA PRIVATE KEY-----\nMIIEp..."`

An easier way of setting this on Heroku would be to use the [Heroku Command Line][]

```shell
heroku config:add YOTI_KEY ="$(cat your-access-security.pem)"
```

[Heroku Command Line]: https://devcenter.heroku.com/articles/heroku-command-line

## Products

The Yoti SDK can be used for the following products, follow the links for more information about each:
1) [Yoti app integration](/docs/PROFILE.md) - Connect with already-verified customers.
1) [Yoti Doc Scan](/docs/DOCSCAN.md) - Identity verification embedded in your website or app.

## Support

For any questions or support please email [sdksupport@yoti.com](mailto:sdksupport@yoti.com).
Please provide the following to get you up and working as quickly as possible:

* Computer type
* OS version
* Version of Ruby being used
* Screenshot

Once we have answered your question we may contact you again to discuss Yoti products and services. If you’d prefer us not to do this, please let us know when you e-mail.
