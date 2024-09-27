{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libphidget22,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    phidgets_api-d8b5d6ddafdaa270c0181fb2cb2ede7f133683b4 = substituteSource {
      src = fetchgit {
        name = "phidgets_api-d8b5d6ddafdaa270c0181fb2cb2ede7f133683b4-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "d8b5d6ddafdaa270c0181fb2cb2ede7f133683b4";
        hash = "sha256-yApWn4EjkZOKG71s1bRI+kpC+mFXm6uJk5hROmuXNFc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_api";
  version = "2.3.3-2";
  src = sources.phidgets_api-d8b5d6ddafdaa270c0181fb2cb2ede7f133683b4;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ libphidget22 ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A C++ Wrapper for the Phidgets C API";
  };
}
