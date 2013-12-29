#!/usr/bin/python

from bs4 import BeautifulSoup
import sqlite3
import sys

def get_kernel_path():
	soup = BeautifulSoup(sys.stdin.read())

	latest_link = soup.find("td", id="latest_link")
	relative_url = latest_link.a['href']
	version_string = latest_link.a.string

	return(relative_url)

if __name__ == '__main__':
	print(get_kernel_path())

