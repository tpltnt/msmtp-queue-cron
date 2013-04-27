#!/bin/sh

# a simple shell script to empty your msmtp-queue via cron
# Copyright (C) 2013  tpltnt
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# check for msmtp-queue
which msmtp-queue
if [[ 0 -ne $? ]]
then
    echo "please install msmtp(queue)" &>2
    exit 1
fi
# check for ping
which ping
if [[ 0 -ne $? ]]
then
    echo "please install the ping utility" &>2
    exit 1
fi

# ping google to test for internet connectivity
ping -c 1 google.com
if [[ 0 -eq $? ]]
then
    # we can ping google -> empty the local mail queue
    msmtp-queue
fi
