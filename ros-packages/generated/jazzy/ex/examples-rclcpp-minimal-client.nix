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
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "examples_rclcpp_minimal_client";
  version = "0.19.5-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_client";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ example-interfaces ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_client" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "e401f90d52504ad57f4f80958b66a264a9d22500";
        hash = "sha256-T7c6vj6UhCH323uzIys7ZiLkhCFM5tXQuIjLanwXPwQ=";
      };
    };
  });
  meta = {
    description = "Examples of minimal service clients";
  };
})
