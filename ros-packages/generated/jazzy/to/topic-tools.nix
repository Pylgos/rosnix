{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclpy,
  ros2cli,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-runtime-py,
  std-msgs,
  substituteSource,
  topic-tools-interfaces,
}:
let
  sources = mkSourceSet (sources: {
    "topic_tools" = substituteSource {
      src = fetchgit {
        name = "topic_tools-source";
        url = "https://github.com/ros2-gbp/topic_tools-release.git";
        rev = "a0ba30f9dc8c3584d61a7e68a53f5467bdd96a2f";
        hash = "sha256-+reIiU8/jPeUnOCDWZQR93SNyZ6jaDvzWR2sMt3K7j8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "topic_tools";
  version = "1.3.1-1";
  src = sources."topic_tools";
  nativeBuildInputs = [ ament-cmake ament-cmake-python rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp-components rclpy ros2cli rosidl-runtime-py topic-tools-interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rosidl-runtime-py std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Tools for directing, throttling, selecting, and otherwise messing with ROS 2 topics at a meta level.";
  };
}
