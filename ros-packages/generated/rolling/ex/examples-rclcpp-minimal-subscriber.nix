{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "examples_rclcpp_minimal_subscriber";
  version = "0.20.4-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_subscriber";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_subscriber" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_subscriber-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "728008e8f2ad68a54370874e75898850f57b7bdd";
        hash = "sha256-miqeiPCkws7SgUACKumbGLj9ICV2wkRHsqyOSp4zgOE=";
      };
    };
  });
  meta = {
    description = "Examples of minimal subscribers";
  };
})
