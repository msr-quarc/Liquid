# Workshop tutorial flow

This outline may be used to help follow along with the [tutorial video](http://research.microsoft.com/apps/video/default.aspx?id=258279).

## Before the tutorial: 

### Install Required Software

1. Install TexWorks/MikTeX 
1. Install Notepad++ 
1. Make sure to have Liquid-master.zip in the Downloads directory from GitHub 
1. Install [Visual Studio Community Edition](https://www.visualstudio.com/en-us/products/visual-studio-community-vs.aspx):
  1. Custom install 
  1. Programming languages: Visual F# (uncheck anything else) 
  1. Will probably take ~20 minutes (your mileage may vary). 

### Install LIQ<i>Ui</i>|&#x232A; (may be done while VS is installing)

  1. Download Liquid-master.zip from [GitHub](https://github.com/msr-quarc/Liquid/archive/master.zip)
  1. Open your downloads folder, right-click on Liquid-master.zip, and select Extract All… 
  1. Extract to C:\ 
  1. Rename c:\Liquid-Master folder to c:\Liquid 

### Prep Visual Studio

Once you have everything installed: 
1. Open c:\Liquid\source\Liquid.sln 
1. Answer any setup dialogs 
1. Go to Solution Explorer on the right side and see if it says that Liquid is "unavailable" 
1. Right click on Liquid and select "install" (to get F# which is installed on demand). 

## Tutorial:

### How to Download and set up

1. From Edge, go to Downloads 
1. Click on Liquid-Master.zip 
1. Extract into c:\ 
1. Rename to c:\Liquid 
1. Show the install directory and basic structure (use File Explorer). Stress where the docs are. 
1. Show how to sprout a command windows (Right click Windows -> Command Prompt) 
1. Show how to get to C: and cd \Liquid\bin 
1. Run liquid.exe (no params) and talk about the output. 
1. Respond with a Y to the license. Run again, show the output (mention the listserv) 
1. Quick overview (stress the two underscores at the beginning of each) 

### Shor

1. Run liquid __Shor(21,false). Explain the time at the beginning of the line and some of the output lines. Note how long it took to run 
1. Run liquid __Shor(63,false). Note how long it's taking and ^C it 
1. Run liquid __Shor(63,true). Note the run time and explain a little of the optimizations 

### Teleport

1. Talk about the 3 outputs 
1. Show the Liquid.log file 
1. Show Teleport_CN.htm 
1. Show Teleport_CF.htm 
1. Show Teleport_GF.htm 
1. Show Teleport_CF.tex. 
  1. Explain LiquidTikZ.tex and its location 
  1. Run Texworks and show the output 

### Programming Intro

1. Use File Explorer to bring up Liquid.sln in the C:\Liquid\source directory 
1. Show the solution files 
1. Open up Main.fs 
1. Explain &lbrack;&lt;LQD&gt;&rbrack; and show 
1. Show how to put __UserSample() in the Liquid debug properties, switch to Release and run it. 
1. Create a new function that will measure a single qubit: 
```fsharp
    let qfunc (qs:Qubits) =
        M qs
```
1. Update UserSample to call it: 
 ```fsharp
    [<LQD>]
    let __UserSample() =
        let stats       = Array.create 2 0
        let k           = Ket(1)

        for i in 0..9999 do
            let qs      = k.Reset(1)
            qfunc qs
            let v       = qs.Head.Bit.v
            stats.[v]  <- stats.[v] + 1

        show "Measured: 0=%d, 1=%d" stats.[0] stats.[1]
```
1. Compile and run and show that you get all zeros. 
1. Now add a Hadamard to qfunc and run again: 
```fsharp
    let qfunc (qs:Qubits) =
        H qs
        M qs
```
1. Explain the rotX gate in the same file 
1. Call with: 
```fsharp
    let qfunc (qs:Qubits) =
        rotX (Math.PI/2.) qs
        M qs
```
1. Show that the result is the same as for a Hadamard 
1. Now call with Math.PI/4. The probability of 0 should now be cos&sup2;(&pi;/8) &approx; 0.85355.
1. Now change to N qubits with a CNOT: 
```fsharp
    let qfunc (qs:Qubits) =
        rotX (Math.PI/4.) qs
        for q in qs.Tail do CNOT [qs.Head;q]
        M >< qs 

    [<LQD>]
    let __UserSample(n:int) =
        let stats       = Array.create 2 0
        let k           = Ket(n)

        for i in 0..9999 do
            let qs      = k.Reset(n)
            qfunc qs
            let v       = qs.Head.Bit.v
            stats.[v]  <- stats.[v] + 1
            for q in qs.Tail do
                if qs.Head.Bit <> q.Bit then
                    failwith "Different!?!?!?!?"

        show "Measured: 0=%d, 1=%d" stats.[0] stats.[1]
```
1. Change Properties to run using 10 qubits 
1. Compile, run, explain (note how long it took) 
1. Now change to using a circuit: 
```fsharp
    [<LQD>]
    let __UserSample(n:int) =
        let stats       = Array.create 2 0
        let k           = Ket(n)
        let circ        = Circuit.Compile qfunc k.Qubits
        for i in 0..9999 do
			...
...
1. Compile, run. Not really any faster (still executing the same number of gates) so add a GrowGates(): 
```fsharp
        let circ        = Circuit.Compile qfunc k.Qubits
        let circ        = circ.GrowGates(k)

        for i in 0..9999 do
            let qs      = k.Reset(n)
            circ.Run qs
            let v       = qs.Head.Bit.v
```
1. Show that it's now n times  faster 
1. Generate drawings and circuit dumps: 
```fsharp
        let circ        = Circuit.Compile qfunc k.Qubits
        show "Test1:"
        circ.RenderHT("Test1")
        circ.Dump()
        let circ        = circ.GrowGates(k)
        show "Test2:"
        circ.RenderHT("Test2")
        circ.Dump()
        for i in 0..9999 do
			...
```
1. Run and show the two drawings 
1. Show the dump results from Liquid.log 

### Quantum Chemistry

1. cd to  \liquid\samples 
1. Run: ..\bin\Liquid.exe __Chem(H2) 
1. Talk through the liquid.log file 
1. Run: ..\bin\Liquid.exe __Chem(H2) | find "CSV" | sort /+25 
1. Open H2_sto3g_4.dat and explain what it is. 
1. Open H2O_sto6g_14.dat and describe it 
1. Run: ..\bin\Liquid.exe __Chem(H2O) 
1. Talk about the output and optimizations 

### Scripts:

1. Show the h2.fsx file and talk through it 
1. Run: ..\bin\Liquid.exe /s H2.fsx Test(26) | find "CSV" | sort /+25 
1. Run: ..\bin\Liquid.exe /l H2.dll Test(26) | find "CSV" | sort /+25 
1. Show the difference with Trotterization: 
  1. ..\bin\Liquid.exe /l h2.dll Trot(2) | find "CSV" | sort /+25 
  1. ..\bin\Liquid.exe /l h2.dll Trot(1024) | find "CSV" | sort /+25 

### Docs:

1. cd to \Liquid\Help 
1. Open/walk Contents of Liquid.pdf 
1. Open Liquid.chm 
1. Go to Circuit 
1. Describe Compile, Dump and RenderHT 
1. Online API docs are also at the GitHub site 
