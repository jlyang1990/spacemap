% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/networkAnalysis.R
\name{cisTrans}
\alias{cisTrans}
\title{Identify x-y cis and trans edges.}
\usage{
cisTrans(ig, level = c("x-y"), cw = 2e+06, ignoreStrand = TRUE)
}
\arguments{
\item{ig}{An igraph network object output from \code{\link{rankHub}}}

\item{level}{Character vector currently only supporting 'x-y' edge 
labeling of cis/trans status.}

\item{cw}{Numeric value denoting the half length of the genomic interval 
used for calling a response node (i.e. of levels y) as cis regulated by a predictor 
node (i.e. of levels x). Defaults to 2Mb.}

\item{ignoreStrand}{Logical defaults to TRUE specifying that strand specificity 
is not required to call cis/trans edges.}
}
\value{
The igraph object \code{ig} with x-y edges 
updated with attribute 'cis_trans' indicating cis/trans status. 

Also x node vertices are updated with attributes 
'ntrans' reporting the number of trans regulations by a node
 (similarly for attribute 'ncis') and 'regulates_in_cis'
 lists specific y nodes regulated in cis by x nodes.
}
\description{
Label igraph object with cis/trans 
status for x-y edges.
}
\details{
This function requires the GenomicRanges package from Bioconductor. 
See \url{http://bioconductor.org/packages/release/bioc/html/GenomicRanges.html}
for installation details. 
The specific functions from GenomicRanges are 'findOverlaps' and 'countOverlaps'. 
The \code{ig} network parameter requires vertex attributes for genome coordinates 
specified as \code{chr,start,end} 
(see details section of \code{\link{adj2igraph}}).
}
\seealso{
\code{\link{rankHub}}, \code{\link{adj2igraph}}, 
\code{\link{reportHubs}}, \code{\link{xHubEnrich}}
}
