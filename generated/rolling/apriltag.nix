{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  opencv,
  python3,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    apriltag = substituteSource {
      src = fetchgit {
        name = "apriltag-source";
        url = "https://github.com/ros2-gbp/apriltag-release.git";
        rev = "05397e039099186e22a3c6f73a00e2e7b395a262";
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
  propagatedNativeBuildInputs = [ python3 ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.numpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ opencv ];
  missingDependencies = [  ];
  meta = {
    description = "AprilTag detector library";
  };
}
