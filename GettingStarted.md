# Getting Started

## Prerequisites

These directions assume you're running on a Windows environment, such as a Windows PC or using an emulator on another operating system.
If you don't have access to a Windows environment, you can use LIQUi|> on a Windows virtual machine.
See the [Using LIQUi|> on Microsoft Azure](AzureGuide.md) page for directions.

### Visual Studio

Visual Studio 2015 Community Edition is free for individuals and for academic use.
It is available at https://www.visualstudio.com/en-us/products/visual-studio-community-vs.aspx.

While Visual Studio is not required to run the LIQUi|> samples, it is necessary if you want to write your own algorithms.

### .NET 4.6

The .NET Framework 4.6 or later is required.
Installing Visual Studio 2015 will install .NET 4.6.

If you are only running the samples and aren't installing Visual Studio, you can install .NET 4.6 from http://www.microsoft.com/en-us/download/details.aspx?id=48130 if it isn't already installed.

## Downloading LIQUi|>

We recommend placing the download into a folder named c:\Liquid.
If you choose a different folder, you will need to create a c:\Liquid folder and copy LiquidTikZ.tex from your LIQUi|> folder into c:\Liquid.

There are three ways to download LIQUi|>:

* Click on the button on the main project page to the right labeled **Download ZIP**. This will download LIQUi|> and its supporting files to your system in a file named Liquid-master.zip, which you may then extract to a folder on your system. 
* If you have a GitHub command-line client installed, you may instead change directory to the c:\Liquid directory and use the command:
```
git clone https://github.com/msr-quarc/Liquid
```
* If you have the GitHub desktop application installed, you may click on the button on the main project page to the right labeled **Clone in Desktop**.

The first time you run LIQUi|>, you may get a security warning telling you that the program was downloaded from another system and may not be safe.
Once you grant LIQUi|> permission to run by clicking the appropriate button, the warning should not recur.

## Registration

While LIQUi|> is free, we do request that you register so that we can track how many people are using it.
To do this you will need to submit a registration request email to our LISTSERV, which will reply with a registration command.
If you don't register, your copy of LIQUi|> will run, but will print a nag message at the top of every run.

The LISTSERV is at LISTSERV@lists.research.microsoft.com.
The email body for your registration should contain:
```
/REG
```
You will receive a reply email that will contain a command you can copy and paste into a command window to register your copy of LIQUi|>.
The response will look something like:
```
> /REG
Liquid.exe /reg test@microsoft.com`2015-10-06T00:00:00`O6K7yUcYnKdjfis2I05vXA== 1
```
The command to execute is the line starting with "Liquid.exe".
Make sure you're in the c:\Liquid\bin directory before entering this command.

Registering your copy of LIQUi|> does not subscribe you to the liquid-news email list.
If you wish, you can do both at the same time by sending a single email with both commends in the body:
```
SUB Liquid-news FirstName LastName
/REG
```

## Running LIQUi|>

LIQUi|> is a command-line program, so you need to open a command window to use it.
Once you have a command window open, enter the following commands:
```
c:
cd \Liquid
Liquid.exe
```

