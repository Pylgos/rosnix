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
  version = "0.19.4-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_client";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_client" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "ec48e85fd9500302ef911a6c8e8083aea9134d67";
        hash = "sha256-wPicBMGjRRmUPFCsxsE4DsIXPtB3+Qqm+QRtLbhkDc4=";
      };
    };
  });
  meta = {
    description = "Examples of minimal service clients";
  };
})
