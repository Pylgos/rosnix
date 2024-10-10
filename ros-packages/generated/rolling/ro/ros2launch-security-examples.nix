{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  ament-nodl,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  nodl-python,
  nodl-to-policy,
  rclcpp,
  rclcpp-components,
  rclpy,
  ros2launch-security,
  rosSystemPackages,
  sensor-msgs,
  sros2,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ros2launch_security_examples" = substituteSource {
      src = fetchgit {
        name = "ros2launch_security_examples-source";
        url = "https://github.com/ros2-gbp/ros2launch_security-release.git";
        rev = "a4328b2660c6e5e1b84a5d097a89d4e9b17d9a52";
        hash = "sha256-NWaQ/UIv5e//ahvk4u8zBHDsw6po6o9VLTnHTmXsQR8=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2launch_security_examples";
  version = "1.0.0-4";
  src = finalAttrs.passthru.sources."ros2launch_security_examples";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-nodl example-interfaces rclcpp rclcpp-components rclpy ros2launch-security sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common launch-testing launch-testing-ament-cmake launch-testing-ros nodl-python nodl-to-policy sros2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Examples of how to use the ros2launch_security extension.";
  };
})
