% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/networkAnalysis.R
\name{modEnrich}
\alias{modEnrich}
\title{Module enrichment analysis.}
\usage{
modEnrich(ig, mods, levels = c("x", "y"), go2eg, glb = 15, minGO = 5,
  thresh = 0.05, adjust = "BH", prefix = "M", process_alias = NULL)
}
\arguments{
\item{ig}{An igraph network object output from either 
\code{\link{adj2igraph}, \link{rankHub}, \link{cisTrans}}.}

\item{mods}{modules with three accepted formats. 
\itemize{ 
  \item An igraph object of class 'communities', 
  which is typically the output of the cluster_* functions of igraph.
  \item A list where each element is a character vector that only contains 
  the node identifiers from either \code{yinfo$id} or  \code{xinfo$id} input to 
  function \code{\link{adj2igraph}}.
  \item An integer vector with names as node identifiers and values as an integer. 
  For example \code{c(id1 = 1, id2 = 2, id3 = 2, id4 = 1)}.
}}

\item{levels}{Any given module can contain x nodes or y nodes.
If both predictors and responses have a functional mapping 
in the \code{go2eg} argument, then specify \code{levels = c("x","y")}. 
Otherwise, specify only those nodes that have a functional mapping. 
See details for more discussion.}

\item{go2eg}{Named list where the names denote a
 biological process (e.g. Gene Ontology ID) and
the elements of the list is a vector of members 
belonging to the biological process. 
The list ought to be non-redundant in names. For example, 
\code{list(bio_proc_1 = c("gene1", "gene2", "gene3"),
           bio_proc_2 = c("gene4", "gene5", "gene6")
           )}}

\item{glb}{Integer defining the smallest possible size of a module
in order for the module to be tested for enrichment.}

\item{minGO}{Integer defining the smallest possible number of 
nodes represented in a biological process to be called a 
significant enrichment of that biological process.}

\item{thresh}{Numeric between 0 and 1 indicating the threshold at which 
adjusted P-values should be considered significant.}

\item{adjust}{Character of type \code{stats::p.adjust.methods} for 
specifying the type of multiple comparison adjustment desired.}

\item{prefix}{Character to prefix module identifiers.}

\item{process_alias}{Vector mapping biological process identifiers in 
\code{go2eg} with biologically meaningful descriptions. The vector 
\code{process_alias} must have names
as the same names in \code{go2eg} and the elements are the  
biologically meaningful descriptions.}
}
\value{
A three-item list: 

\itemize{
\item The element "ig" is the input igraph network object 
updated with a "process_id" attribute 
for nodes affiliated with a significant GO-term.
The "process_id" and "module" attributes together can be especially
useful for visualizing which nodes of a module 
are enriched for a specific biological function. 
\item The element "etab" is the polished module enrichment table
 conveniently organized to report significant GO terms in modules,
  the representation of the GO term in the module relative to the 
  size of the GO term, and what x-hubs may belong to the module. 
\item The element "eraw" contains details for each (module, GO-term) pair
 that was subjected to the hyper-geometric test. 
 This output gives the user more control (if desired) over enrichment 
 by reporting all tests, the relative over-representation 
 of a GO-term in that module, the raw P-value, and the adjusted P-value.
}
}
\description{
Identify biological processes 
which are significantly-enriched in network modules.
}
\details{
The hyper-geometric test is used to test for 
over-representation of a biological process. In the 
\code{phyper} R function, parameter \code{q} is the 
overlap between the biological process group and the module, 
where the module is reduced to only its y node members if \code{level = "y"}.
Parameter \code{m} is the size of the biological process.
Parameter \code{n} is the number of nodes in the network not 
in the biological process. This excluding node levels that do not have a functional mapping.
In other words, if no x nodes do not appear in the mapping of \code{go2eg}, 
corresponding to \code{level = "y"}, then x nodes are not counted,
 but "y" nodes without a mapping are counted, because most y nodes do have a mapping.
}
\seealso{
\code{\link{adj2igraph}}, \code{\link{rankHub}}, \code{\link{cisTrans}}, 
\code{\link{reportHubs}}, \code{\link{xHubEnrich}}
}
