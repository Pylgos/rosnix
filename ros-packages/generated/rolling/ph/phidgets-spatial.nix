{
  ament-cmake-ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  mkSourceSet,
  phidgets-api,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "phidgets_spatial" = substituteSource {
      src = fetchgit {
        name = "phidgets_spatial-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "5d15528ce95e1cb59abb2919a5bec0b1b8647562";
        hash = "sha256-My63osp4yOvSPXWqo60ZVvGbG6cF/ApGd5AegiOUg/M=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "phidgets_spatial";
  version = "2.3.3-1";
  src = sources."phidgets_spatial";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ launch phidgets-api rclcpp rclcpp-components sensor-msgs std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Driver for the Phidgets Spatial 3/3/3 devices";
  };
}
