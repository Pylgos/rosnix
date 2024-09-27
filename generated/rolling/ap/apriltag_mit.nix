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
    apriltag_mit-bb963180b5229dcd9aa44ac2720d084ea141df89 = substituteSource {
      src = fetchgit {
        name = "apriltag_mit-bb963180b5229dcd9aa44ac2720d084ea141df89-source";
        url = "https://github.com/ros2-gbp/apriltag_mit-release.git";
        rev = "bb963180b5229dcd9aa44ac2720d084ea141df89";
        hash = "sha256-1WPBqs7VNnRYSSvoR7Jfk3a9CYGHOzfdA0KQgv/tfck=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag_mit";
  version = "1.0.3-1";
  src = sources.apriltag_mit-bb963180b5229dcd9aa44ac2720d084ea141df89;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang-tidy" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libboost-dev" "libopencv-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS2 package wrapper for the MIT apriltag detector";
  };
}
