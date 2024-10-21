# MIPS Intermediate Problems

So far, we've learned how to use MIPS assembly to create conditionals, loops, and work with arrays. In this assignment, I've included a handful of practice problems to gain some more familiarity with MIPS branching instructions.

## Objectives
- Understand how to work with arrays, loops, and conditionals

## Resources
- [MIPS Instruction Sheet Reference](https://www.dsi.unive.it/~gasparetto/materials/MIPS_Instruction_Set.pdf)

---

## Task 1 - Fibonacci

### Objective
Develop a MIPS assembly program that prompts the user to enter a positive integer number, `n`, and prints out the first `n` Fibonacci numbers. The first two Fibonacci numbers are 0 and 1, and each subsequent number is the sum of the two preceding numbers.

### Task Requirements:

#### User Input for Sequence Length:
- The program should start by asking the user for a non-negative integer `n`, which represents how many Fibonacci numbers to generate and display. Make sure to display a prompt to the user here. You can do this by printing out an `.asciiz` string before reading the integer input.

#### Fibonacci Display Loop
- The program should then loop, printing and calculating the first `n` Fibonacci numbers. You can achieve a newline for each number by defining a variable containing a newline character `"\n"` and printing it out before or after each integer.
- The program should print out the first `n` Fibonacci numbers. `0` and `1` are included in the Fibonacci sequence, so if the user asks for 1 number, the program should print out `0`. If the user asks for 2 numbers, the program should print out `0` and then `1`. If the user asks for `0` numbers, the program should not print out anything.

#### Exit Program
- When the program finishes, you should exit it (instead of letting it drop off the bottom). The syscall code for program termination is `10`.
- If done correctly, your console output should read `--program is finished running--` after it is completed.

#### Example Output:
```
Please enter a number: 7 
0 
1 
1 
2 
3 
5
8
```
---

## Task 2 - Bubble Sort

### Objective
Develop a MIPS assembly program that defines an array of values and sorts them using the bubble sort algorithm.

### Task Requirements:

#### Define an Array in RAM
- Hardcode an array as a data item in RAM, it can contain any data values, but must have at least 5 unique items. So storing five `10`s in a row will not cut it, it must have at least 5 different elements.

#### Print out the Array Before Sorting
- Print out the string `"Before sorting: "` and then the array as shown in the example output.

#### Sort the Array
- Implement a proper bubble sort algorithm. This is described in the walkthrough below.
- Your implementation **MUST** include the optimization described in steps 4 and 5 of the walkthrough. If your implementation simply runs through the array `n-1` times (in the outer loop), you will lose points.

#### Print out the Array After Sorting
- Print out the string `"After sort: "` and then the array as shown in the example output.

### Task Walkthrough
The below is a scaffolded list of tasks that should help you get bubble sort implemented in MIPS:

1. Print out the message and array before sorting.
2. Perform a single pass through the array, swapping each element that is not in order as you go.
    - Use the `slt` instruction to compare two registers.
    - You can confirm this works by running the code and verifying that the largest element is in the last spot in the array.
3. Make sure that you don't go "out of bounds" of the array.
    - Iterating will use similar code to what you used to print the array, you just have to add conditionals and swapping.
4. Wrap the code from the previous step in another nested loop that runs `n - 1` times (where `n` is the length of the array). This will guarantee that the array is sorted.
5. Modify the code from step 2 so that after a complete pass through the array is made, you use a register to contain either `0` or `1`, indicating whether a swap occurred (`1` means swap did occur, `0` means swap did not occur).
6. Modify the loop from step 4 to stop when a complete pass through the array left the register at `0` (i.e. a swap did not take place).

Congrats! Now just print the sorted array and exit the program.
#### Example Outputs:
```
Before Sort: 19 10 19 1 11 17 0 15 15 10 
After Sort: 0 1 10 10 11 15 15 17 19 19 
-- program is finished running --
```
```
Before Sort: 19 14 19 9 5 16 4 0 14 11 
After Sort: 0 4 5 9 11 14 14 16 19 19 
-- program is finished running --
```
```
Before Sort: 8 3 6 2 1 9 7 4 5 10 
After Sort: 1 2 3 4 5 6 7 8 9 10 
-- program is finished running --
```