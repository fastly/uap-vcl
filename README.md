# uap-vcl

## Description

`uap-vcl` is a VCL module which parses a User-Agent header and returns
the user agent family, major version, minor version and patch version.

Why do this in VCL? This module follows the same rules as
[http://www.uaparser.org/](ua-parser), an open-source and
community-driven, regexp-based user-agent parser. It has been ported to
many different programming languages all of which share the same parser.

If you are already using a ua-parser-based parser on your origin then
this module provides an easy migration path to moving User-Agent-based
logic to VCL.

You can view the output for your current browser at:
https://uap-vcl.global.ssl.fastly.net/

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

## Development

You should have access to the Fastly GitHub organization. Then run:

```bash
$ git clone git@github.com:fastly/uap-vcl.git
Cloning into 'uap-vcl'...
$ yarn install
$ yarn fetch
$ yarn generate
```

This generates [uap.vcl](uap.vcl).

## Contributing

Send a pull request, but don't forget to:

```bash
$ yarn eslint
$ yarn pretty
$ yarn generate
```

## License

This code is available as open source under the terms of the
[Apache 2 License](http://opensource.org/licenses/Apache-2.0).

## Future

Is this useful? Let me know! Léon Brocard <<leon@fastly.com>>
