{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  gps_msgs,
  mapviz,
  pluginlib,
  rclcpp,
  rclpy,
  rosSystemPackages,
  substituteSource,
  swri_math_util,
  swri_transform_util,
  tf2,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    multires_image-680040191422f6e068bc6fac57842b0f9ffa7908 = substituteSource {
      src = fetchgit {
        name = "multires_image-680040191422f6e068bc6fac57842b0f9ffa7908-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "680040191422f6e068bc6fac57842b0f9ffa7908";
        hash = "sha256-9pk2CCnuJ9zrlzTV6VbLsfXzML4EBn2WCg0/cW1me58=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "multires_image";
  version = "2.4.3-1";
  src = sources.multires_image-680040191422f6e068bc6fac57842b0f9ffa7908;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qt5-qmake" ]; };
  propagatedBuildInputs = [ cv_bridge geometry_msgs gps_msgs mapviz pluginlib rclcpp rclpy swri_math_util swri_transform_util tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-opengl" "libqt5-opengl-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "multires_image";
  };
}
