

############
### Implementation (It is considered that the initial node is the 1 and the end one the only one that has no leaving edges)
############

M <- 10000 #value big enough (change the number in order to suit your needs)

dijkstraSolver <- function(weightMatrix){
#Step 1: initialization
  processedNodes <- c()
  notProcessedNodes <- c(1:nrow(weightMatrix))
  pi <- rep(+Inf, nrow(weightMatrix))
  E <- rep(-1, nrow(weightMatrix))
  
#Step 2: first node initialization
  processedNodes <- c(processedNodes, 1)
  notProcessedNodes <- notProcessedNodes[-which(notProcessedNodes==1)]
  pi[1] = 0
  E[1] = 0
  for(j in 1:ncol(weightMatrix)){
    if(is.na(weightMatrix[1, j]) == FALSE){
      pi[j] = A[1, j]
      E[j] = 1
    }
  }
  
#Step 3: processing of the rest of nodes
  while(length(notProcessedNodes) > 0){
    #not processed node with least weight is searched
    min = M
    index = -1
    for(i in notProcessedNodes){
      if(pi[i] < min){
        min = pi[i]
        index = i
      }
    }
  
    #lists of processed and not processed nodes are updated
    processedNodes <- c(processedNodes, index)
    notProcessedNodes <- notProcessedNodes[-which(notProcessedNodes==index)]
    
    #vectors E and PI are updated
    for(j in 1:ncol(weightMatrix)){
      if(is.na(weightMatrix[index, j]) == FALSE && pi[index]+weightMatrix[index, j] < pi[j]){
        pi[j] = pi[index]+weightMatrix[index, j]
        E[j] = index
      }
    }
  }
  
  
  #preparation of the solution to return 
  endNode <- -1
  flag = FALSE
  for(i in nrow(weightMatrix)){
    for(j in ncol(weightMatrix)){
      if(is.na(weightMatrix[i, j]) == FALSE){
        flag = TRUE
        break
      }
    }
    if(flag == FALSE){
      endNode <- i
      break
    }else{
      flag = FALSE
    }
  }
  solutionRoute <- c(endNode)
  while(1 %in% solutionRoute == FALSE){
    solutionRoute <- c(solutionRoute, E[solutionRoute[length(solutionRoute)]])
  }
  
  return(list('solution' = rev(solutionRoute), 'objective value' = pi[endNode]))
}


############
### Example 1
############

nodes<-15
#weights:
A<-matrix(nrow=nodes,ncol=nodes)
A[1,2]<-1
A[1,3]<-9
A[2,5]<-1
A[2,4]<-2
A[2,3]<-5
A[3, 6]<-3
A[4, 8]<-6
A[4,9]<-7
A[4,6]<-7
A[4,3]<-9
A[5,7]<-7
A[5,8]<-1
A[5,4]<-7
A[6,11]<-2
A[6,10]<-6
A[7,13]<-9
A[7,8]<-2
A[8,12]<-8
A[8,9]<-3
A[9,14]<-5
A[9,11]<-9
A[9,6]<-6
A[10,11]<-9
A[10,15]<-3
A[11,14]<-5
A[11,15]<-1
A[12,14]<-1
A[12,9]<-3
A[13,12]<-3
A[13,14]<-3
A[14,15]<-9
A


############
### Example 2
############

nodes<-5
#weights:
A<-matrix(nrow=nodes,ncol=nodes)
A[1, 2]<-2
A[1, 3]<-2
A[1, 4]<-3
A[2, 5]<-4
A[3, 2]<-4
A[3, 5]<-3
A[4, 3]<-1
A[4, 5]<-0


############
### Application
############

dijkstraSolver(A)
