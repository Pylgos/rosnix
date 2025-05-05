{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  pluginlib,
  rosSystemPackages,
  rviz-common,
  rviz-rendering,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "snowbot_operating_system";
  version = "0.1.2-5";
  src = finalAttrs.passthru.sources."snowbot_operating_system";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-cmake-ros geometry-msgs pluginlib rviz-common rviz-rendering ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-ros geometry-msgs pluginlib rviz-common rviz-rendering ];
  checkInputs = [ ament-cmake-clang-format ];
  passthru.sources = mkSourceSet (sources: {
    "snowbot_operating_system" = substituteSource {
      src = fetchgit {
        name = "snowbot_operating_system-source";
        url = "https://github.com/ros2-gbp/snowbot_release.git";
        rev = "df8b6b2679855c245fb9cb9e6f80612438815599";
        hash = "sha256-jsc6W+E4XVtTLGd+ZSn45ChfZmV6/c9nUg1FpqA6d8s=";
      };
    };
  });
  meta = {
    description = "The weather outside is frightful";
  };
})
