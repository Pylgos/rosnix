{
  ament-cmake-auto,
  ament-cmake-ros,
  autoware-cmake,
  autoware-lanelet2-extension,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lanelet2-core,
  lanelet2-io,
  lanelet2-projection,
  lanelet2-python,
  lanelet2-routing,
  lanelet2-traffic-rules,
  lanelet2-validation,
  mkSourceSet,
  python-cmake-module,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "autoware_lanelet2_extension_python" = substituteSource {
      src = fetchgit {
        name = "autoware_lanelet2_extension_python-source";
        url = "https://github.com/ros2-gbp/autoware_lanelet2_extension-release.git";
        rev = "09418c4b947885e9d795b94cb9f3d9df4a4672ca";
        hash = "sha256-66WcbYI3aeUgqJcN2CZXyxPBZJPyYveuZl6MQLPMS2I=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "autoware_lanelet2_extension_python";
  version = "0.6.0-1";
  src = sources."autoware_lanelet2_extension_python";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake python-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ autoware-lanelet2-extension geometry-msgs lanelet2-core lanelet2-io lanelet2-projection lanelet2-python lanelet2-routing lanelet2-traffic-rules lanelet2-validation rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-python-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The autoware_lanelet2_extension_python package contains Python bindings for lanelet2_extension package";
  };
}
