cats
====
This is a script to get popular reddit images from bash and stitch them together so it is mostly just cat pictures

All content is owned by the site you are scraping, this is really just an alternative to the view in firefox

you can adapt it to whatever subreddit you prefer by changing "/r/funny" in the URL, this is not a serious project, but a fun utility to save time at wasting time.

Works only for linux/x86, a variant has worked on ARM but it required building xmlstarlet

recommended usage:

```sh
cd /dev/shm
git clone https://github.com/boleslaw/cats.git
cd cats
sh getF.sh

<some files d/l>

<firefox opens the cats>
```
