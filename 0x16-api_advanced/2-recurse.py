#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
Created on Thu Sep 17 11:47:53 2020

@author: Robinson Montes
"""
from json import loads
from requests import get


def recurse(subreddit, hot_list=[]):
    """recursive function that queries the Reddit API and returns a list
    containing the titles of all hot articles for a given subreddit. If no
    results are found for the given subreddit, the function should return None.
    """
    url = 'https://www.reddit.com/r/{}/hot.json'.format(subreddit)
    headers = {
        'User-Agent':
        'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.2.3) \
        Gecko/20100401 Firefox/3.6.3 (FM Scene 4.6.1)'
    }
    response = get(url, headers=headers, allow_redirects=False)
    reddits = response.json()

    try:
        children = reddits.get('data').get('children')
        for title in children:
            hot_list.append(title.get('data').get('title'))
        return hot_list
    except:
        print(None)
        return 0
