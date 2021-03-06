# uap-vcl

## Description

`uap-vcl` is a VCL module which parses a User-Agent string. It returns
the user agent family, major version, minor version and patch version.

Why do this in VCL? This module follows the same rules as
[ua-parser](http://www.uaparser.org/), an open-source and
community-driven, regexp-based user-agent parser. It has been ported to
many different programming languages all of which share the same parser.

If you are already using a ua-parser-based parser on your origin then
this module provides an easy migration path to moving User-Agent-based
logic to VCL.

You can view the output for your current browser as HTML at:
https://uap-vcl.freetls.fastly.net/

Or as JSON using:

```bash
$ curl https://uap-vcl.freetls.fastly.net/ -Haccept:application/json
{
  "ua_family": "curl",
  "ua_major": "7",
  "ua_minor": "50",
  "ua_patch": "3"
}

```

## Installation

The module consists of a library, [uap.vcl](uap.vcl) which you can
include in your Fastly service.

This sets the following variables:

```vcl
req.http.ua_family
req.http.ua_major
req.http.ua_minor
req.http.ua_patch
```

For example, it might return the following:

```vcl
ua_family: "Chrome"
ua_major:  "67"
ua_minor:  "0"
ua_patch:  "3396"
```

Not all variables are set for every user agent. For example, Firefox might show:

```vcl
ua_family: "Firefox"
ua_major:  "60"
ua_minor:  "0"
ua_patch:  "null"
```

## Development

This works by parsing the ua-parser ruleset and generating VCL which
follows its matching rules. It also includes a full test suite from
ua-parser.

You should have access to the Fastly GitHub organization. Then run:

```bash
$ git clone git@github.com:fastly/uap-vcl.git
Cloning into 'uap-vcl'...
$ npm install
$ npm run generate
```

This generates [uap.vcl](uap.vcl).

## Contributing

Send a pull request, but don't forget to:

```bash
$ npm run eslint
$ npm run prettier
$ npm run generate
$ npm run test
```

## License

This code is available as open source under the terms of the
[Apache 2 License](http://opensource.org/licenses/Apache-2.0).

## Copyright

Copyright 2018 Fastly, Inc.

## Future

Is this useful? Let me know! Léon Brocard <<leon@fastly.com>>
