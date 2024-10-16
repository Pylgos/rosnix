{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
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
        rev = "3bb73401d8f57f4ff85ce819b40f9bc9ee759a7a";
        hash = "sha256-ksDJbxLuirZwYQt0MXzEdCRj+iv5p1YuN2GdFjVrvI8=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "topic_tools";
  version = "1.3.2-1";
  src = finalAttrs.passthru.sources."topic_tools";
  nativeBuildInputs = [ ament-cmake ament-cmake-python rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp-components rclpy ros2cli rosidl-runtime-py topic-tools-interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rosidl-runtime-py std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Tools for directing, throttling, selecting, and otherwise messing with ROS 2 topics at a meta level.";
  };
})
