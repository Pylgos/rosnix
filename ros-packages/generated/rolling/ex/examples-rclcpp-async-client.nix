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
  version = "0.20.4-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_async_client";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_async_client" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_async_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "ae28da4964eae43416c1756351f3421cfbadce53";
        hash = "sha256-zEOYewo2ufPdO46po1DswN+m+b8PBblhjYrNjDsZlvk=";
      };
    };
  });
  meta = {
    description = "Example of an async service client";
  };
})
