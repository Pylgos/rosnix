{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rcutils,
  rosSystemPackages,
  rviz-common,
  rviz-ogre-vendor,
  rviz-rendering,
  std-msgs,
  substituteSource,
  tf2,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_visual_testing_framework";
  version = "14.3.3-1";
  src = finalAttrs.passthru.sources."rviz_visual_testing_framework";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-cmake-gtest ];
  propagatedBuildInputs = [ geometry-msgs rclcpp rcutils rviz-common rviz-ogre-vendor rviz-rendering std-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rviz_visual_testing_framework" = substituteSource {
        src = fetchgit {
          name = "rviz_visual_testing_framework-source";
          url = "https://github.com/ros2-gbp/rviz-release.git";
          rev = "58df4bd0dca47eaf1909f46a3f049c646dedcde8";
          hash = "sha256-BM5uutvnGGJuWbEzfaVkpcp8VoivA6u3POOaDlpEl+E=";
        };
      };
    });
  };
  meta = {
    description = "3D testing framework for RViz.";
  };
})
