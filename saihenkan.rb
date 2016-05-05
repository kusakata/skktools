#!/usr/bin/env ruby -E euc-jis-2004:utf-8
# -*- coding: utf-8 -*-

# saihenkan.rb -- convert SKK normail dictionary to saihenkan dictionary.
#
# Copyright (C) 2003 NAKAJIMA Mikio <minakaji@namazu.org>
#
# Author: NAKAJIMA Mikio <minakaji@namazu.org>
# Created: March 26, 2003
# Last Modified: $Date: 2006/01/04 10:35:06 $
# Version: $Id: saihenkan.rb,v 1.2 2006/01/04 10:35:06 skk-cvs Exp $

# This file is part of Daredevil SKK.

# Daredevil SKK is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either versions 2, or (at your option)
# any later version.
#
# Daredevil SKK is distributed in the hope that it will be useful
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Daredevil SKK, see the file COPYING.  If not, write to the
# Free Software Foundation Inc., 51 Franklin St, Fifth Floor, Boston,
# MA 02110-1301, USA.
#
# Commentary:
# saihenkan.rb SKK-JISYO.S | nkf -e > SKK-JISYO.saihenkan
#

file = ARGV.shift
if file
  print ";;This file was generated by saihenkan.rb at #{Time.new()}\n"
  print ";; okuri-ari entries.\n;; okuri-nasi entries.\n"

  File.open(file).each do |line|
    if (line =~ /^([^ a-z].*[^a-z]) \/(.+)\/$/)
      candidates = $2
      candidates = candidates.split('/')
      max_index = candidates.length - 1
      if (max_index > 0)
        copy = candidates
        candidates.each do |can|
          print can, ' /'
          copy.each do |c|
            if c != can
              print c, '/'
            end
          end
          print "\n"
        end
      end
    end
  end
end
# end of saihenkan.rb
