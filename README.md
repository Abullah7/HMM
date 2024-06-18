## Forward-backward
1.	Introduction to the Forward Algorithm:
•	The Forward algorithm is a fundamental tool in HMMs used to compute the probability of observing a sequence of symbols up to a certain point given a particular state.
•	It facilitates the computation of the likelihood of observed sequences, aiding in tasks like sequence prediction, decoding, and parameter estimation.

2.	Algorithmic Process:
•	Initialization: Begin by initializing the forward probabilities at time 1 based on the initial state probabilities and the emission probabilities.
•	Recursion: Proceed with a recursive process, computing the forward probabilities for subsequent time steps by considering the probabilities of transitions between states and emission of observed symbols.

3.	Forward Probabilities:
•	At each time step, the forward algorithm computes the probability of being in a particular state and observing the given sequence up to that point.
•	These probabilities are updated and propagated forward in time, incorporating both the observed symbols and the transitions between hidden states.

4.	Backward Algorithm Overview:
•	The Backward algorithm, a core component of HMMs, computes the probability of observing the remaining sequence of symbols given a specific state at a particular time, utilizing future observations to infer the likelihood of subsequent symbols.
•	It operates in a manner complementary to the Forward algorithm, employing a backward recursion process to estimate probabilities backward in time.

5.	Iterative Probabilistic Inference:
•	Employing a recursive approach, the Backward algorithm iteratively computes backward probabilities for each time step, starting from the last observation and moving backward in time through the sequence.

6.	Utilization of Transition and Emission Probabilities:
•	Leveraging transition probabilities between states and emission probabilities for observed symbols, the algorithm estimates the probability of observing subsequent symbols given a particular state at a certain time.

## baum-welch 
The forward–backward algorithm is an inference algorithm for hidden Markov models which computes the posterior marginals of all hidden state variables given a sequence of observations/emissions it computes,
for all hidden state variables the distribution .This inference task is usually called smoothing.
The algorithm makes use of the principle of dynamic programming to efficiently compute the values that are required to obtain the posterior marginal distributions in two passes. 
The first pass goes forward in time while the second goes backward in time; hence the name forward–backward algorithm.
The term forward–backward algorithm is also used to refer to any algorithm belonging to the general class of algorithms that operate on sequence models in a forward–backward manner.
In this sense, the descriptions in the remainder of this article refer only to one specific instance of this class.
In the first pass, the forward–backward algorithm computes a set of forward probabilities which provide, 
for all , the probability of ending up in any particular state given the first  observations in the sequence. In the second pass, 
the algorithm computes a set of backward probabilities which provide the probability of observing the remaining observations given any starting point . 
