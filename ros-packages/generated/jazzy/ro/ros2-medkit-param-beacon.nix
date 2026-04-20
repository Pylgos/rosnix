{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-gmock,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  ros2-medkit-beacon-common,
  ros2-medkit-cmake,
  ros2-medkit-gateway,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_medkit_param_beacon";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."ros2_medkit_param_beacon";
  nativeBuildInputs = [ ament-cmake ros2-medkit-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ros2-medkit-beacon-common ros2-medkit-gateway ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libcpp-httplib-dev" "libssl-dev" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ros2-medkit-cmake ];
  propagatedBuildInputs = [ rclcpp ros2-medkit-beacon-common ros2-medkit-gateway ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libcpp-httplib-dev" "libssl-dev" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-gmock ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_medkit_param_beacon" = substituteSource {
      src = fetchgit {
        name = "ros2_medkit_param_beacon-source";
        url = "https://github.com/ros2-gbp/ros2_medkit-release.git";
        rev = "57083276cb32167d970e8c3885f1dfe301747467";
        hash = "sha256-xZ09f9Z7XxuMznMRT3M4fP+ZgYiMNRBDJL/0W84JJ+M=";
      };
    };
  });
  meta = {
    description = "Parameter-based beacon discovery plugin for ros2_medkit gateway";
  };
})
