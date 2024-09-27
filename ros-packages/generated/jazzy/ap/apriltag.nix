{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    apriltag-630ac8b64c23ee222b1ccc070efe20af30497908 = substituteSource {
      src = fetchgit {
        name = "apriltag-630ac8b64c23ee222b1ccc070efe20af30497908-source";
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
  src = sources.apriltag-630ac8b64c23ee222b1ccc070efe20af30497908;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" "python3-numpy" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  meta = {
    description = "AprilTag detector library";
  };
}
