// Copyright (c) 2015, Microsoft Corporation

#if INTERACTIVE
#r @"..\bin\Liquid1.dll"         // Tell fsi where to find the Liquid dll
#else
namespace Microsoft.Research.Liquid // Tell the compiler our namespace
#endif

open System                         // Open any support libraries
open System.Collections.Generic
open Microsoft.Research.Liquid      // Get necessary Liquid libraries
open Util                           // General utilites
open Operations                     // Basic gates and operations
open Tests                          // Just gets use the RenderTest call for dumping files

module Script =                     // The script module allows for incremental loading

    let tests   = 50                // Tests to run
    let qCnt    = 12                // Qubit count
    let h0      = 1.0               // h0: Left most qubit Z strength
    let hn      = -1.0              // hn: Right most qubit z strength
    let coupling= 1.0               // Coupling: 1=ferro -1=anti-ferror 0=none
    let sched   = [(100,0.0,1.0)]   // Annealing schedule
    let runonce = true              // Runonce: Perform virtual measurements
    let decohere= []                // No decoherence model

    [<LQD>]                         // LQD flags this as being callable from the command line
    let Ferro() =                    // Name of callable function

 
        logOpen "Liquid.log" false
        show "Starting sample script..."    // show does printf + logs and ensemble runs

        show "Using Spin.Ferro() call:"
        Spin.Ferro(tests,qCnt,h0,hn,coupling,sched,runonce,decohere)

    [<LQD>]                         // LQD flags this as being callable from the command line
    let Test() =
        show "Using Spin.Test() with all parameters:"
        let resolution  = 1                             // Time step resolution
        let trotter     = 4                             // Trotter number
        let hs          = Dictionary<int,float>()       // Biases
        let Js          = Dictionary<int*int,float>()   // Couplings
        hs.[0]         <- h0
        hs.[qCnt-1]    <- hn
        for i in 0..qCnt-2 do Js.[(i,i+1)] <- coupling
        let spin        = Spin(hs,Js)
        let sched       = List.map (fun (a,b,c) -> (a,[|b;c|])) sched
        Spin.Test("Test",tests,trotter,sched,resolution,spin,runonce,decohere)

#if INTERACTIVE
do Script.Ferro()        // If interactive, then run the routine automatically
do Script.Test()
#endif
