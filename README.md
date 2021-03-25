# <span style="font-family: SF Pro Text, Times New Roman; font-size: 1.25em; font-weight: 200;">Odd Jobs</span>

<span style="font-family: SF Pro Text, Times New Roman; font-size: 1.15em;">A solution for [1Computer1](https://github.com/1Computer1)‘s “tasks“ challenge, solved in Haskell.</span>

<br /> <br />

## <span style="font-family: SF Pro Text, Times New Roman; font-size: 1.5em; font-weight: 200;">What is “Odd Jobs“?</span>

<br />

<span style="font-family: SF Pro Text, Times New Roman; font-size: 1.15em;">“Odd Jobs“ is the title for one of the 4 programming challenges made up by [1Computer1](https://github.com/1Computer1) with no reward except the euphoric rush of finally seeing your program run successfully after extensive amounts of trial and error.</span>

<span style="font-family: SF Pro Text, Times New Roman; font-size: 1.15em;">The “Odd Jobs“ challenge gives you 3 non-negative integers; `N`, `M` and `D`. <br /> <br />
Integer `N` specifies the lines of tasks which are obligatory. Whereas the `M` integer specifies the lines of tasks which are not obligatory, but rather optional. And finally, the `D` integer specifies dependencies in the format</span>

```
    Task A, Task B -> Task C, Task D
```

<span style="font-family: SF Pro Text, Times New Roman; font-size: 1.15em;">
On the left-hand side are the tasks required in order to complete the tasks on the right-hand side. <br />
Meaning, in order to complete <code>Task C</code> and <code>Task D</code>, both <code>Task A</code> and <code>Task B</code> must be completed before-hand. 
</span>

<br /> <br />

## <span style="font-family: SF Pro Text, Times New Roman; font-size: 1.5em; font-weight: 200;">My solution</span>

<br />

<span style="font-family: SF Pro Text, Times New Roman; font-size: 1.15em;">My personal approach to solving the problem was quite inefficient, and there are definitely much better approaches to this. <br /> <br />
Nonetheless, the outputs from the inputs yield the expected results. However, they are not ordered the same. <br /> <br />
The way my solution works is by obtaining the input via the terminal, obtaining it, parsing it into pairs (obligatory tasks, optional tasks and dependencies), and from there on saving the obligatory tasks into a list of completed tasks, then splitting the dependencies into two parts:

- <p style="font-family: SF Pro Text, Times New Roman; font-size: 1.15em;">requirements</p>
- <p style="font-family: SF Pro Text, Times New Roman; font-size: 1.15em;">tasks to do</p>
  </span>

<span span style="font-family: SF Pro Text, Times New Roman; font-size: 1.15em;">
It matches each required task against the current list of completed tasks, and if all of the required tasks have been completed, it adds new tasks that haven‘t already been completed into the list of completed tasks. <br /> <br />

Below is a snippet of all of the inputs and outputs of each task example:

![First Image](https://github.com/ObscureNightingale/odd-jobs/media/fstw.gif)
![Second Image](https://github.com/ObscureNightingale/odd-jobs/media/sndtwo.gif)
</span>
