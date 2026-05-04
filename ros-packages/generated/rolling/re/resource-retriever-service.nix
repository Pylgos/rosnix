{
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  resource-retriever-interfaces,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "resource_retriever_service";
  version = "0.0.1-2";
  src = finalAttrs.passthru.sources."resource_retriever_service";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp resource-retriever-interfaces ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rclcpp resource-retriever-interfaces ];
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "resource_retriever_service" = substituteSource {
      src = fetchgit {
        name = "resource_retriever_service-source";
        url = "https://github.com/ros2-gbp/resource_retriever_service-release.git";
        rev = "13bec337529416e296895dd3ec9b0ac6444ddfec";
        hash = "sha256-r7xScAi3JEEbK3f+hBMjTb01kwfu+QltWXTOcepzbS8=";
      };
    };
  });
  meta = {
    description = "An in memory implementation of the resource_retriever_interfaces service.";
  };
})
