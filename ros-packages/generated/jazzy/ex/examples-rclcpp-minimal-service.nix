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
  pname = "examples_rclcpp_minimal_service";
  version = "0.19.4-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_service";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "examples_rclcpp_minimal_service" = substituteSource {
        src = fetchgit {
          name = "examples_rclcpp_minimal_service-source";
          url = "https://github.com/ros2-gbp/examples-release.git";
          rev = "7608f6207925ceaec3e0ad3a65d7e1a5cbbd663f";
          hash = "sha256-TK40aRRYWs3kQbrTRrkP0Hpjoez1wQ+pxCXkq44ckFE=";
        };
      };
    });
  };
  meta = {
    description = "A minimal service server which adds two numbers";
  };
})
