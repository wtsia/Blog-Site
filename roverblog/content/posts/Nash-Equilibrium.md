+++
author = "Winston Tsia"
authorlink = ""
title = "Nash Equilibrium"
description = "Needs Editing"
tags = [
]
categories = [
    "Economics",
]
math = true
notaxonomy = false
hidden = true
norobots = true
nodate = true
hidemeta = true
+++

Formally, let $S_{i}$ be the set of all possible strategies for player $i$, where $i = 1, ... , N.$ Let $s^*=(s_{i}^{*},s_{-i}^{*})$ be a strategy profile, a set consisting of one strategy for each player, where $s_{-i}^{*}$ denotes the $N-1$ strategies of all the players except $i$. Let $u_{i}(s_{i},s_{-i}^{*})$ be player $i$'s payoff as a function of the strategies. The strategy profile $s^{*}$is a Nash equilibrium if,

$$
u_{i}(s_{i}^{*},s_{-i}^{*}) \geq u_{i}(s_{i},s_{-i}^{*})\;\;{\rm {for\;all}}\;\;s_{i}\in S_{i}
$$

A game can have more than one Nash equilibrium. Even if the equilibrium is unique, it might be weak: a player might be indifferent among several strategies given the other players' choices. It is unique and called a strict Nash equilibrium if the inequality is strict so one strategy is the unique best response:

$$
{\displaystyle u_{i}(s_{i}^{*},s_{-i}^{*})>u_{i}(s_{i},s_{-i}^{*})\;\;{\rm {for\;all}}\;\;s_{i}\in S_{i},s_{i}\neq s_{i}^{*}}
$$

Note that the strategy set 

$${\displaystyle S_{i}}S_{i}$$ 

can be different for different players, and its elements can be a variety of mathematical objects. Most simply, a player might choose between two strategies, e.g.

$${\displaystyle S_{i}=\{{\text{Yes}},{\text{No}}\}.}$$

Or, the strategy set might be a finite set of conditional strategies responding to other players, e.g. 

$${\displaystyle S_{i}=\{{\text{Yes}}|p={\text{Low}},{\text{No}}|p={\text{High}}\}.}$$

Or, it might be an infinite set, a continuum or unbounded, e.g. 

$${\displaystyle S_{i}=\{{\text{Price}}\}}$$

such that ${\displaystyle {\text{Price}}}$ is a non-negative real number. Nash's existence proofs assume a finite strategy set, but the concept of Nash equilibrium does not require it.

The Nash equilibrium may sometimes appear non-rational in a third-person perspective. This is because a Nash equilibrium is not necessarily Pareto optimal.

Nash equilibrium may also have non-rational consequences in sequential games because players may "threaten" each other with threats they would not actually carry out. For such games the subgame perfect Nash equilibrium may be more meaningful as a tool of analysis.

Strict/Weak Equilibrium
Suppose that in the Nash equilibrium, each player asks themselves: "Knowing the strategies of the other players, and treating the strategies of the other players as set in stone, would I suffer a loss by changing my strategy?"

If every player's answer is "Yes", then the equilibrium is classified as a strict Nash equilibrium.[15]

If instead, for some player, there is exact equality between the strategy in Nash equilibrium and some other strategy that gives exactly the same payout (i.e. this player is indifferent between switching and not), then the equilibrium is classified as a weak Nash equilibrium.

A game can have a pure-strategy or a mixed-strategy Nash equilibrium. (In the latter a pure strategy is chosen stochastically with a fixed probability).

Nash's Existence Theorem
Nash proved that if mixed strategies (where a player chooses probabilities of using various pure strategies) are allowed, then every game with a finite number of players in which each player can choose from finitely many pure strategies has at least one Nash equilibrium, which might be a pure strategy for each player or might be a probability distribution over strategies for each player.

Nash equilibria need not exist if the set of choices is infinite and non-compact. An example is a game where two players simultaneously name a number and the player naming the larger number wins. Another example is where each of two players chooses a real number strictly less than 5 and the winner is whoever has the biggest number; no biggest number strictly less than 5 exists (if the number could equal 5, the Nash equilibrium would have both players choosing 5 and tying the game). However, a Nash equilibrium exists if the set of choices is compact with each player's payoff continuous in the strategies of all the players.[16]