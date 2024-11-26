{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "action_tutorials_cpp";
  version = "0.35.1-1";
  src = finalAttrs.passthru.sources."action_tutorials_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rclcpp-action rclcpp-components ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "action_tutorials_cpp" = substituteSource {
        src = fetchgit {
          name = "action_tutorials_cpp-source";
          url = "https://github.com/ros2-gbp/demos-release.git";
          rev = "54179fe912d0d549c73173a212269393f6306e99";
          hash = "sha256-Lf+9dsTXR0BlVayteqDyi6cPJUkxxGS7573J4B5mHZA=";
        };
      };
    });
  };
  meta = {
    description = "C++ action tutorial cpp code";
  };
})
