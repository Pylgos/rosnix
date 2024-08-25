{ lib, pkgs }:

rec {
  compressZip =
    src:
    pkgs.stdenvNoCC.mkDerivation {
      name = "${src.name}.zip";
      nativeBuildInputs = [ pkgs.buildPackages.zip ];
      src = src;
      phases = [
        "unpackPhase"
        "installPhase"
      ];
      installPhase = ''
        zip -r $out .
      '';
      preferLocalBuild = true;
    };

  substituteSource =
    { src, substitutions }:
    let
      self =
        if substitutions == [ ] then
          src
        else
          pkgs.stdenvNoCC.mkDerivation {
            name = "${src.name}-substituted";
            src = src;
            phases = [
              "unpackPhase"
              "patchPhase"
              "installPhase"
            ];
            patchPhase =
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
            installPhase = ''
              cp -a . $out
            '';
            preferLocalBuild = true;
          };
    in
    self // { zipped = compressZip self; };
}
