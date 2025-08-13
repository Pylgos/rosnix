{ lib, fetchurl }:

pyFinal: pyPrev:
let
  inherit (lib.uv2nix) lock1;
  inherit (lib.pyproject-nix) pep508;
  inherit (lib)
    importTOML
    filter
    mapAttrs
    length
    head
    groupBy
    attrNames
    unique
    hasAttr
    filterAttrs
    ;

  uvLock = lock1.parseLock (importTOML ./uv.lock);
  environ = pep508.setEnviron (pep508.mkEnviron pyPrev) { };
  localPackages = filter lock1.isLocalPackage uvLock.package;
  packages = mapAttrs (
    _name: packages:
    assert length packages == 1;
    head packages
  ) (groupBy (package: package.name) localPackages);
  allDeps = mapAttrs (
    _: package: unique (attrNames package.optional-dependencies ++ attrNames package.dev-dependencies)
  ) packages;
  resolved = lock1.resolveDependencies {
    lock = lock1.filterConflicts {
      lock = uvLock;
      spec = localPackages;
    };
    inherit environ;
    dependencies = lib.attrNames allDeps;
  };

  # Maps native package names to their corresponding nixpkgs names.
  aliases = {
    colcon-core = "colcon";
  };

  drvs = mapAttrs (
    name: package:
    pyPrev.buildPythonPackage {
      pname = package.name;
      inherit (package) version;
      format = "pyproject";
      src = fetchurl {
        inherit (package.sdist) url hash;
      };
      build-system = [
        pyFinal.setuptools
        pyFinal.hatchling
      ];
      dependencies = lib.map (
        dep:
        let
          inherit (dep) name;
        in
        # Prefer packages from nixpkgs if available; otherwise, use those provided by this overlay.
        pyPrev.${aliases.${name} or name} or pyFinal.${name}
      ) package.dependencies;
    }
  ) resolved;

  # Filter out packages that are already provided by the previous Python environment.
  drvsFiltered = filterAttrs (name: drv: !(hasAttr name pyPrev)) drvs;
in
drvsFiltered
