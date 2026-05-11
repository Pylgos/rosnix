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
  version = "1.0.0-1";
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
        rev = "2c6f07952634fbd780acfeed940cf34928ded970";
        hash = "sha256-vaF5TVH/t6/w+Xgro5IuxKH5xs1VAupftNuJdbeL/GA=";
      };
    };
  });
  meta = {
    description = "An in memory implementation of the resource_retriever_interfaces service.";
  };
})
