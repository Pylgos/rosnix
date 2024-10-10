{ lib }:
let
  mkRecursiveBuilder =
    builderFn: overlay: arg:
    let
      argAttrs = (lib.toFunction arg) finalAttrs;
      finalAttrs = argAttrs // (overlay final finalAttrs argAttrs);
      final = (builderFn finalAttrs) // {
        inherit overrideAttrs;
      };
      overrideAttrs =
        f:
        let
          newOverlay =
            final: finalAttrs: prev:
            let
              firstAttrs = overlay final finalAttrs prev;
              secondAttrs = firstAttrs // (lib.toFunction f) firstAttrs;
            in
            secondAttrs;
        in
        mkRecursiveBuilder builderFn newOverlay arg;
    in
    final;
in
mkRecursiveBuilder
