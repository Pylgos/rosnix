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
  resource-retriever,
  resource-retriever-interfaces,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "resource_retriever_service_plugin";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."resource_retriever_service_plugin";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp resource-retriever resource-retriever-interfaces ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rclcpp resource-retriever resource-retriever-interfaces ];
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "resource_retriever_service_plugin" = substituteSource {
      src = fetchgit {
        name = "resource_retriever_service_plugin-source";
        url = "https://github.com/ros2-gbp/resource_retriever_service-release.git";
        rev = "df6823d651b653795dbb83f69d878050e7ea3e88";
        hash = "sha256-H4riayDVhMhWcbFrzYboPUIRjRyL4657GfRyKUuVw6o=";
      };
    };
  });
  meta = {
    description = "A resource retriever plugin that relies on talking to a service (specified by resource_retriever_interfaces) for retrieving resources like meshes.";
  };
})
