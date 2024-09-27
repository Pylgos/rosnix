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
    apriltag_mit-fce3634b5b12e17f90fa8c0f404fa7fca1bcb8cc = substituteSource {
      src = fetchgit {
        name = "apriltag_mit-fce3634b5b12e17f90fa8c0f404fa7fca1bcb8cc-source";
        url = "https://github.com/ros2-gbp/apriltag_mit-release.git";
        rev = "fce3634b5b12e17f90fa8c0f404fa7fca1bcb8cc";
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
  src = sources.apriltag_mit-fce3634b5b12e17f90fa8c0f404fa7fca1bcb8cc;
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
