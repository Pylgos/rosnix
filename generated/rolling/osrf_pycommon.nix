{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    osrf_pycommon = substituteSource {
      src = fetchgit {
        name = "osrf_pycommon-source";
        url = "https://github.com/ros2-gbp/osrf_pycommon-release.git";
        rev = "ebeebc9e2f88bd470303a17ab2821b6bd05a86da";
        hash = "sha256-r7SjLNdaRpcA2w4gbir3vE/3B7hy6aHv2HUw8wJi8OI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "osrf_pycommon";
  version = "2.1.4-2";
  src = sources.osrf_pycommon;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.importlib-metadata ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Commonly needed Python modules, used by Python software developed at OSRF.";
  };
}
