# Assessing Diversity in Multiplex Networks - Codes, Datasets and Examples

In this repository, you will find the codes and instances used in the article:

Assessing Diversity in Multiplex Networks by L.C. Carpi, T.A. Schieber, P.M. Pardalos, G. Marfany, C. Masoller, A. Díaz-Guilera, M.G. Ravetti (https://arxiv.org/abs/1805.12350)

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

The network consists of 1114 nodes replicated in 16 layers, being the nodes cellular genes and proteins that have been shown to interact with those encoded by HIV-1. Each layers results from the interactions shown by specific types of experimental assays. The data is obtained from BioGRID, a public database that archives and disseminates genetic and protein interactions from humans and model organisms (BioGRID Release 3.4.154, 2017).

The data are freely provided via BIOGRID-Human_Immunodeficiency_Virus_1-3-4-154.xlsx file. In the same file, the reader will find the diversity value for each one of the 1114 genes.

Please cite:

Assessing Diversity in Multiplex Networks by L.C. Carpi, T.A. Schieber, P.M. Pardalos, G. Marfany, C. Masoller, A. Díaz-Guilera, M.G. Ravetti (https://arxiv.org/abs/1805.12350)

Chatr-Aryamontri,  A. et  al. The  biogrid  interaction  database:  2017  update. Nucleic  acids  research 45, D369–D379  (2017).
