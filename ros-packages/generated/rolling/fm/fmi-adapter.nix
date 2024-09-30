{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fmilibrary-vendor,
  launch,
  launch-ros,
  launch-testing,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rcutils,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "fmi_adapter" = substituteSource {
      src = fetchgit {
        name = "fmi_adapter-source";
        url = "https://github.com/ros2-gbp/fmi_adapter-release.git";
        rev = "4d5abe287d3113eed130e46e8f4c0cab8fa90d14";
        hash = "sha256-bdDksqaZAqG/5URM3Ifb8DOvHvjwqqadN4eguWTN3Vk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "fmi_adapter";
  version = "2.1.2-2";
  src = sources."fmi_adapter";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ fmilibrary-vendor launch launch-ros rcl-interfaces rclcpp rclcpp-components rclcpp-lifecycle std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch-testing rcutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Wraps FMUs for co-simulation";
  };
}
