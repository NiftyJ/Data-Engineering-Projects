# Data Engineering Projects

A collection of data engineering and analytics engineering projects — dimensional modelling,
SQL pipelines, semantic models and BI reporting.

## Interactive resume

[`docs/index.html`](docs/index.html) is a self-contained interactive resume built from this
GitHub account: a clickable Adventure Works star-schema explorer, a curated portfolio of every
substantive repository (data & BI, trading & quant, ML & vision, reinforcement learning), and
deep-dive write-ups of the ML / deep-learning work. Live repository metadata is fetched from
the GitHub API on load. No build step — one static HTML file.

### Hosting on Vercel (recommended)

1. Go to [vercel.com/new](https://vercel.com/new) and import this repository.
2. Leave **Framework Preset** as **Other** — [`vercel.json`](vercel.json) already points the
   output directory at `docs/`, so no build command is needed.
3. Deploy. The site serves at `https://<project-name>.vercel.app`, and every push to the
   production branch redeploys it automatically.

### Hosting on GitHub Pages (alternative)

**Settings → Pages → Deploy from a branch**, select the branch and the `/docs` folder.
The page then serves at `https://niftyj.github.io/Data-Engineering-Projects/`.

## Projects

| Project | Description | Stack |
| --- | --- | --- |
| [Adventure Works](adventure-works/) | Kimball-style star schema built from the AdventureWorks OLTP database, exposed through an SSAS tabular model and a Power BI report. 8 dimensions, 4 fact tables, 20 foreign keys with orphan validation. | SQL Server · SSAS · Power BI · DAX |
