-- * hNeat
-- hNeat implements the Neuroevolution of Augmenting Topologies framework in
-- haskell. I also use this project as an experimentation on some ideas concerning
-- the understandability of the haskell libraries in general.

-- So, what is this library about?
-- It talks about evolution, and creatures, and genomes.

{-# OPTIONS_GHC -fdefer-typed-holes #-}

module Lib where

-- ** High level view of the library
-- Each genome encodes a list of *connection genes*, each of which refers to two
-- *node genes* being connected.

-- - node genes :: only the list of nodes
-- - connection genes :: in-node, out-node, weigth of a connection, innovation
--      number, whether the gene is expressed.

-- The mutations can affect:
-- - the connection weights (can happen or not)
-- - the network structures (structural mutations)

-- A structural mutation, in turn, can
-- - add a connection
-- - add a node (therefore splitting an existing connection)

-- Genes in crossing over can be Matching, Disjoint of Excess.
-- This distinction is useful in different contexts:
-- - In crossing over, the matching genes are chosen from either parent, while the
--   others always from the fittest
-- - In speciation, we can define a compatibility distance:

-- $$\delta = c_1 \frac{E}{N} + c_2 \frac{D}{N} + c_3 \overline{W}$$

-- where $E$, $D$ and $N$ are respectively the number of Excess, Disjoint and total
-- Nodes, while $\overline{W}$ is the average difference of the matching genes
-- (including the disabled ones).

-- Moreover, we talk about Esplicit Fitness Sharing, defining the fitness as:

-- $$f'_i = \frac{f_i}{\sum_{j=1}^n sh(\delta(i,j))}$$

-- I should add some notes on how the species are kept non-intersecting.

-- * Tipi di dato
