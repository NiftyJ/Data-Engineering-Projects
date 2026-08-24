# Data Engineering Projects

A collection of data engineering and analytics engineering projects — dimensional modelling,
SQL pipelines, semantic models and BI reporting.

## Interactive resume

[`docs/index.html`](docs/index.html) is a self-contained interactive resume built from this
profile: it renders the Adventure Works star schema as a clickable diagram and fetches the
repository list live from the GitHub API.

To host it with GitHub Pages: **Settings → Pages → Deploy from a branch**, select the branch
and the `/docs` folder. The page then serves at `https://niftyj.github.io/Data-Engineering-Projects/`.

## Projects

| Project | Description | Stack |
| --- | --- | --- |
| [Adventure Works](adventure-works/) | Kimball-style star schema built from the AdventureWorks OLTP database, exposed through an SSAS tabular model and a Power BI report. 8 dimensions, 4 fact tables, 20 foreign keys with orphan validation. | SQL Server · SSAS · Power BI · DAX |
