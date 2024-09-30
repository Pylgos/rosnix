{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-lint-auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "aruco_opencv_msgs" = substituteSource {
      src = fetchgit {
        name = "aruco_opencv_msgs-source";
        url = "https://github.com/ros2-gbp/aruco_opencv-release.git";
        rev = "c4ff2411a22a0916f08ff933eb620d58beecf73b";
        hash = "sha256-dP2eRoPV3R8Okt63Wb5WW9MsbCpOeZ/3ti0YVxYtkKU=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "aruco_opencv_msgs";
  version = "6.0.1-1";
  src = sources."aruco_opencv_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-lint-cmake ament-lint-auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Message definitions for aruco_opencv package.";
  };
}
