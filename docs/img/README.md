# Project card photos

Each portfolio card on the resume can show a photograph. Images live in this
folder and are referenced by filename from `docs/index.html`.

## Adding them

1. Put a `.jpg` in this folder using the filename listed in `sources.txt`
   (for example `plant-disease-yolo.jpg`).
2. In `docs/index.html`, set `photos: true` inside the `CONFIG` block near the
   top of the script.
3. Commit and push — Vercel redeploys automatically.

Any card whose image is missing, or whose image fails to load, falls back to
the generated signature artwork on its own. Partial sets are fine: add three
images and only those three cards show photos.

## Fetching in bulk

`sources.txt` maps each filename to a URL. Fill in the URLs, then run:

```bash
bash scripts/fetch-images.sh
```

## Recommended specs

| Property | Value |
| --- | --- |
| Aspect ratio | roughly 16:7 — the card band is 320 × 140 CSS px |
| Width | 900–1200 px (covers retina without bloating the page) |
| Format | JPEG, quality ~75 |
| Weight | under ~120 KB each |

## Licensing

Only use images you have the right to publish — Unsplash, Pexels and Wikimedia
Commons all offer suitable free licences. Where a licence requires credit, put
the text in the matching entry's `imgCredit` field in `docs/index.html` and it
renders as a small caption in the corner of the card.
