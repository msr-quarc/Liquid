# LIQUi|>: Language-Integrated Quantum Operations

## What Is LIQUi|>?

LIQUi|> is a simulation platform developed by the QuArC team at Microsoft Research to aid in the exploration of quantum computation. 
LIQUi|> stands for “Language Integrated Quantum Operations”.  
A quantum operation is usually referred to as a unitary operator (U) applied to a column state vector (also known as a ket: |> ).
The “i” is just a constant scaling factor, hence the acronym.

LIQUi|> includes three simulators: 
* A full state vector simulator that tracks the detailed evolution of the quantum state
* A stabilizer simulator based on CHP (Aaronson and Gottesman, http://arXiv.org/abs/quant-ph/0406196)
* A highly-optimized full state vector simulator for fermionic Hamiltonians

### For More Information

See the [Microsoft Research project page on LIQUi|>](http://research.microsoft.com/en-us/projects/liquid/)
and the paper, [LIQUi|>: A Software Design Architecture and Domain-Specific Language for Quantum Computing](http://research.microsoft.com/pubs/209634/1402.4467.pdf).

To stay up to date on what we're doing with LIQUi|>, please watch our repository and sign up for the LIQUi|> email list.
To sign up, send an email to LISTSERV@lists.research.microsoft.com with a one-line body reading "SUB Liquid-news *your name*".
If you prefer to remain anonymous, you may instead send an email containing "SUB Liquid-news anonymous".

### How To Cite LIQUi|>

If you use LIQUi|> in your research, please cite it as follows:
* bibTex:
```
@misc{1402.4467,
  author = {Dave Wecker and Krysta M.~Svore},
  title = {{LIQU}i|>: {A} {S}oftware {D}esign {A}rchitecture and {D}omain-{S}pecific 
            {L}anguage for {Q}uantum {C}omputing},
  year = {2014},
  eprint = {1402.4467},
  url = {arXiv:1402.4467v1}
}
```
* Text: 
```
D. Wecker and K. M. Svore, “LIQUi|>: A Software Design Architecure and Domain-Speciﬁc 
    Language for Quantum Computing,” (2014), arXiv:1402.4467v1 [quant-ph], 
    http://arxiv.org/abs/1402.4467.
```

## What Can I Do With It?

You can use LIQUi|> to define quantum circuits, render them into a variety of graphical formats, and execute them
using an appropriate simulator.

Some of the specific algorithms you can simulate with LIQUi|> are:
* Simple quantum teleportation
* Shor's factoring algorithm
* Quantum chemistry: computing the ground state energy of a molecule
* Quantum error correction
* Quantum associative memory (Ventura and Martinez, http://arxiv.org/abs/quant-ph/9807053)
* Quantum linear algebra (Harrow, Hassidim, and Lloyd, http://arxiv.org/abs/0811.3171)

All of these algorithms, and many more, are included as samples with LIQUi|>.

## How Do I Get It?

You can download the LIQUi|> executable, libraries, sample scripts, and documentation from this site.

## How Do I Use It?

See the [users' guide](https://msr-quarc.github.io/Liquid/LIQUiD.pdf) and the [full help documentation](https://msr-quarc.github.io/Liquid/).
The help may also be dowloaded as a [single file](https://msr-quarc.github.io/Liquid/Liquid.chm), if desired.

Note that this version of LIQUi|> is limited to a maximum of 22 physical qubits for full state vector simulation.

If you run into a problem or have a question, you can [post an issue](https://github.com/msr-quarc/Liquid/issues).

## Registration

While LIQUi|> is free, we do require that you register so that we can track how many people are using it.
To do this you will need to submit a request email to a registration LISTSERV, which will reply with a license key.

The LISTSERV is at LISTSERV@lists.research.microsoft.com.
The email body should contain:

    JOIN liquid-reg *your name*

If you prefer to remain anonymous, you may replace your name with the string "anonymous" (no quoteation marks).

You will receive a reply email that will contain a command you can copy and paste into a command window to register your copy of LIQUi|>.
The command will look something like:

    Liquid.exe /reg test@microsoft.com`2015-10-06T00:00:00`O6K7yUcYnKdjfis2I05vXA== 1

Your registration is good for 6 months.
You may re-register at any time, which will give you a new license for 6 months starting at the time you send the new registration email.
LIQUi|> will remind you to reregister when your license is within one month of expiration.
There is no limit on how frequently or how many times you may reregister, nor on the number of copies of LIQUi|> that you may have simultaneously registered.

## Prerequisites

### .NET 4.6

A Windows environment with the .NET Framework 4.6 or later installed is required.
If you don't have .NET 4.6, it may be installed from http://www.microsoft.com/en-us/download/details.aspx?id=48130.
Alternatively, installing Visual Studio 2015 will also install .NET 4.6.

### Visual Studio

Visual Studio 2015 Community Edition is free for individuals and for academic use.
It is available at https://www.visualstudio.com/en-us/products/visual-studio-community-vs.aspx.

While Visual Studio is not required to use LIQUi|>, it is necessary if you want to write your own algorithms as compiled F# code.
It also makes development of F# scripts for algorithms much easier.

### BLAS (optional)

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
