puppet module for corosync
==========================

corosync is a standards-based cluster framework (daemon as well as modules) and implements "Revised BSD" licensed core functionalities required by openais.
This module will help you to setup and manage a rather simplistic unicast-driven corosync stack.

Basic usage
-----------

To install corosync (as well as havegd):

<pre>
        include corosync
</pre>

or the parameterized form:

<pre>
	class {'corosync':}
</pre>

Configure corosync
------------------

<pre>
        class {'corosync::config':
                authkey            => 'authkey',
                member_array       => [ '192.168.0.1','192.168.0.2' ],
                bindnetaddr        => '192.168.0.0',
        }
</pre>

Caveats
-------

The shipped configuration template needs the unicast-transport (UDPU)
which requires at least version (>= 1.3) of corosync

The authkey can easily be obtained by running

<pre>
        $ corosync-keygen
</pre>

In order to generate a fair amount of immediately available entropy the package 'havege' is installed as well

Copyright and License
---------------------

Copyright (C) 2012 Patrick Ringl <patrick_@freenet.de>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

