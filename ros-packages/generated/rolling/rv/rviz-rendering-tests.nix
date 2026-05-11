{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  resource-retriever,
  rosSystemPackages,
  rviz-rendering,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_rendering_tests";
  version = "16.0.0-1";
  src = finalAttrs.passthru.sources."rviz_rendering_tests";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ resource-retriever rviz-rendering ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qt-base-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ resource-retriever rviz-rendering ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qt-base-dev" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-index-cpp ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_rendering_tests" = substituteSource {
      src = fetchgit {
        name = "rviz_rendering_tests-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "fbdc0c4c0f60d3cd0ad4650425b79e4930574402";
        hash = "sha256-VKVTpS1SJA9s3CvRyvOTZgF+qIyw+S1+KfnSnoD6SZM=";
      };
    };
  });
  meta = {
    description = "\n    Example plugin for RViz - documents and tests RViz plugin development\n  ";
  };
})
