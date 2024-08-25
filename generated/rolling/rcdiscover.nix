{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    rcdiscover = substituteSource {
      src = fetchgit {
        name = "rcdiscover-source";
        url = "https://github.com/ros2-gbp/rcdiscover-release.git";
        rev = "b4819be9a016b59e1db3d1fc1b74627285674c08";
        hash = "sha256-Xw4108ob5fIs8/BbNRMVm3xOzC6l8ZHRs7e3XZ3834M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcdiscover";
  version = "1.1.7-1";
  src = sources.rcdiscover;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "This package contains tools for the discovery of Roboception devices via GigE Vision.";
  };
}
