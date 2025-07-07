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
  version = "0.21.1-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_subscriber";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_subscriber" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_subscriber-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "aa6f88e6d15724aafd66ee5d783fa2f861dba767";
        hash = "sha256-97RUEtdhoZaFJR7S7Ccd/0DOE7KtggeQg3R7W9qj4lo=";
      };
    };
  });
  meta = {
    description = "Examples of minimal subscribers";
  };
})
