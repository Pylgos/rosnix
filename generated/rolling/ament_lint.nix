{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ament_lint = substituteSource {
      src = fetchgit {
        name = "ament_lint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "fd288a5221f6fe0c5a20e3392eac9bfc49578931";
        hash = "sha256-1FbkiZrxjuALIPXdxlYFWn8yilt8SSI8m/TDxm33r3U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_lint";
  version = "0.18.1-1";
  src = sources.ament_lint;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Providing common API for ament linter packages.";
  };
}
