Bloo
============

Bloo is a Slack bot that makes sure we wash our dishes and the office is nice
and cozy.

**Table of Contents**

* [Setup](#setup)
* [Development](#development)
* [Contribution Guidelines](#contribution-guidelines)
* [About](#about)

Setup
-----

First, clone & setup the repository:

```
git clone git@github.com:subvisual/bloo.git
cd bloo
bin/setup
```

After that, open the `.env` file in your editor and fill in the required secret values.

A `SINATRA_REQ_TOKEN` variable is required. To get this value, first add the
[outgoing webhook](https://my.slack.com/apps/new/A0F7VRG6Q-outgoing-webhooks) to
your Slack team. Afterwards, copy the value to the `.env` file.

Development
-----------

To start your development environment run:

```
bin/server
```

This will start the Sinatra application.


Contribution Guidelines
-----------------------

Contributions must follow [Subvisual's guides](https://github.com/subvisual/guides).

About
------

~~Bloo is maintained by [Subvisual](http://subvisual.co)~~. Actually, it's
Subvisual that's maintained by Bloo

[![Subvisual](https://raw.githubusercontent.com/subvisual/guides/master/github/templates/subvisual_logo_with_name.png)](http://subvisual.co)

If you need to contact the maintainer you can <a href="mailto:contact@subvisual.co">reach out to us</a>.
