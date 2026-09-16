# Hand detection dataset

156,904 frames sampled from YouTube videos, annotated with hand bounding boxes (class 0 = hand).

## Layout

```
dataset/
  index.csv            one row per image: id, video, frame, category, pack, n_hands
  pack_000/ ... pack_031/
    0000001.jpg        image
    0000001.txt        label file, one line per hand: "0 cx cy w h" (normalized), empty file = no hands
```

- Images are numbered 0000001 to 0156904 with no gaps. Each pack holds 5,000 images (pack_031 holds the last 1,904).
- `index.csv` maps every id to its source video, frame number, and category.
- Label files: 66,087 images contain at least one hand, 90,817 are negatives with empty label files.
