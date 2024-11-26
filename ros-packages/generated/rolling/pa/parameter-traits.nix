{
  ament-cmake,
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
  rsl,
  substituteSource,
  tcb-span,
  tl-expected,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "parameter_traits";
  version = "0.3.9-1";
  src = finalAttrs.passthru.sources."parameter_traits";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rsl tcb-span tl-expected ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "parameter_traits" = substituteSource {
        src = fetchgit {
          name = "parameter_traits-source";
          url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
          rev = "ca9db0d179599716b0a08b74711ee4b28f136b65";
          hash = "sha256-OofRucWCR7Erd7bxhGS+vD5BsuShAAyXY9RHNwhhqiw=";
        };
      };
    });
  };
  meta = {
    description = "Functions and types for rclcpp::Parameter";
  };
})
