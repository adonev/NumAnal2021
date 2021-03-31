---
title: Lectures for Scientific Computing at NYU
layout: default
---

### 1 ([Feb 1 and Feb 3](Lectures/Introduction2021.pdf)). [Introduction to numerical analysis](Lectures/Introduction.pdf)

We will use the ancient yet still practical problem of [computing the square root](https://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Babylonian_method) to illustrate what numerical analysis is and look at first examples of Matlab codes ([Babylonian.m](Matlab/Nonlinear/Babylonian.m),  [BabylonianPlot.m](Matlab/Nonlinear/BabylonianPlot.m), [NonBabylonian.m](Matlab/Nonlinear/NonBabylonian.m), [SqrtTwoVar.m](Matlab/Nonlinear/SqrtTwoVar.m)). This will lead us into the topic of solving nonlinear equations.

Recitation leader will start doing Intro to Matlab ([week 1 intro](Matlab/matlab_tutorial_demo_week1.m), [week 2 intro](Matlab/matlab_tutorial_demo_week2.m)). Here are some notes on [Peculiarities of Matlab](Lectures/Matlab.pdf) for those with some programming experience.

### 2 ([Feb 8 and 10 and 11 (pre-recorded)](Lectures/Nonlinear1D2021.pdf)). [Solving Nonlinear Equations in 1D](Lectures/NonlinearEqs.pdf)

We will study (try out and analyze) several methods for solving equations with one variable: bisection (code [Bisection.m](Matlab/Nonlinear/Bisection.m)), Newton's method (Babylonian method is an example), and the secant and Regula Falsi methods (code [Secant.m](Matlab/Nonlinear/Secant.m) -- as an exercise, add Newton's method to the plot and compare its rate of convergence to the secant method).

This covers sections 1.1 and 1.4-1.6 in Theory textbook (Suli & Mayers), but see also Definition 1.4. Fixed-point iteration (sections 1.2 and 1.3) will be briefly covered in a pre-recorded lecture; for an example see the code [NonBabylonian.m](Matlab/Nonlinear/NonBabylonian.m) from the previous lecture.

#### Extra [notes on solving nonlinear equations](Lectures/Nonlinear1D.pdf)

These are some typed-up notes based on my Scientific Computing class that cover solving nonlinear equations including systems of equations. Useful as a reference/summary **after** you cover and understand the class material.

### No class Mon Feb 15th (Break)

### 3 ([Feb 17th](Lectures/FloatingPoint2021.pdf)). [Roundoff errors](Lectures/FloatingPoint.pdf)

Floating-point arithmetic is covered in Chapter 5 of the Practice textbook, in more detail than we will go through in class. Here is the code [harmonic.m](Matlab/harmonic.m) and [harmonicSP.m](Matlab/harmonicSP.m) for single precision, which makes it easier to see the roundoff errors.

### 4 (Thursday Feb 18th (makeup class)) [Worksheet 1](Worksheets/worksheet1.pdf)

It is best to start working on the code (part 2) on your own before class, especially if you are new to Matlab/programming.

### 5 ([Pre-recorded lecture Feb 18](Lectures/LinearAlgebra2021.pdf)): [(Review of) Linear Algebra](Lectures/LinearAlgebra.pdf)

Some of this is covered in Section 2.7 of the Theory textbook. For stability, also see Chapter 6 in Practice textbook. Being comfortable with linear algebra will be very important until midterm so it is important to review all of the PDF notes on your own.

### 6 ([Feb 22 and 25 (pre-recorded) and March 1](Lectures/LinearSystems2021.pdf)) [Solving **square** linear systems](Lectures/SquareSystems.pdf)

I think this is explained better and more straightforwardly in the Practice textbook Chapter 7 than in Chapter 2 of Theory textbook. However, I will not directly follow either one. Here is the code [MyLU.m](Matlab/MyLU.m).

#### Extra [notes on solving linear systems](Lectures/LinearSystems.pdf)

Some typed-up notes that may be useful for reviewing and synthesizing the material in the future.

### 7 (Feb 24th) [Worksheet 2](Worksheets/worksheet2.pdf)

This worksheet gives one motivation for why solving linear systems is a central topic in numerical computing, extending to many topics including solving equations, optimization, function approximation, etc.

