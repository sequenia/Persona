#!/usr/bin/env python
# -*- coding: utf-8 -*-
from subprocess import Popen, PIPE, call


if __name__ == '__main__':
    try:
        call(["kill", str(Popen("lsof -i :3000", shell=True, stdin=PIPE, stdout=PIPE).stdout.read().split("\n")[1].split()[1])])
    except Exception, e:
        print "PID do not exist!"
    finally:
        print "Finish script"
