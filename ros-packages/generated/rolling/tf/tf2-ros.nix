{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  message-filters,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  rosSystemPackages,
  rosgraph-msgs,
  substituteSource,
  tf2,
  tf2-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "tf2_ros" = substituteSource {
      src = fetchgit {
        name = "tf2_ros-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "12be0a513f72a28d8bdc242648c06b27f26c21be";
        hash = "sha256-5Oc1KBTN1aEKBNe6RnD6aj3ExVd1gOjdRLtZjDkIU9g=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_ros";
  version = "0.39.2-1";
  src = finalAttrs.passthru.sources."tf2_ros";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs message-filters rcl-interfaces rclcpp rclcpp-action rclcpp-components tf2 tf2-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rosgraph-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "This package contains the C++ ROS bindings for the tf2 library";
  };
})
