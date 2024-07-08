---
title: "2024 07 06 Retrievers Inprogress"
date: 2024-07-06T13:01:08+03:00
draft: true
# weight: 1
# aliases: ["/first"]
tags: 
author: "TM"
# author: ["Me", "You"] # multiple authors
showToc: true
TocOpen: false
hidemeta: false
comments: false
description: ""
canonicalURL: "https://canonical.url/to/page"
disableHLJS: true # to disable highlightjs
disableShare: false
disableHLJS: false
hideSummary: false
searchHidden: true
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowWordCount: true
ShowRssButtonInSectionTermList: true
UseHugoToc: true
cover:
    image: "<image path/url>" # image path/url
    alt: "<alt text>" # alt text
    caption: "<text>" # display caption under cover
    relative: false # when using page bundles set this to true
    hidden: true # only hide on current single page
editPost:
    URL: "https://github.com/tayyabmujahid/tayyabmujahid.github.io/blob/main/content"
    Text: "Suggest Changes" # edit text
    appendFilePath: true # to append file path to Edit link
---





# Retrievers

## RAG Evaluations



https://huggingface.co/learn/cookbook/en/rag_evaluation

https://www.sh-reya.com/blog/needle-in-the-real-world/

## Cosine vs L2 similarity

https://www.baeldung.com/cs/euclidean-distance-vs-cosine-similarity





## Engines in Opensearch

**Standard k-NN search** methods compute similarity using a **brute-force**  approach that measures the nearest distance between a query and a number of points, which produces exact results

### Approximate K-NN search algorithm 

- Approximate k-NN can produce results in tens of milliseconds, [even for collections of hundreds of millions of vectors](https://aws.amazon.com/blogs/big-data/choose-the-k-nn-algorithm-for-your-billion-scale-use-case-with-opensearch/), orders of magnitude faster than exact k-NN

- Hierarchical Navigable Small World graphs (HNSW)

  HNSW uses a hierarchical set of proximity graphs in multiple layers to  improve performance when searching large datasets. This helps to  overcome the scaling problems that usually occur when searching  high-dimensional datasets.

### FAISS

### LUCENE

### NMSLIB

https://opensearch.org/docs/1.3/search-plugins/knn/approximate-knn/#recommendations-for-engines-and-cluster-node-sizing



## Re-Ranking

Reranking is the process of refining the initial ranking of documents retrieved by a retrieval system. In the context of Retrieval-Augmented Generation (RAG), reranking plays a crucial role in improving the relevance and quality of the retrieved documents that are used to generate the final output.

The initial retrieval step in RAG typically uses a sparse retrieval method, such as BM25 or TF-IDF, to quickly find a set of potentially relevant documents based on the input query. However, these methods rely on lexical matching and may not capture the semantic meaning or context of the query effectively.

Rerankers, on the other hand, are designed to reorder the retrieved documents by considering additional features, such as semantic similarity, relevance scores, or domain-specific knowledge. They aim to push the most relevant and informative documents to the top of the list, ensuring that the LLM has access to the best possible context for generating accurate and coherent responses.











