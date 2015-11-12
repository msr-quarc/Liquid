# The Language-Integrated Quantum Operations (LIQUi|>) simulator

## What Is LIQUi|>?

LIQUi|> is a simulation platform developed by the [Quantum Architectures and Computation](http://research.microsoft.com/en-us/groups/quarc/) team at Microsoft Research to aid in the exploration of quantum computation. 
LIQUi|> stands for “Language Integrated Quantum Operations”.  
A quantum operation is usually referred to as a unitary operator (U) applied to a column state vector (also known as a ket: |> ).
The “i” is just a constant scaling factor, hence the acronym.

LIQUi|> includes three simulators: 
* A full state vector simulator that tracks the detailed evolution of the quantum state
* A stabilizer simulator based on CHP (Aaronson and Gottesman, http://arXiv.org/abs/quant-ph/0406196)
* A highly-optimized full state vector simulator for fermionic Hamiltonians

LIQUi|> is available under a [Microsoft Research license](LICENSE.md). 

## For More Information

See the [Microsoft Research project page on LIQUi|>](http://research.microsoft.com/en-us/projects/liquid/)
and the paper, [LIQUi|>: A Software Design Architecture and Domain-Specific Language for Quantum Computing](http://research.microsoft.com/pubs/209634/1402.4467.pdf).

To stay up to date on what we're doing with LIQUi|>, please watch our repository and sign up for the LIQUi|> email list.
To sign up, send an email to LISTSERV@lists.research.microsoft.com with a one-line body reading:
```
SUB Liquid-news FirstName LastName
```
Replacing FirstName and LastName with your first and last names.
If you prefer to remain anonymous, you may instead send an email containing:
```
SUB Liquid-news anonymous
```

## How To Cite LIQUi|>

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

See the [Getting Started](GettingStarted.md) page for directions on how to download, register, and start using LIQUi|>.

If you don't have access to a Windows environment, you can use LIQUi|> on a Windows virtual machine.
See the [Using LIQUi|> on Microsoft Azure](AzureGuide.md) page for directions.

## How Do I Use It?

See the [users' guide](https://msr-quarc.github.io/Liquid/LIQUiD.pdf) and the [full help documentation](https://msr-quarc.github.io/Liquid/).
The help may also be downloaded as a [single file](https://msr-quarc.github.io/Liquid/Liquid.chm), if desired. There is also a [tutorial video](http://research.microsoft.com/apps/video/default.aspx?id=258279) available that will take you through the basics.

Note that this version of LIQUi|> is limited to a maximum of 23 physical qubits for full state vector simulation.

If you run into a problem or have a question, you can [post an issue](https://github.com/msr-quarc/Liquid/issues).
If you have other feedback, you can contact the LIQUi|> team at liquid@microsoft.com.
