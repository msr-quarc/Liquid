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
To sign up, send an (email to the LISTSERV)[mailto:LISTSERV@lists.research.microsoft.com] with a one-line body reading "SUB Liquid *your name*".

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

## How Do I Use It?

LIQUi|> is being made available for use on Microsoft Azure virtual machines. 
This version will not run on a desktop machine or other non-Azure system.

See the [users' guide](https://msr-quarc.github.io/Liquid/LIQUiD.pdf) and the [full help documentation](https://msr-quarc.github.io/Liquid/).
The help may also be dowloaded as a [single file](https://msr-quarc.github.io/Liquid/Liquid.chm), if desired.

Note that this version of LIQUi|> is limited to a maximum of 22 physical qubits for full state vector simulation.

If you run into a problem or have a question, you can [post an issue](https://github.com/msr-quarc/Liquid/issues).

## How Do I Get It?

LIQUi|> is available from this repository for use on an Azure virtual machine image.
We recommend using the a VM image that includes the free Community Edition of Visual Studio 2015.

To set up and use your own Azure virtual machine with LIQUi|>, check out the [Quick Start Guide](QuickStart.md).

### Microsoft Azure Information and Cost

An Azure basic-tier A2 instance is appropriate for most uses of LIQUi|>.
This VM type, if located in the south central US region, costs $0.148 per hour.
At 8 hours per day for 21 weekdays in a month, this comes to $24.86 per month.
See the [Microsoft Azure pricing calculator](https://azure.microsoft.com/en-us/pricing/calculator/) for details.

A new Microsoft Azure account comes with a one month free trial for up to $200 of usage.

If you are teaching a course using LIQUi|>, the [Microsoft Educator Grant Program](https://www.microsoftazurepass.com/azureu) may be applicable.
It will provide Microsoft Azure funding for you and your students that will more than cover their LIQUi|> usage.
