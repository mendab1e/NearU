#NearU#

**Geo-tweets semantic analysis server written in Ruby on yandex hackathon in 24-hours coding session.**

This application collects tweets with geo-tags within constraints of bounding boxes from Twitter streaming API.

Let suppose that there are 2 groups of tweets with geo-tags:
1.  tweets with content like: 'I am in good mood', author just forget to disable geo-tag, content of that tweets is useless in terms of map;
2.  tweets with content like: 'I am sitting in the new cool bar', those tweets provide information that is useful for place on map.

The main goal of NearU is to distil only useful tweets of second group and provide them by restful api to map-based application.

NearU allows you to upload some texts that contain sentences and phrases about places or events. It removes stop-words, than it stem roots of words and split text on N-grams.

Using these N-grams, it determines in which group to place a tweet.

Now it only supports Russian language.

To load articles, places them in ./texts and use the rake task:
```rake articles_analyzer:load_all```

To load single article use the rake task:
```rake articles_analyzer:load_one file_name=_path_to_file```

To collect tweets, configure your twitter api application and specify bounding boxes for cities in settings.yml and use the rake task:
```rake tweet_loader:load_all```