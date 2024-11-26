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
  pname = "examples_rclcpp_async_client";
  version = "0.19.4-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_async_client";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_async_client" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_async_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "8a61aae631e4a7b75eaec9385bf64d272e487dc3";
        hash = "sha256-0iq4XGvRdCCPBT06auHiCmfr+gES26/yu36Ccrfp6Xs=";
      };
    };
  });
  meta = {
    description = "Example of an async service client";
  };
})
