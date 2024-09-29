{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  zbar-ros-interfaces,
}:
let
  sources = mkSourceSet (sources: {
    "zbar_ros" = substituteSource {
      src = fetchgit {
        name = "zbar_ros-source";
        url = "https://github.com/ros2-gbp/zbar_ros-release.git";
        rev = "05fd200a692259be91d98d3c95f134ab7a2b8f3d";
        hash = "sha256-ABj7YLhPfSz7aMGTa8kmb/hLGuY9WLHpwfxsdwZbBWI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "zbar-ros";
  version = "0.7.0-1";
  src = sources."zbar_ros";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv-bridge rclcpp sensor-msgs std-msgs zbar-ros-interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "zbar" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Lightweight ROS wrapper for Zbar barcode/qrcode reader library (http://zbar.sourceforge .net/)";
  };
}
