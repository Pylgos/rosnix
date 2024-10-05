{ lib, stdenvNoCC }:

let
  self = lib.makeOverridable (
    {
      src,
      substitutions ? [ ],
      tar ? false,
    }:
    if substitutions == [ ] && tar == false then
      src
    else
      stdenvNoCC.mkDerivation {
        name = "${src.name}-substituted${if tar then ".tar" else ""}";
        src = src;
        phases = [
          "unpackPhase"
          "patchPhase"
          "installPhase"
        ];
        postPatch =
          let
            genLine =
              subst:
              "substituteInPlace ${
                lib.escapeShellArgs [
                  subst.path
                  "--replace-fail"
                  subst.from
                  subst.to
                ]
              }\n";
            s = lib.concatStrings (map genLine substitutions);
          in
          s;
        installPhase =
          if tar then
            ''
              pushd ..
              tar \
                --create \
                --sort=name \
                --format=gnu \
                --owner=0 --group=0 --numeric-owner \
                --mtime="@$SOURCE_DATE_EPOCH" \
                --file "$out" "$sourceRoot"
              popd
            ''
          else
            ''
              cp -a . "$out"
            '';
        preferLocalBuild = true;
      }
  );
in
self
