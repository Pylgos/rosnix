{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav2-bringup,
  navigation2,
  rosSystemPackages,
  rviz2,
  slam-toolbox,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ffw_navigation";
  version = "1.1.16-1";
  src = finalAttrs.passthru.sources."ffw_navigation";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ nav2-bringup navigation2 rviz2 slam-toolbox ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nav2-bringup navigation2 rviz2 slam-toolbox ];
  passthru.sources = mkSourceSet (sources: {
    "ffw_navigation" = substituteSource {
      src = fetchgit {
        name = "ffw_navigation-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "cdb5f52c2aa416bd776b0be898464beb2e9a941a";
        hash = "sha256-yWgdPpQGx+R6Ex+G599Yaao1iGUZZxdZwgSv3YqHPzo=";
      };
    };
  });
  meta = {
    description = "ffw_navigation";
  };
})
