// Copyright (c) 2015, Microsoft Corporation

namespace Microsoft.Research.Liquid

module UserSample =
    open Util
    open Operations
    // Optional extras:
    //open Native             // Support for Native Interop
    //open HamiltonianGates   // Extra gates for doing Hamiltonian simulations
    //open Tests              // All the built-in tests

    [<LQD>]
    let __UserSample() =
        show "This module is a good place to put compiled user code"

module App =
    open App
    /// <summary>
    /// The main entry point for Liquid.
    /// </summary>
    [<EntryPoint>]
    let Main _ =
        RunLiquid ()

