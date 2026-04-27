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
  version = "15.2.2-1";
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
        rev = "ad4d709be3a8b269b1a975366560b6d06264ef58";
        hash = "sha256-cjCKSkO5hLbXlEiTY+saGF01b3uMTBw7wLtTos1qeGI=";
      };
    };
  });
  meta = {
    description = "\n    Example plugin for RViz - documents and tests RViz plugin development\n  ";
  };
})
