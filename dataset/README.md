# Hand detection dataset

205,375 frames sampled from online videos, annotated with hand bounding boxes (class 0 = hand).

## Layout

```
dataset/
  pack_000/ ... pack_041/
    0000001.jpg        image
    0000001.txt        label file, one line per hand: "0 cx cy w h" (normalized), empty file = no hands
```

- Images are numbered 0000001 to 0205375 with no gaps. Each pack holds 5,000 images (pack_041 holds the last 375).
- Label files: 114,558 images contain at least one hand, 90,817 are negatives with empty label files.
