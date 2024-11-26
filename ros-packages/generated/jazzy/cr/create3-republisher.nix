{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  irobot-create-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "create3_republisher";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."create3_republisher";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs irobot-create-msgs nav-msgs rclcpp rclcpp-action sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "create3_republisher" = substituteSource {
        src = fetchgit {
          name = "create3_republisher-source";
          url = "https://github.com/ros2-gbp/create3_examples-release.git";
          rev = "7eafd3076f8219e69fad2657f99138711a72c25d";
          hash = "sha256-vMmlNZLCp2fmNzFgrxpu5W9eWVHXlQ7OrimLlsSMH48=";
        };
      };
    });
  };
  meta = {
    description = "C++ action server exposing a non-systematic coverage behavior";
  };
})