### 8 (March 3rd) [Worksheet 3](Worksheets/worksheet3.pdf)

This worksheet is an example of a kind of problem you may see on the midterm exam, though it would be shorter on the exam.

### 9 ([Pre-recorded lecture March 4th](Lectures/NonlinearSystems2021.pdf)) [Systems of Nonlinear Equations](Lectures/NewtonHigherD.pdf)

This material is covered in Chapter 4 of the theory textbook but I will only cover Newton's method and not follow the book. In particular I will give not a strict proof of second-order convergence but rather an estimate that is the analog of what we did in 1D.

#### Extra [notes on nonlinear systems](Lectures/Nonlinear1D.pdf)

Section 3 in these typed-up notes covers Newton's Method for nonlinear systems.

### 10 ([March 8th and 10th](Lectures/LeastSquares2021.pdf)) [Overdetermined Linear Systems](Lectures/LeastSquares.pdf)

Overdetermined linear systems are covered in the Practice textbook in Chapter 7 and also in Chapter 2 of Theory textbook.

### 11 (March 15th) [Worksheet 4](Worksheets/worksheet4.pdf)

This worksheet illustrates data fitting and goes along with Homework 3.

### 12 (March 17th) [Detour: Symbolic Algebra using Maple](Lectures/MapleHW1.pdf) 

See [Maple code](Lectures/MapleHW1.mw) if you have access to Maple.

We will solve some parts of HW1 using the symbolic algebra tool [Maple](https://www.maplesoft.com/products/Maple/students/) (equally good to use [Mathematica](https://www.nyu.edu/life/information-technology/getting-started/software/mathematica.html)) and emphasize how symbolic algebra is different from floating-point algebra.

### Wednesday **March 17th at 8pm** Midterm exam over zoom

### 13 ([March 22nd and 24th and April 1st](Lectures/Eigenvalues2021.pdf)) [Eigenvalues of matrices](Lectures/EigenSingularValues.pdf)

#### March 22nd: We will begin by reviewing important things from linear algebra regarding eigenvalues of matrices, see section 5 in the [typed notes](Lectures/LinearAlgebra.pdf).

Eigenvalues and eigenvectors are covered in chapter 5 of the theory textbook.

#### March 24th: We will go over the power method for computing the largest (in modulus) eigenvalue and associated eigenvector using the power method. If you wish, learn how the [Google PageRank algorithm is related to the power method](https://en.wikipedia.org/wiki/PageRank#Power_method) -- I recommend reading the paper ["The $25,000,000,000 Eigenvector: The Linear Algebra Behind Google"](https://www.rose-hulman.edu/~bryan/googleFinalVersionFixed.pdf).

#### April 1st (pre-recorded): I will try to give a sketch for how QR factorization can be used to compute all eigenvalues of a symmetric matrix. Here is the code [QR.m](Matlab/QR.m).

### 15 ([March 29th](Lectures/SingularValues2021.pdf)) [Singular Value Decomposition (SVD)](Lectures/EigenSingularValues.pdf)

Unfortunately singular values are not covered in either of the two textbooks.

We will finish our discussion of the mathematics of the SVD and then discuss the uses and power of the SVD. Here is the code [Compression.m](Matlab/Compression.m) that compresses an image using truncated SVD (also called "principal component analysis" or PCA), as well as the code [PCA_demo.m](Matlab/PCA_demo.m) (from Brennan Sprinkle) that shows how PCA can reveal the rigth way to look at data to discover some hidden structure.

### 16 (March 31st) [Worksheet 5](Worksheets/worksheet5.pdf)

This worksheet illustrates how the pseudoinverse can be used to solve linear systems and deal with ill-conditioning.

### 17 (March 5th, 7th) [Polynomial Interpolation](Lectures/PolynomialInterpolation.pdf)

My lecture will roughly follow chapter 8 in the practice textbook. See chapter 6 in the theory textbook for more theoretical background.

For more advanced but illuminating reading, take a look at the essay ["Six Myths of Polynomial Interpolation and Quadrature"](https://people.maths.ox.ac.uk/trefethen/mythspaper.pdf) by Nick Trefethen.

### No class Mon April 19th (Break)