Your should see the following:
```
0:0000.0/
0:0000.0/ LIQUi|> -- Language Integrated Quantum Operations
0:0000.0/     Copyright (c) 2015, Microsoft Corporation
0:0000.0/     If you use LIQUi|> in your research, please follow the guidelines at
0:0000.0/     "https://github.com/msr-quarc/Liquid" for citing LIQUi|> in your publications.
0:0000.0/
0:0000.0/
0:0000.0/TESTS (all start with two underscores):
0:0000.0/   __Big()             Try to run large entanglement tests (16 through 33 qubits)
0:0000.0/   __Chem(m)           Solve Ground State for molecule m (e.g., H2O)
0:0000.0/   __ChemFull(...)     See QChem docs for all the arguments
0:0000.0/   __Correct()         Use 15 qubits+random circs to test teleport
0:0000.0/   __Entangle1(cnt)    Run n qubit entanglement circuit (for timing purposes)
0:0000.0/   __Entangle2(cnt)    Entangle1 with compiled and optimized circuits
0:0000.0/   __Entangles()       Draw and run 100 instances of 16 qubit entanglement test
0:0000.0/   __EntEnt()          Entanglement entropy test
0:0000.0/   __EIGS()            Check eigevalues using ARPACK
0:0000.0/   __EPR()             Draw EPR circuit (.htm and .tex files)
0:0000.0/   __Ferro(false,true) Test ferro magnetic coupling with true=full, true=runonce
0:0000.0/   __JointCNOT()       Run CNOTs defined by Joint measurements
0:0000.0/   __Noise1(d,i,p)     d=# of idle gates, i=iters, p=probOfNoise
0:0000.0/   __NoiseAmp()        Amplitude damping (non-unitary) noise
0:0000.0/   __NoiseTele(S,i,p)  Noise on Teleport S=doSteane? i=iters p=prob
0:0000.0/   __QECC()            Test teleport with errors and Steane7 code (gen drawing)
0:0000.0/   __QFTbench()        Benchmark QFT used in Shor (func,circ,optimized)
0:0000.0/   __QLSA()            Test of HHL linear equation solver
0:0000.0/   __QuAM()            Quantum Associative Memory
0:0000.0/   __QWalk(typ)        Walk tiny,tree,graph or RMat file with graph information
0:0000.0/   __Ramsey33()        Try to find a Ramsey(3,3) solution
0:0000.0/   __SG()              Test spin glass model
0:0000.0/   __Shor(N,true)      Factor N using Shor's algo false=direct true=optimized
0:0000.0/   __show("str")       Test routine to echo str and then exit
0:0000.0/   __Steane7()         Test basic error injection in Steane7 code
0:0000.0/   __Teleport()        Draw and run original, circuit and grown versions
0:0000.0/   __TSP(5)            Try to find a Traveling Salesman soltion for 5 to 8 cities
0:0000.0/
0:0000.0/Liquid Usage:  Liquid [/switch...] function
0:0000.0/    Enclose multi-word arguments in double quotes
0:0000.0/
0:0000.0/Arguments (precede with / or -):
0:0000.0/
0:0000.0/   Switch     Default              Purpose
0:0000.0/   ------     -------------------- ------------------------
0:0000.0/    /log      Liquid.log           Output log file name path
0:0000.0/    /la       Unset                Append to old log files (otherwise erase)
0:0000.0/
0:0000.0/    /s        ""                   Compile and load script file
0:0000.0/    /l        ""                   Load compiled script file
0:0000.0/
0:0000.0/    /reg      ""                   Register this copy of LIQUi|>
0:0000.0/
0:0000.0/ Final arg is the function to call:
0:0000.0/   function(pars,...)
0:0000.0/
0:0000.0/============================================
0:0000.0/
0:0000.0/!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
0:0000.0/!!! ERROR: Need to provide at least one argument
0:0000.0/!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
```

if you then type (note that there are **two** underscores):
```
Liquid.exe __Entangle1(10)
```
you should see:
```
0:0000.0/
0:0000.0/ LIQUi|> -- Language Integrated Quantum Operations
0:0000.0/     Copyright (c) 2015, Microsoft Corporation
0:0000.0/     If you use LIQUi|> in your research, please follow the guidelines at
0:0000.0/     "https://github.com/msr-quarc/Liquid" for citing LIQUi|> in your publications.
0:0000.0/
0:0000.0/
0:0000.0/=============== Logging to: Liquid.log opened ================
0:0000.0/
0:0000.0/ Secs/Op  S/Qubit  Mem(GB) Operation
0:0000.0/ -------  -------  ------- ---------
0:0000.0/   0.057    0.057    0.274 Created single state vector
0:0000.0/   0.050    0.050    0.277 Did Hadamard
0:0000.0/   0.010    0.010    0.278   Did CNOT:  1
0:0000.0/   0.020    0.010    0.280   Did CNOT:  2
0:0000.0/   0.028    0.009    0.280   Did CNOT:  3
0:0000.0/   0.037    0.009    0.281   Did CNOT:  4
0:0000.0/   0.046    0.009    0.282   Did CNOT:  5
0:0000.0/   0.054    0.009    0.283   Did CNOT:  6
0:0000.0/   0.062    0.009    0.284   Did CNOT:  7
0:0000.0/   0.069    0.009    0.285   Did CNOT:  8
0:0000.0/   0.076    0.008    0.285   Did CNOT:  9
0:0000.0/   0.013    0.001    0.286 Did Measure
0:0000.0/
0:0000.0/=============== Logging to: Liquid.log closed ================
```

## BLAS (optional)

If you want to use the quantum random walk sample or compute state vector entanglement entropies,
you will need a BLAS library.

**If you don't use these functions, then LIQUi|> will work fine with no BLAS implementation available.
THe BLAS library is dynamically loaded before use, and is not required for LIQUi|> to operate.**

We have tested with OpenBLAS, which is available from http://www.openblas.net/.

OpenBLAS requires two additional DLLs, libgfortran-3.dll and libquadmath-0.dll.
These are most easily obtained as part of the MinGW-w64 package, available at http://mingw-w64.org/doku.php.
You will need to build the FORTRAN compiler to create these DLLs.

There are some helpful hints at http://icl.cs.utk.edu/lapack-for-windows/lapack/index.html and at http://www.r-bloggers.com/an-openblas-based-rblas-for-windows-64-step-by-step/.

LIQUi|> looks for a library named "libopenblas.dll" in either the same directory as the LIQUi|> executable,
or in a directory on your PATH, or in the C:\Liquid\bin directory (if it exists).
If you are using OpenBLAS, the other two libraries should be placed in the same directory as libopenblas.dll.

If you are using a different BLAS implementation, you will need to rename the DLL to libopenblas.dll and place it,
along with any required supporting DLLs, into one of the valid directories.

