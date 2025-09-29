{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-clang-format,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "parameter_expression";
  version = "0.0.2-1";
  src = finalAttrs.passthru.sources."parameter_expression";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ];
  propagatedNativeBuildInputs = [ rclcpp std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "muparser" "pkg-config" ]; };
  buildInputs = [ ament-cmake ament-cmake-auto ];
  propagatedBuildInputs = [ rclcpp std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "muparser" "pkg-config" ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "parameter_expression" = substituteSource {
      src = fetchgit {
        name = "parameter_expression-source";
        url = "https://github.com/ros2-gbp/parameter_expression-release.git";
        rev = "42d29cc137e124a6b5f8b14df1d4a08ce40d9e00";
        hash = "sha256-lX8LiRVVQv4AZPMOJFNVPqUvAjXyPzrXfqhqbvEp6hA=";
      };
    };
  });
  meta = {
    description = "Using mathematical expression in ROS 2 parameter";
  };
})
