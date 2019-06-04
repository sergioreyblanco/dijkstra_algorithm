# Implementation of the Dijkstra Algorithm in R language

Here is a very simple implementation of the Dijkstra algorithm in R language. 

The whole algorithm is implementated in the function `dijkstraSolver`. It is divided in three well diferenced parts: general initialization, first node initialization and processing of the rest of the nodes. Default, initial node is defined by a node that has no incident edges and the last node by a node that has no leaving edges.

The function takes as an input parameter a representation of a graph in the way of a matrix where each row is node and each cell in the row is related with the weight of the adjacent node of the current one (NA if the current one is not connected with it and an integer value if it is). The function gives a return value consisting of a list with two components in which the first is the optimal sequence of nodes from the first to the last one and the other is the cost of that route.

Example matrices are given (located in the last part of the code after the function), so you can test the function and create new graphs. The first example matrix will result in a graph like this one: .

The code does not need any additional libraries to run, besides the classical R environment.
