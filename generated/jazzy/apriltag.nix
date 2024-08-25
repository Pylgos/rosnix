{
  buildPackages,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  opencv,
  python3,
  substituteSource,
}:
let
  sources = rec {
    apriltag = substituteSource {
      src = fetchgit {
        name = "apriltag-source";
        url = "https://github.com/ros2-gbp/apriltag-release.git";
        rev = "630ac8b64c23ee222b1ccc070efe20af30497908";
        hash = "sha256-gh98hPfxaAHqN4iEbnlYrBGpiD9urWJSo4Qg5OZgfgE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag";
  version = "3.4.2-1";
  src = sources.apriltag;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ python3 buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ opencv ];
  missingDependencies = [  ];
  meta = {
    description = "AprilTag detector library";
  };
}
