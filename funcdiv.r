library(igraph)
library('Matrix')

nodedist<-function(g){
# computes the node distance distribution of an unweighted and undirected network. (g is a graph in igraph format)

N<-length(V(g))


r<-c()

dg=shortest.paths(g,mode=c("all"),algorithm=c("unweighted"))#geodesic distance

dg[which(dg==Inf)]=N

q=setdiff(intersect(dg,dg),0)

a=Matrix(0,ncol=N,nrow=N)

for(i in (1:length(q))){

b=dg

b[which(b!=q[i])]=0

a[1:N,q[i]]=colSums(b)/q[i]

}


return(a/(N-1))

}



mat.trans<-function(g){
#Computes the transition matrix - g is a graph in igraph format


d<-get.adjacency(g)

d=d/colSums(d)

d[is.na(d)]=0

q=which(degree(g)==0)

if(length(q)>0){

d[matrix(c(q,q),ncol=2)]=1

}

return(d)

}



JS_l<-function(d,d1){

m=(d+d1)/2

d=-d*log(d)

d[is.na(d)]=0

d1=-d1*log(d1)

d1[is.na(d1)]=0

m=-m*log(m)

m[is.na(m)]=0


return(sqrt(colSums(t(m-(d+d1)/2))/log(2)))

}

Di<-function(ndg,tg,ndh,th){
#given two networks g and h, the Di function gets the node distance distribution of g (ndg),the transition matrix of g (tg), the node distance distribution of h (ndh),the transition matrix of h (th) and returns the Di as a vector of size N. Thus, D_1 is the first entry, D_2 the second and so on.

return((JS_l(ndg,ndh)+JS_l(tg,th))/2)

}


diversity<-function(a){
#a is a simetric distance matrix 


div=0

while(length(a)>1){

n=sqrt(length(a))

a[matrix(c(1:n,1:n),ncol=2)]=1

div=div+min(a)

escolhas=ceiling(which(a==min(a))/n)

b=a[escolhas,]

r<-c()

for(j in (1:length(escolhas))){

r<-c(r,sort(b[j,])[2])

}

quem=order(r)[1]

quem=escolhas[quem]

a=a[setdiff(1:n,quem),setdiff(1:n,quem)]

n=sqrt(length(a))

}

return(div)

}


#diversity(matrix(c(0,0.5,0.3,0.5,0,0.8,0.3,0.8,0),ncol=3))
