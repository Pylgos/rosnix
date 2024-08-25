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
        rev = "f1d160f25f0eca51cf73316956d15bef7df6bcce";
        hash = "sha256-leXJVw7Yx8SeMv0jUFtQmpFCpDaJkvd7U6AqjpdLEOE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcdiscover";
  version = "1.1.7-2";
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
