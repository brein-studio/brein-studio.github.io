---
title: Puzzle
parent: Environments
nav_order: 2
---

# Puzzle

{: .info }
> **Classic Sliding Puzzle**
>
> This environment models the well-known 8-puzzle. The objective is to rearrange the numbered tiles into their goal configuration by sliding one tile at a time into the empty cell.

### Contributors

- Akram Idani (<akram.idani@univ-grenoble-alpes.fr>)

## Resources

Clone the repository:

```bash
git clone https://github.com/brein-studio/brein-studio.git
```

The Puzzle environment is located in:

```text
brein-studio/puzzle
```

## Overview

The environment models the classical **8-puzzle** on a **3×3** grid. Eight numbered tiles and one empty cell are represented as variables of an executable B machine. At every step, the agent may execute one of four operations:

- `MoveUp`
- `MoveDown`
- `MoveLeft`
- `MoveRight`

The episode terminates when every tile reaches its target position.

<p align="center">
  <img src="figs/puzzle/puzzle.gif" width="260">
</p>

## Reward Function

The reward is defined directly in the B specification.

The function `goalVal(i,j)` specifies the value that should appear in cell `(i,j)` in the solved puzzle.

```text
goalVal(i,j) ==
    (j - 1 + (i - 1) * dim);
```

Using this function, the goal state is defined as:

```text
GOAL ==
  !(i,j).(
      i:1..dim &
      j:1..dim
      => board(i|->j) = goalVal(i,j)
  );
```

The predicate `GOAL` holds when every tile occupies its target position.

To provide denser feedback during learning, the specification counts how many tiles are already correctly positioned:

```text
correctCount ==
  card({
      i,j |
      i:1..dim &
      j:1..dim &
      board(i|->j) = goalVal(i,j)
  });
```

Finally, the reward combines this information with a terminal bonus and a small step penalty:

```text
reward ==
    (1.0 * real(correctCount))
  + (IF GOAL THEN 5.0 ELSE 0.0 END)
  - 0.05;
```

The reward therefore consists of:

- **+1** for each tile already in its goal position;
- **+5** when the puzzle is completely solved;
- **−0.05** at every step to encourage shorter solutions.

Unlike a sparse reward that only rewards the final configuration, this shaping reward provides informative feedback throughout the episode, allowing the learning algorithms to converge much faster.

## Quick Tour

- Open machine `Puzzle8.mch`,
- Load the VisB file `Puzzle8.visb.json`,
- Select reward mode **Once-and-For-All (subscribed state formula)**,
- Enter `reward`,
- Choose **MPI**,
- Click **Explore** and wait until the exploration completes,
- Click **Run** and wait until learning completes (approximately **5 minutes**),
- Click **Random state** to generate a random puzzle,
- Click **⏭** to watch the learned policy solve the puzzle automatically.

## Performance

On a standard desktop machine, the complete state space contains **181,442** reachable states.

Typical execution times are:

<pre>
Exploration
-----------
States explored : 181442
Time            : 29 s

Modified Policy Iteration
-------------------------
Core algorithm  : 16 s
Total learning  : 73 s

Complete pipeline
-----------------
State caching    : 49 s
Reward caching   : 195 s
Total execution  : 317 s (≈ 5.3 min)
</pre>

## Source Code

The environment is composed of:

- `Puzzle8.mch`: executable B specification (taken from the ProB repository),
- `Puzzle8.visb.json`: VisB visualization.

The reward function is embedded directly in the B specification and can easily be modified to experiment with alternative reward shaping strategies.