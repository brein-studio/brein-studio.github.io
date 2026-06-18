---
title: Puzzle 3x3
parent: Environments
nav_order: 2
---

# Puzzle 3x3

{: .info }
> **Classic Puzzle game**
>
> The Puzzle environment is taken from the ProB repository...

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

## Quick Tour

- Open machine `Puzzle8.mch`,
- Load the VisB file `Puzzle8.visb.json`,
- Select reward mode **Once-and-For-All (subscribed state formula)**,
- Enter `reward`,
- Choose **MPI**,
- Click **Explore**, and wait until the end of exploration
- Click **Run**, and wait until the end of learning (about 5mn)
- Click on **Random state**, to select a random state
- Click **⏭**, to automatically execute the learned policy.

<pre>
Exploration finished. Explored states: 181442 | time : 29155 ms

MPI finished | core time = 16.370s | total time = 73.077s
Total pipeline 
    | states = 181441 
    | Cache states = 49444 ms 
    | Cache rewards = 194945 ms 
    | total = 317471 ms = 5,29mn
</pre>