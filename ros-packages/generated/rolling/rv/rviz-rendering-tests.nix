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
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_rendering_tests";
  version = "15.1.9-1";
  src = finalAttrs.passthru.sources."rviz_rendering_tests";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ resource-retriever rviz-rendering ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ resource-retriever rviz-rendering ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-index-cpp ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_rendering_tests" = substituteSource {
      src = fetchgit {
        name = "rviz_rendering_tests-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "e71f527b7e61b64ef922dc4b0a1090f1154319fd";
        hash = "sha256-fm8XbvvFJi/sf9K2eYr0c6WH17tOggzNkBc+7eiTuTg=";
      };
    };
  });
  meta = {
    description = "\n    Example plugin for RViz - documents and tests RViz plugin development\n  ";
  };
})
