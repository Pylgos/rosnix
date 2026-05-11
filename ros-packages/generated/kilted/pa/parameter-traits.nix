{
  ament-cmake,
  ament-cmake-gtest,
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
  version = "0.7.3-1";
  src = finalAttrs.passthru.sources."parameter_traits";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rsl tcb-span tl-expected ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rsl tcb-span tl-expected ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "parameter_traits" = substituteSource {
      src = fetchgit {
        name = "parameter_traits-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "6bb70b95f126732820a1df2edc9f7b8eb90f2e29";
        hash = "sha256-d/PMHfFr4PvwiNOT9YrZ5KErs4GFqC5O+3q35l2ERBA=";
      };
    };
  });
  meta = {
    description = "Functions and types for rclcpp::Parameter";
  };
})
