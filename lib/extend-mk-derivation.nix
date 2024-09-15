{ lib }:

let
  inherit (lib)
    setFunctionArgs
    optionalAttrs
    functionArgs
    id
    toFunction
    ;
in
{
  /**
     Define a `mkDerivation`-like function based on another `mkDerivation`-like function.

     [`stdenv.mkDerivation`](#part-stdenv) gives access to
     its final set of derivation attributes when it is passed a function,
     or when it is passed an overlay-style function in `overrideAttrs`.

     Instead of composing new `stdenv.mkDerivation`-like build helpers
     using normal function composition,
     `extendMkDerivation` makes sure that the returned build helper
     supports such first class recursion like `mkDerivation` does.

     `extendMkDerivation` takes an extra attribute set to confgure its behaviour.
     One can optionally specify *modify* to modify the result derivation,
     or `inheritFunctionArgs` to decide
     whether to inherit the `__functionArgs` from the base build helper.

     # Inputs

     `extendMkDerivation`-specific configurations
     : `inheritFunctionArgs`: Whether to inherit `__functionArgs` from the base build helper (default to `true`)
     : `modify`: Function to modify the result derivation (default to `lib.id`)

     `mkDerivationBase`
     : Base build helper, the `mkDerivation`-like build helper to extend

     `attrsOverlay`
     : An overlay of attribute set, like the one taken by [overrideAttrs](#sec-pkg-overrideAttrs).
     : It is the implementation detail of the result build helper.

     # Type

     ```
     extendMkDerivation ::
       {
         inheritFunctionArgs :: Bool,
         modify :: a -> a,
       }
       -> ((FixedPointArgs | AttrSet) -> a)
       -> (AttrSet -> AttrSet -> AttrSet)
       -> (FixedPointArgs | AttrSet) -> a

     FixedPointArgs = AttrSet -> AttrSet
     a = Derivation when defining a build helper
     ```

     # Examples

     :::{.example}
     ## `lib.customisation.extendMkDerivation` usage example
     ```nix-shell
     mkLocalDerivation = lib.extendMkDerivation { } pkgs.stdenv.mkDerivation (finalAttrs:
       args@{ preferLocalBuild ? true, allowSubstitute ? false, ... }:
       { inherit preferLocalBuild allowSubstitute; })

     mkLocalDerivation.__functionArgs
     => { allowSubstitute = true; preferLocalBuild = true; }

     mkLocalDerivation { inherit (pkgs.hello) pname version src; }
     => «derivation /nix/store/xirl67m60ahg6jmzicx43a81g635g8z8-hello-2.12.1.drv»

     mkLocalDerivation (finalAttrs: { inherit (pkgs.hello) pname version src; })
     => «derivation /nix/store/xirl67m60ahg6jmzicx43a81g635g8z8-hello-2.12.1.drv»

     (mkLocalDerivation (finalAttrs: { inherit (pkgs.hello) pname version src; passthru = { foo = "a"; bar = "${finalAttrs.passthru.foo}b"; } })).bar
     => "ab"
     ```
     :::

     :::{.note}
     If *modify* is specified,
     it should take care of existing attributes that perform overriding
     (e.g., [`overrideAttrs`](#sec-pkg-overrideAttrs))
     to ensure that the overriding functionality of the result derivation
     work as expected.
     Modifications that breaks the overriding include
     direct [attribute set update](https://nixos.org/manual/nix/stable/language/operators#update)
     and [`lib.extendDerivation`](#function-library-lib.customisation.extendDerivation).
     :::
  */
  extendMkDerivation =
    {
      modify ? id,
      inheritFunctionArgs ? true,
    }:
    mkDerivationBase: attrsOverlay:
    setFunctionArgs
      # Adds the fixed-point style support.
      (fpargs: modify ((mkDerivationBase fpargs).overrideAttrs attrsOverlay))
      # Add __functionArgs
      (
        # Inherit the __functionArgs from the base build helper
        optionalAttrs inheritFunctionArgs (functionArgs mkDerivationBase)
        # Recover the __functionArgs from the derived build helper
        // functionArgs (attrsOverlay { })
      )
    // {
      inherit
        # Expose to the result build helper.
        attrsOverlay
        mkDerivationBase
        modify
        ;
    };

  /**
    Like [`extendMkDerivation`](#function-library-lib.customisation.extendMkDerivation),
    but accept an argument set adapter instead of an attribute overlay.

    The argument set adapter is a function in the form `finalAttrs: args: { ... }`
    that returns the fixed attribute set to pass to the base build helper,
    instead of a subet of attributes to update.
    This allows removing arguments that we don't want to pass to the base build helper.

    In case the `args` [set pattern](https://nix.dev/manual/nix/stable/language/constructs#functions)
    doesn't have an ellipsis (`{ , ... }@args:`), set `inheritFunctionArgs` as `false`.

    # Inputs

    `adaptMkDerivation`-specific configurations
    : `inheritFunctionArgs`: Whether to inherit `__functionArgs` from the base build helper (default to `true`)
    : `modify`: Function to modify the result derivation (default to `lib.id`)

    `mkDerivationBase`
    : Base build helper, the `mkDerivation`-like build helper to extend.

    `adaptArgs`
    : Argument set adapter, a function in the form `finalAttrs: args: { ... }`, transforming the taken argument set before passing down the base build helper.
    : It is as the implementation detail of the result build helper.

    # Type

    ```
    adaptMkDerivation ::
      {
        inheritFunctionArgs :: Bool,
        modify :: a -> a,
      }
      -> ((FixedPointArgs | AttrSet) -> a)
      -> (AttrSet -> AttrSet -> AttrSet)
      -> (FixedPointArgs | AttrSet) -> a

    FixedPointArgs = AttrSet -> AttrSet
    a = Derivation when defining a build helper
    ```

    # Examples

    :::{.example}
    ## `lib.customisation.adaptMkDerivation` usage example

    ```nix-repl
    mkLocalDerivation = lib.adaptMkDerivation { } pkgs.stdenv.mkDerivation (finalAttrs:
      args@{ preferLocalBuild ? true, allowSubstitute ? false, specialArg ? (_: false), ... }:
      removeAttrs args [ "specialArg" ] // { inherit preferLocalBuild allowSubstitute; })

    mkLocalDerivation.__functionArgs
    => { allowSubstitute = true; specialArg = true; preferLocalBuild = true; }

    mkLocalDerivation { inherit (pkgs.hello) pname version src; specialArg = _: false; }
    => «derivation /nix/store/xirl67m60ahg6jmzicx43a81g635g8z8-hello-2.12.1.drv»

    mkLocalDerivation (finalAttrs: { inherit (pkgs.hello) pname version src; specialArg = _: false; })
    => «derivation /nix/store/xirl67m60ahg6jmzicx43a81g635g8z8-hello-2.12.1.drv»

    (mkLocalDerivation (finalAttrs: { inherit (pkgs.hello) pname version src; passthru = { foo = "a"; bar = "${finalAttrs.passthru.foo}b"; } })).bar
    => "ab"
    ```
    :::
  */
  adaptMkDerivation =
    {
      modify ? id,
      inheritFunctionArgs ? true,
    }:
    mkDerivationBase: adaptArgs:
    setFunctionArgs
      # Adds the fixed-point style support
      (
        fpargs: modify (mkDerivationBase (finalAttrs: adaptArgs finalAttrs (toFunction fpargs finalAttrs)))
      )
      # Add __functionArgs
      (
        # Inherit the __functionArgs from the base build helper
        optionalAttrs inheritFunctionArgs (functionArgs mkDerivationBase)
        # Recover the __functionArgs from the derived build helper
        // functionArgs (adaptArgs { })
      )
    // {
      inherit
        # Expose to the result build helper.
        adaptArgs
        mkDerivationBase
        modify
        ;
    };
}
