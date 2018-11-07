# Acessing Diversity in Multiplex Networks - Codes, Datasets and Examples

In this repository, you will find the codes and instances used in the article:

Acessing Diversity in Multiplex Networks by L.C. Carpi, T.A. Schieber, P.M. Pardalos, G. Marfany, C. Masoller, A. Díaz-Guilera, M.G. Ravetti (https://arxiv.org/abs/1805.12350)

## Codes

Download and run the funcdiv.r file.

Here, G and H are graphs in igraph format. 

Computing the node distance distribution of a graph: nodedist(G)

Computing the transition matrix of a graph: mat.trans(G)

### Computing the D and Di metric between G and H

The Di function gets the node distance distributions and the transition matrix of the graphs G and H and returns a vector of size N (total number of links). This vector represents, for each entry j=1:N, the distances between the node j of graphs G and H.

Example: make 

ndg=nodedist(G)

ndh=nodedist(H)

tg=mat.trans(G)

th=mat.trans(H)

Di(ndg,tg,ndh,th)

The D metric is obtained by the average of the Di values.

D=mean(Di(ndg,tg,ndh,th))

### Computing the diversity for a given distance matrix

The function diversity() computes the diversity value for a given simetric distance matrix.

Example:

diversity(matrix(c(0,0.5,0.3,0.5,0,0.8,0.3,0.8,0),ncol=3))

## HIV Dataset

